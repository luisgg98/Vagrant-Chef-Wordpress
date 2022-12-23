
case node[:platform]
when 'ubuntu'
        %w{apache2 ghostscript libapache2-mod-php php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip}.each do |pkg|
            package pkg do
            action :install
            end
        end
        
when 'redhat'
        %w{httpd httpd-tools curl php php-cli php-json php-gd php-mbstring php-pdo php-xml php-mysqlnd php-pecl-zip}.each do |pkg|
            package pkg do
            action :install
            end
        end
end


case node[:platform]
when 'ubuntu'
    template "#{node['wordpress']['apache_site_path']}/wordpress.conf" do
        source 'virtual-hosts.conf.erb'
    end

when 'redhat'
    template "#{node['wordpress']['httpd_site_path']}/wordpress.conf" do
            source 'virtual-hosts.conf.erb'
    end

end

case node[:platform]
when 'redhat'
    execute "restart-httpd" do
        command "systemctl restart httpd"
    end
when 'ubuntu'
    execute "enable-mod_rewrite" do
        command 'a2enmod rewrite'
    end

    execute "enable-wordpress-site" do
        command "a2ensite wordpress && a2dissite 000-default"
    end

    execute "restart-apache" do
        command "service apache2 reload"
    end
end

