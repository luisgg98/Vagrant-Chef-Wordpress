require'spec_helper'

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