require'spec_helper'

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
