require'spec_helper'

describe command('apache2 -v') do
  its(:stdout) {should match /Server version: Apache/} 
  its(:stdout) {should match /Server built:/}
end
