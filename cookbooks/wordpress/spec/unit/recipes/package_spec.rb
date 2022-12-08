require 'spec_helper'
# Chef Tests examples
# https://semaphoreci.com/community/tutorials/unit-tests-for-chef-cookbooks-with-chefspec
describe 'wordpress' do
  package_checks = {
    'ubuntu' => {
      '16.04' => ['apache2','mysql-server','php'],
      '18.04' => ['apache2','mysql-server','php'],
      '20.04' => ['apache2','mysql-server','php'],
    },
    'debian' => {
      '9.13' => ['apache2','mysql-server','php'],
      '10'   => ['apache2','mysql-server','php'],
      '11'   => ['apache2','mysql-server','php'],
    },
  }
  
  package_checks.each do |platform, versions|
    versions.each do |version, packages|
      packages.each do |package_name|
        # Check main package in every recipe

        it "should install #{package_name} on #{platform} #{version}" do
          chef_run = ChefSpec::SoloRunner.new(platform: platform, version: version, file_cache_path: '/var/chef/cache') do |node|

          end.converge(described_recipe)
          expect(chef_run).to install_package(package_name)
        end
      end
    end
  end
end
