# Chef recipes
# https://docs.chef.io/workstation/ctl_chef/#chef-generate-recipe

case node[:platform]
when 'ubuntu'
    execute "apt-get-update" do
        command "apt-get update"
    end
when 'redhat'
    execute "yum check-update" do
        command "yum check-update"
    end
end
#" yum check-update"
  
include_recipe '::apache'
include_recipe '::database'
include_recipe '::wordpress'