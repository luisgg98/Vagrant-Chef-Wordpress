directory "#{node['wordpress']['wordpress_path']}" do
    action :create
end

remote_file "#{node['wordpress']['wordpress_path']}/#{node['wordpress']['wordpress_file']}" do
    source "#{node['wordpress']['ruta_wordpress']}"
    action :create
end

archive_file "#{node['wordpress']['wordpress_path']}/#{node['wordpress']['wordpress_file']}" do
    destination "#{node['wordpress']['wordpress_path']}" 
end

#cookbooks\wordpress\templates\wp-config.php.erb
template "#{node['wordpress']['document_root']}/wp-config.php.erb" do
    source 'wp-config.php.erb'
end


execute 'Extract wordpress' do
    command "tar xzvf #{node['wordpress']['wordpress_path']}/#{node['wordpress']['wordpress_file']}"
    cwd "#{node['wordpress']['wordpress_path']}"
  end

execute "Install WP CLI" do
    command "curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp"
end
  


execute "Configure Wordpress with WP CLI" do
    command "wp core install --url='#{node['wordpress']['wordpress_url']}' --title='#{node['wordpress']['wordpress_title']}' --admin_user='#{node['wordpress']['admin_user']}' --admin_password='#{node['wordpress']['admin_pass']}' --admin_email='#{node['wordpress']['admin_mail']}' --allow-root --path='#{node['wordpress']['document_root']}'"

end
