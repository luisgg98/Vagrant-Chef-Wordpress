# Vagrant-Chef-Wordpress
We are going to write some recipes that make sure Vim is installed, and we will use the sources or the official packages.


1) See the file "recipes/default.rb" and follow the instructions.

2) The most appropriate way to support different platforms with different package names from Chef is by using the helper function value_for_platform which, from a data structure, returns a value corresponding to the platform on which the recipe runs. Thus, depending on this value, we can determine the packages to install on each platform "recipes/package.rb".

3) The installation from the vim source code would also be simple since, apart from installing the necessary basic dependencies, the only thing to do in the recipe is to download the desired version of the source code, and run the make command.

4) Open the "spec/default_spec.rb" and explain it.

5) "spec/package_spec.rb" => recipe to test the recipe "package.rb".




To run the unit tests, execute the following command from the "vim_tests_chef" folder. The "Policyfile.rb" file must exist.

chef exec rspec -p to see the time of execution of the tests

-> The 2 tests are executed from:
/unit/recipes/default_spec.rb
/unit/recipes/package_spec.rb

Try to put "default['vim']['install_method'] = 'package'" in the file "attributes/default.rb" and run "chef exec rspec" again.

You get a "WARN: A source recipe does not exist for the platform_family: debian" because in line 34 of the "default_spec.rb" is set -> platform 'ubuntu'.
Put platform 'aix' and it will give another warning.
More platforms => https://github.com/chefspec/fauxhai/blob/main/PLATFORMS.md

More examples: https://docs.chef.io/workstation/chefspec/

----------------------------------------------------
INTEGRATION TESTS
-------------------------------------------------------
To verify the configuration and see a summary of all available instances 

kitchen list

Test Kitchen is providing us with four instances: each suite against each platform defined in the configuration file. These instances have not been created yet, so we are going to write some test cases in order to test them against these instances in the next section.

Check the correct operation by passing the name of the instance to be tested

kitchen test package-ubuntu-1804 => run the tests of /test/integration/package/serverspec/vim_spec.rb

More examples: https://kitchen.ci/docs/getting-started/introduction/

Translated with www.DeepL.com/Translator (free version)