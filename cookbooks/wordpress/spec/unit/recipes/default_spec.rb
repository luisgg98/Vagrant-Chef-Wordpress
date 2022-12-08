require 'spec_helper'
# How to make test files
# https://docs.chef.io/workstation/chefspec/
describe 'wordpress::apache' do
    platform 'ubuntu'

    context 'Check PHP installation' do
        it "Correct PHP package installed" do
            expect(chef_run).to install_package("php") 
        end
        it 'Correct execution' do
            expect { chef_run }.to_not raise_error
        end
        
    end

    context 'Check apache installation' do
        it "Correct apache installed" do
            expect(chef_run).to install_package("apache2")
        end

        it 'Correct execution' do
            expect { chef_run }.to_not raise_error
        end
        it "Wordpress configuration file" do
            expect(chef_run).to create_template("/etc/apache2/sites-available/wordpress.conf")
        end

    end

end

#cookbooks\wordpress\recipes\database.rb
describe 'wordpress::database' do
    platform 'ubuntu'

    context 'Check mysql installation' do
        it "Correct mysql installed" do
            expect(chef_run).to install_package("mysql-server")
        end

        it 'Correct execution' do
            expect { chef_run }.to_not raise_error
        end
    end
end

describe 'wordpress::wordpress' do
    platform 'ubuntu'
    context 'Wordpress files' do

        it "wordpress directory is created" do
                expect(chef_run).to create_remote_file("/srv/www/latest.tar.gz")
        end

        it "Wordpress configuration file" do
                expect(chef_run).to create_template("/srv/www/wordpress/wp-config.php")
        end

    end

end
