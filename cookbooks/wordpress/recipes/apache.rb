package 'apache2'

package 'ghostscript'

package 'libapache2-mod-php'

package 'php'

package 'php-bcmath'

package 'php-curl'

package 'php-imagick'

package 'php-intl'

package 'php-json'

package 'php-mbstring'

package 'php-mysql'

package 'php-xml'

package 'php-zip'


template "#{node['wordpress']['apache_site_path']}/wordpress.conf" do
    source 'virtual-hosts.conf.erb'
end

execute "enable-mod_rewrite" do
    command 'a2enmod rewrite'
end

execute "enable-wordpress-site" do
    command "a2ensite wordpress && a2dissite 000-default"
end

execute "restart-apache" do
    command "service apache2 reload"
end
