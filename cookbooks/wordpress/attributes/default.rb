default['wordpress']['wordpress_path'] = "/srv/www"
default['wordpress']['wordpress_origin'] = "https://wordpress.org/latest.tar.gz"
default['wordpress']['wordpress_file'] = "latest.tar.gz"
default['wordpress']['document_root'] = "/srv/www/wordpress"
default['wordpress']['apache_site_path'] = "/etc/apache2/sites-available"
default['wordpress']['httpd_site_path'] = "/etc/httpd/sites-available"
default['wordpress']['db_user_password'] = 'wordpress23*'
default['wordpress']['db_name'] = "wordpress"
default['wordpress']['db_user'] = "wordpress"
default['wordpress']['db_db'] = "localhost"
default['wordpress']['wordpress_url'] = 'http://127.0.0.1'
default['wordpress']['wordpress_title'] = 'Herramientas de automatizacion de despliegues: Juan Calzada Diez de Arizaleta, Jaime Martin Gutierrez y Luis Garcia Garces'
    # Admin variables
default['wordpress']['admin_user']='wordpress'
default['wordpress']['admin_pass']='wordpress23*'
default['wordpress']['admin_mail']='devops@gmail.com'

