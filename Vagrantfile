Vagrant.configure("2") do |config|
    # Vagrant tutorial
    # HOW TO UNDERSTAND THIS FILE
    # https://javiermartinalonso.github.io/devops/devops/vagrant/2018/02/09/vagrant-vagrantfile.html

	
	config.vm.define "web" do |web|
		web.vm.box = "bento/ubuntu-20.04"
		web.vm.hostname = 'actividadWordpress'

		web.vm.network "private_network", ip: "192.168.33.10"
		#web.vm.network "public_network"

		web.vm.synced_folder "./backup", "/vagrant_data", create: true
		# Example puppet-wordpress
		# https://github.com/example42/puppet-wordpress
		# https://github.com/adullact/puppet-wordpress

		web.vm.provider "virtualbox" do |vb|
			vb.memory = "2048"
		end

		  #
		# View the documentation for the provider you are using for more
		# information on available options.

		# Enable provisioning with a shell script. Additional provisioners such as
		# Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
		# documentation for more information about their specific syntax and use.

		web.vm.provision "shell", path: "./scripts/install.sh"

		   # IMPORTANTE => https://github.com/hashicorp/vagrant/issues/12337
		web.vm.provision :chef_solo do |chef|
			chef.cookbooks_path = "cookbooks"
			chef.add_recipe "wordpress"
			chef.arguments = "--chef-license accept"
			chef.install = false
		end

	end
	

end