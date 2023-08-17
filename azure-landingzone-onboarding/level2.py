import argparse
import json
import os
import shutil
import sys

import yaml

target_for_landingzone = f"platform/components"
level2_folders = [".vscode", ".devcontainer", f"bamboo-specs", target_for_landingzone]
dev_container_static_files = ["devcontainer.json", "docker-compose.yml"]
git_static_files = [".gitattributes", ".gitignore", "LICENSE"]
vscode_static_files = ["settings.json"]
readmes_static_file = ["README.md"]
landingzone_level = f"level2/"
OCP_SUB_ID: dict = {"dev": "d269dece-5a7d-4d61-bece-5fd5b1b2add0", "nprd": "356e162f-bdb4-46a1-aaef-a3dd8d820abc",
                    "prd": "802699c5-7d45-4fc6-b84d-536684848510"}

subnet_def: str = """
         SUBNETKEY = {
             name    = "singtel-git-mgmt-SUBNETNAME-ENVIRONMENT-sea-01"
             cidr    = SUBNETCIDR
             SUBNETNSGKEY
         }
         #ADDSUBNETDETAILS
        """

nsg_def: str = """
        NSGNAMEKEY = {
          resource_group_key = "ntwk"
          name               = "singtel-git-ti-mgmt-NSGNAME-nsg-ENVIRONMENT-sea-01"
        
          nsg = [
            {
              name                       = "DenyInternalTCPTraffic"
              priority                   = "4095"
              direction                  = "Inbound"
              access                     = "Deny"
              protocol                   = "Tcp"
              source_port_range          = "*"
              destination_port_range     = "*"
              source_address_prefixes      = VNETPREFIX
              destination_address_prefixes = VNETPREFIX
            },      
            {
              name                       = "DenyInternalUDPTraffic"
              priority                   = "4096"
              direction                  = "Inbound"
              access                     = "Deny"
              protocol                   = "Udp"
              source_port_range          = "*"
              destination_port_range     = "*"
              source_address_prefixes      = VNETPREFIX
              destination_address_prefixes = VNETPREFIX
            }            
        #    {
        #      name                       = "NSGRULENAME"
        #      priority                   = "NSGRULEPRIORITY"
        #      direction                  = "NSGDIRECTION"
        #      access                     = "NSGACCESS"
        #      protocol                   = "NSGPROTOCOL"
        #      source_port_range          = "NSGSOURCEPORTRANGE"
        #      destination_port_range     = "NSGDESTINATIONPORTRANGE"
        #      source_address_prefix      = "NSSOURCEADDRESSSPREFIX"
        #      destination_address_prefix = "DESTINATIONADDRESSPREFIX"
        #    }
          ]
        }
        #ADDNETWORKSECURITYGROUPDEFINITION

"""


def copy_static_files(param, path, target):
    """
    Copies the list of files specific into the target folder
    :param path: source path where the files in the param exist relative to the template root beginning
                 and ending with a slash "/"
    :param param: List of files to copy ['file1','file2','file3']
    :param target: The name of the folder where the files will be copied
    :return: None
    """
    for f in param:
        name = f"{path}{f}"
        shutil.copy(name, target)


def create_landingzone_tfvars(repo, target, env, project):
    """
    Creates the landingzones.yaml file in the new project.  It uses a template and does string replacement
    :param args: Parameters and Data
    :param target: The folder where the landing zones is to be crated
    :return: None
    """
    landingzone_definition = f"{landingzone_level}/landingzone.tfvars"
    with open(landingzone_definition, "r") as f:
        data = f.read()
        data = data.replace("ENVIRONMENT", 'prd' if env == 'preprd' else env)
        data = data.replace("CURRENT_LEVEL_FOLDER", repo)
        data = data.replace("CURRENT_LEVEL", "level2")

    global_var_override = f"{landingzone_level}/global_var_override.tfvars"
    with open(global_var_override, "r") as f:
        global_var_data = f.read()

    # data = data.replace("ENVIRONMENT", args["environment"])

    with open(f"{repo}/{target}/landingzone.tfvars", "w") as f:
        f.write(data)

    with open(f"{repo}/{target}/global_var_override.tfvars", "w") as f:
        f.write(global_var_data)


