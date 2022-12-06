require 'spec_helper'

describe 'wordpress::apache' do
  package_checks = {
    'ubuntu' => {
      '16.04' => ['apache2'],
      '18.04' => ['apache2'],
      '20.04' => ['apache2'],
    },
    'debian' => {
      '9.13' => ['apache2'],
      '10'   => ['apache2'],
      '11'   => ['apache2'],
    },
  }
  
  package_checks.each do |platform, versions|
    versions.each do |version, packages|
      packages.each do |package_name|
        it "should install #{package_name} on #{platform} #{version}" do
          chef_run = ChefSpec::SoloRunner.new(platform: platform, version: version, file_cache_path: '/var/chef/cache') do |node|
            #node.normal['vim']['install_method'] = 'package '
          end.converge(described_recipe)
          expect(chef_run).to install_package(package_name)
        end
      end
    end
  end
end
