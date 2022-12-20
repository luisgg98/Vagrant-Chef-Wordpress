require'spec_helper'

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