def update_rg_file(repo, project, env):
    rg_file = f"{landingzone_level}rg.tfvars"
    with open(rg_file, "r") as f:
        rg_data = f.read()

    rg_data = rg_data.replace("SUBDOMAIN", project['sub_domain'])
    rg_data = rg_data.replace("DOMAIN", project['domain'])
    rg_data = rg_data.replace("PROJECT", project['project'])
    rg_data = rg_data.replace("ENVIRONMENT", env)

    with open(f"{repo}/{target_for_landingzone}/rg.tfvars", "w") as f:
        f.write(rg_data)


def update_vnet_file(args, env, repo):
    vnet_dec = """
vnets = {
#ADDVNETDETAILS
}    
    """

    vnet_links = """
    private_dns_vnet_links = {
    #ADDVNETLINKS
    }
    """

    vnet_links_file = f"{landingzone_level}/vnet_zone_links.tfvars"
    with open(vnet_links_file, "r") as f:
        vnet_links_file = f.read()

    vnet_file = f"{landingzone_level}/vnet.tfvars"
    with open(vnet_file, "r") as f:
        vnet_file = f.read()

    nsg_file = f"{landingzone_level}/nsg.tfvars"
    with open(nsg_file, "r") as f:
        nsg_file = f.read()

    for zone in args['zones']:
        if env == zone['env']:
            for index, vnet in enumerate(zone['vnets']):
                vnet_data: str = ""
                vnet_data = vnet_file.replace("RGKEY", "ntwk") \
                    .replace("VNETNAME", vnet['name']) \
                    .replace("ENVIRONMENT", env) \
                    .replace("VNETCIDR", f"{json.dumps(vnet['cidr'])}") \
                    .replace("VNETKEY", vnet['name']) \
                    .replace("VNETINDEX", f"0{vnet['index']}")
                for index, subnet in enumerate(vnet['subnets']):
                    subnet_data: str = ""
                    subnet_data = subnet_def.replace("SUBNETKEY", subnet['name']) \
                        .replace("SUBNETNAME", subnet['name']) \
                        .replace("SUBNETCIDR", f"{json.dumps(subnet['cidr'])}") \
                        .replace("ENVIRONMENT", env)\
                        .replace("SUBNETNSGKEY", "nsg_key = "+'"'+subnet['nsgname'] + '_nsg''"' if subnet['nsgname'] != "NONE" else "")
                    if subnet['nsgname'] != "NONE":
                        nsg_data: str = ""
                        nsg_data = nsg_def.replace("RGKEY", "ntwk") \
                            .replace("NSGNAMEKEY", subnet['nsgname'] + '_nsg') \
                            .replace("NSGNAME", subnet['nsgname']) \
                            .replace("ENVIRONMENT", env) \
                            .replace("VNETPREFIX", f"{json.dumps(vnet['cidr'])}")
                        nsg_file = nsg_file.replace("#ADDNETWORKSECURITYGROUPDEFINITION", nsg_data if subnet['nsgname'] != "NONE" else "#ADDNETWORKSECURITYGROUPDEFINITION")
                    vnet_data = vnet_data.replace("#ADDSUBNETDETAILS", subnet_data)
                vnet_links_data = ""
                vnet_links_data = vnet_links_file.replace("PROJECT", args["project"]) \
                    .replace("ENV", env) \
                    .replace("OCPDNS", 'prd' if env == 'preprd' else env) \
                    .replace("SINGTELDNS", 'prd' if env == 'preprd' else env) \
                    .replace("APPDNS", 'prd' if env == 'preprd' else env) \
                    .replace("OCPSUBID", get_ocp_sub_id('prd' if env == 'preprd' else env)) \
                    .replace("VNET_KEY", vnet["name"])
                vnet_dec = vnet_dec.replace("#ADDVNETDETAILS", vnet_data)
                vnet_links = vnet_links.replace("#ADDVNETLINKS", vnet_links_data)

        with open(f"{repo}/{target_for_landingzone}/nsg.tfvars", "w") as f:
            f.write(nsg_file)

        with open(f"{repo}/{target_for_landingzone}/vnet.tfvars", "w") as f:
            f.write(vnet_dec)

        with open(f"{repo}/{target_for_landingzone}/vnet_zone_links.tfvars", "w") as f:
            f.write(vnet_links)


