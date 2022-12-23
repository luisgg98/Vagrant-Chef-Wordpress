# Recipe basics
# https://help.cmd.com/en/articles/3808795-chef-install-recipe-example
directory "#{node['wordpress']['wordpress_path']}" do
    action :create
end

remote_file "#{node['wordpress']['wordpress_path']}/#{node['wordpress']['wordpress_file']}" do
    source "#{node['wordpress']['wordpress_origin']}"
    action :create
end

#Use the archive_file resource to extract archive files to disk. 
archive_file "#{node['wordpress']['wordpress_path']}/#{node['wordpress']['wordpress_file']}" do
    destination "#{node['wordpress']['wordpress_path']}" 
end


execute 'Extract wordpress' do
    command "tar xzvf #{node['wordpress']['wordpress_path']}/#{node['wordpress']['wordpress_file']}"
    cwd "#{node['wordpress']['wordpress_path']}"
end


template "#{node['wordpress']['document_root']}/wp-config.php" do
    source 'wp-config.php.erb'
end

execute "Install WP CLI" do
    command "curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp"
end
  

execute "Configure Wordpress with WP CLI" do
    command "wp core install --url='#{node['wordpress']['wordpress_url']}' --title='#{node['wordpress']['wordpress_title']}' --admin_user='#{node['wordpress']['admin_user']}' --admin_password='#{node['wordpress']['admin_pass']}' --admin_email='#{node['wordpress']['admin_mail']}' --allow-root --path='#{node['wordpress']['document_root']}'"
end
