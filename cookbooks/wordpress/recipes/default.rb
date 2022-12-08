# Chef recipes
# https://docs.chef.io/workstation/ctl_chef/#chef-generate-recipe
#apt_update "update_apt_cache"

include_recipe '::apache'
include_recipe '::database'
include_recipe '::wordpress'