def get_ocp_sub_id(env):
    for key, value in OCP_SUB_ID.items():
        if key == env:
            return value


def update_hub_connection(args, env, repo):
    virtual_hub_connections = """
virtual_hub_connections = {
#ADDHUBCONNECTIONDETAILS
}
    """

    dns_ruleset_links = """
private_dns_resolver_virtual_network_links = {
#ADDDNSRESOLVERVIRTUALNETWORKLINKSDETAILS
}
    """
    hub_file = f"{landingzone_level}/hub_connection.tfvars"
    dns_ruleset_vlink = f"{landingzone_level}/dnspr_ruleset_vlink.tfvars"
    with open(dns_ruleset_vlink, "r") as f:
        dns_ruleset_vlink = f.read()

    with open(hub_file, "r") as f:
        hub_file = f.read()

    for zones in args['zones']:
        if env == zones['env']:
            for index, vnet in enumerate(zones['vnets']):
                if vnet['hubconnection']:
                    hub_data: str = ""
                    dns_ruleset_data: str = ""
                    hub_data = hub_file.replace("PROJECT", vnet['name']) \
                        .replace("NAMEENVIRONMENT", env) \
                        .replace("ENVIRONMENT", 'prd' if env == 'preprd' else env) \
                        .replace("VNETKEY", vnet['name']) \
                        .replace("HUBINDEXNAME", vnet['name']) \
                        .replace("VNETINDEX", vnet['name']) \
                        .replace("INDEX", f"0{vnet['index']}")
                    virtual_hub_connections = virtual_hub_connections.replace("#ADDHUBCONNECTIONDETAILS", hub_data)

                    dns_ruleset_data = dns_ruleset_vlink.replace("NAMEENVIRONMENT", env) \
                        .replace("ENVIRONMENT", 'prd' if env == 'preprd' else env) \
                        .replace("PROJECT", vnet['name']) \
                        .replace("VNETKEY", vnet['name'])
                    dns_ruleset_links = dns_ruleset_links.replace("#ADDDNSRESOLVERVIRTUALNETWORKLINKSDETAILS",
                                                                  dns_ruleset_data)

            with open(f"{repo}/{target_for_landingzone}/hub_connection.tfvars", "w") as f:
                f.write(virtual_hub_connections)

            with open(f"{repo}/{target_for_landingzone}/dnspr_ruleset_vlink.tfvars", "w") as f:
                f.write(dns_ruleset_links)


def update_vnet_peering(args, env, repo):
    vnet_peering = """
vnet_peerings_v1 = {
#ADDVNETPEERING
}
    """
    vnet_peering_file = f"{landingzone_level}/vnet_peering.tfvars"

    with open(vnet_peering_file, "r") as f:
        vnet_peering_file = f.read()

    for zones in args['zones']:
        if env == zones['env']:
            for index, vnet_peer in enumerate(zones['vnet_peering']):
                vnet_peering_data = ""
                vnet_peering_data = vnet_peering_file.replace("FROMVNETKEY", vnet_peer['from_vnet_key']) \
                    .replace("TOVNETKEY", vnet_peer['to_vnet_key'])
                vnet_peering = vnet_peering.replace("#ADDVNETPEERING", vnet_peering_data)

            with open(f"{repo}/{target_for_landingzone}/vnet_peering.tfvars", "w") as f:
                f.write(vnet_peering)


