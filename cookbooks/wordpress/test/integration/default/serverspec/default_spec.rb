require'spec_helper'

if os[:family] == 'ubuntu' 
  describe package('apache2') do 
      it {should be_installed} 
  end
end

if os[:family] =='redhat'
  describe package('httpd') do 
      it {should be_installed}
  end
end


if os[:family] == 'ubuntu' 
  describe package('mysql-server') do 
      it {should be_installed} 
  end
end

if os[:family] =='redhat'
  describe package('mysql-server') do 
      it {should be_installed}
  end
end


describe command('mysql -u root -pmypassword -e "SHOW DATABASES"') do
  its(:stdout) { should match /wordpress/ }
end

if os[:family] == 'ubuntu' 
  describe command('php -v') do
      its (:stdout) {should match /PHP/}
  end
end

if os[:family] =='redhat'
  describe command('php -v') do
      its (:stdout) {should match /PHP/}
  end
end


if os[:family] == 'ubuntu' 
  describe file('/srv/www/wordpress/wp-settings.php') do 
      it { should exist } 
  end
end

if os[:family] =='redhat'
  describe file('/srv/www/wordpress/wp-settings.php') do 
    it { should exist }
  end
end

if os[:family] == 'ubuntu' 
  describe command('curl http://0.0.0.0:80') do 
      its(:stdout) { should match /""/ } 
  end
end

if os[:family] =='redhat'
  describe command('curl http://0.0.0.0:80') do 
    its(:stdout) { should match /""/ } 
  end
end
