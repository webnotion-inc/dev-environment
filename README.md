### Short introduction
This development environment setup downloads and configures docker inside virtual machine using Vagrant and VirtualBox.

This repository contains bellow listed [features](#features-virtual-machine-includes).

### Vocabulary
In this section you can find explanations of the terms used in the README documentation:

- Host machine - your local machine.
- Guest machine or VM (Virtual machine) - the virtual machine created by vagrant using VirtualBox.

### Features Virtual Machine includes
- Installed and configured docker
- Installed and configured NFS, which allows mounting files from Virtual Machine on the host machine. 
- Automatically cloned and grouped projects by the YAML configuration file, which you define in `config.dist/projects.yaml`
- Automatically configured GIT information by your configuration file, which you define in `config.dist/git.yaml`
- Automatically configured SSH keys, which you place in `.ssh` directory.
- Automatically configured `/etc/hosts` file on your host machine by the ip address and hostname defined in `config.dist/projects.yaml` file, which allows you to have custom domains/subdomains by the project.

### Software Requirements
- Vagrant
- VirtualBox

### How to use
- Download and install VirtualBox
- Download and install Vagrant
- Clone this repository
- Put your private and public ssh keys in the .ssh directory. IMPORTANT! Private key file name should be set to `id_rsa` and public key file to `id_rsa.pub`, because in `scripts/setupSSH.sh` script it expects these filenames.
- Place your git information inside `config/git.yaml` file

    ```yaml
    git:
      name: John Doe
      email: john.doe@webnotion.eu
    ```

- Add projects you want to be automatically cloned while bringing virtual machine up in `config/projects.yaml` file by example structure:
    ```yaml
    groups:
      - name: webnotion
        projects:
            - name: webnotion-website
              repositoryUrl: git@github.com:webnotion-inc/webnotion-website.git
              host: webnotion.local
              localIp: 10.24.11.1
    
    ```

  **Group configurable properties:**
  - name - defines directory name, which will be the parent folder for the projects listed in the group.
  
  **Project configurable properties:**
  - name - defines custom folder name for the project, in which repository files will be cloned.
  - repositoryUrl - defines repository url, which uses SSH repository path.
  - host - any hostname you can think. Later on this host name is used as custom subdomain and you will be able to reach the project using that host name.
  - localIp - project ip address you assign for the project in docker-compose.yaml file for the project.

- Rename `config.dist` directory to `config`
- Run `vagrant up` in cloned directory. It starts the virtual machine by the configuration in `Vagrantfile` and runs all the scripts defined in the `init.sh` script
- Run `./mount.sh` script on your host machine to mount files from virtual machine to host machine (you can change the directory path in that file if you want, the default is `~/Desktop/Webnotion/projects`)
- Run `./networking.sh` script on your host machine to configure projects ips and hostnames.