def update_copy_bamboo_spec_file(registry, env, repo):
    bamboo_spec_file = f"{landingzone_level}/bamboo.yaml"
    sub_id: str = ""
    for zones in registry['zones']:
        if env == zones['env']:
            sub_id = zones['sub_id']
    with open(bamboo_spec_file, "r") as f:
        bamboo_spec_file = f.read()
        bamboo_spec_file = bamboo_spec_file.replace("ENVIRONMENT", env.upper()) \
            .replace("BAMBOOAGENTENV", 'prd' if env == 'preprd' else env.lower())\
            .replace("PROJECTNAME", registry['project'].upper()) \
            .replace("ENVIRONMENT_LABEL", env) \
            .replace("PLANNAME", repo) \
            .replace("SUBSCRIPTION_ID", sub_id)

    with open(f"{repo}/bamboo-specs/bamboo.yaml", "w") as f:
        f.write(bamboo_spec_file)


def create_repository_files(env, registry, repo):
    """
    Creates the files and folders in the landingzone project to create a "project" folder for Terraform
    :param args: Parameters and data
    :return: None
    """
    target_for_landingzone = f"platform/components"

    confirm_folders_exists([".vscode", ".devcontainer", f"bamboo-specs", target_for_landingzone], repo)
    update_rg_file(repo, registry, env)

    copy_static_files(git_static_files, landingzone_level, repo)
    copy_static_files(readmes_static_file, landingzone_level, repo)
    copy_static_files(dev_container_static_files, landingzone_level, f"{repo}/.devcontainer")
    copy_static_files(vscode_static_files, landingzone_level, f"{repo}/.vscode")
    update_copy_bamboo_spec_file(registry, env, repo)

    create_landingzone_tfvars(repo, target_for_landingzone, env, registry["project"])
    update_vnet_file(registry, env, repo)
    update_hub_connection(registry, env, repo)
    update_vnet_peering(registry, env, repo)
    # create_bamboo_specs(args)

    # initialize_git(args)


def confirm_folders_exists(folders, repo):
    """
    Helper function creates the new landing zone CAF project in the parent folder of the current working directory
    It will then set the current working directory to the newly created landing zone folder.
    :param folder: The name of the landing zone to create
    :return: None
    """
    for folder in folders:
        os.makedirs(repo + "/" + folder, exist_ok=True)


def load_registry(repo, env):
    try:
        registry_url = f"{repo}/{env}.yaml"

        with open(registry_url) as r:
            return yaml.safe_load(r)
    except IOError as exc:
        raise IOError(f"Cannot find or load registry: {exc}")
    except yaml.YAMLError as ye:
        raise IOError(f"There is an error reading the registry: {ye}")


def main():
    """
    Create a landingzones project for the following parameters

    -p <portfolio>
    -e <environment>

    It finds the portfolio in the 'singtel-config/accounts-registry.yaml' database for
    details about the accounts

    :return: None
    """
    try:
        parser = argparse.ArgumentParser(description='Build Pipeline for ')
        parser.add_argument('-p', dest='project', required=True,
                            help='The portfolio/ project owning the deployment pipeline')
        parser.add_argument('-r', dest='repository', required=True,
                            help='The bb repository name')
        parser.add_argument('-e', dest='environment', required=True,
                            help='The environment of the pipeline (example: dev, nprd, prd')
        parms = parser.parse_args()
        registry = load_registry(parms.project, parms.environment)
        portfolios = registry['portfolios']
        bb_split=parms.repository.split("-")
        if bb_split[2] == portfolios["sub_domain"] and bb_split[3] == portfolios["project"] and bb_split[1] == portfolios["domain"]:          
          create_repository_files(parms.environment, portfolios, parms.repository)
        else:
          print("Variables don't match values in data file on domain name or subdomain name or project name!")
          sys.exit(-1)   

    except IOError as e:
        print(e)
        sys.exit(-1)


if __name__ == "__main__":
    main()
