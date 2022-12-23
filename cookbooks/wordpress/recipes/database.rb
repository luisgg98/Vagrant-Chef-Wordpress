package 'mysql-server'
package 'mysql-client'

execute 'Create database and grant access' do
    command "mysql -u root -e \"CREATE DATABASE #{node['wordpress']['db_name']}; CREATE USER #{node['wordpress']['db_user']}@#{node['wordpress']['db_host']} IDENTIFIED BY '#{node['wordpress']['db_user_password']}'; GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON #{node['wordpress']['db_name']}.* TO  #{node['wordpress']['db_user']}@#{node['wordpress']['db_host']}; FLUSH PRIVILEGES;\""
end


case node[:platform]
when 'redhat'
        execute "restart-database" do
            command "systemctl start mysqld"
        end
when 'ubuntu'
        execute "restart-database" do
            command "service mysql restart"
        end
end

#systemctl start mysqld