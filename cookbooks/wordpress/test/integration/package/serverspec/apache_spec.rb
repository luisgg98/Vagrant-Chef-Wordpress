# PRIMERA PRUEBA

# ejecutar => kitchen test package-ubuntu-1804

# require 'spec_helper'

# describe package('vim') do 
#     it {should be_installed} 
# end

# describe command('vim --version') do
#     its (:stdout) {should match /VIM - Vi IMproved/} 
# end

# SEGUNDA PRUEBA TRAS EJECUTAR kitchen converge package-ubuntu-1804

# ejecutar => kitchen verify package-ubuntu-1804

# Ej de casos de prueba separados para Ubuntu y CentOS. 

require'spec_helper'

if os[:family] == 'ubuntu' 
    describe package('apache2') do 
        it {should be_installed} 
    end
end

if os[:family] =='debian'
    describe package('apache2') do 
        it {should be_installed}
    end

end

describe command('apache2 -v') do
    its (:stdout) {should match /Server version: Apache/} 
end
  