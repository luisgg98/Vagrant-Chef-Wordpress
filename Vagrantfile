Vagrant.configure("2") do |config|
    # Vagrant tutorial
    # HOW TO UNDERSTAND THIS FILE
    # https://javiermartinalonso.github.io/devops/devops/vagrant/2018/02/09/vagrant-vagrantfile.html
	config.vm.define "ubuntuvm" do |ubuntuvm|
		ubuntuvm.vm.box = "bento/ubuntu-20.04"
		ubuntuvm.vm.hostname = 'actividadWordpressUbuntu'
		ubuntuvm.vm.network "private_network", ip: "192.168.33.10"
		#ubuntuvm.vm.network "public_network"
		ubuntuvm.vm.synced_folder "./backup_ubuntu", "/vagrant_data_ubuntu", create: true
		# Example puppet-wordpress
		# https://github.com/example42/puppet-wordpress
		# https://github.com/adullact/puppet-wordpress
		ubuntuvm.vm.provider "virtualbox" do |vb|
			vb.memory = "2048"
		end
		# View the documentation for the provider you are using for more
		# information on available options.
		# Enable provisioning with a shell script. Additional provisioners such as
		# Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
		# documentation for more information about their specific syntax and use.
		ubuntuvm.vm.provision "shell", path: "./scripts/install_ubuntu.sh"

		   # IMPORTANTE => https://github.com/hashicorp/vagrant/issues/12337
		ubuntuvm.vm.provision :chef_solo do |chef|
			chef.cookbooks_path = "cookbooks"
			chef.add_recipe "wordpress"
			chef.arguments = "--chef-license accept"
			chef.install = false
		end

	end


end