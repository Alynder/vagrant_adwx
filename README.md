# Vagrant Example for beginners

For creating a hello world application.

### What is vagrant?

Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases production parity, and makes the "works on my machine" excuse a relic of the past.

### What this example creates.

This application is just for lifting a small hello world page inside rails. The os used is Ubuntu 16.

### What you will need:
+ Vagrant
+ Oracle Virtual box
+ Text Editor or IDE
+ Ruby on Rails

> Docs on installs 
+ [Vagrant](https://www.vagrantup.com/docs/installation/)
+ [Virtual box](https://www.virtualbox.org/wiki/Downloads)
+ [Ruby on Rails](http://installrails.com/steps/choose_os)
+ [Aton.io IDE](https://atom.io/)
+ [Notepad ++ Text editor](https://notepad-plus-plus.org/download/v7.5.9.html)


#### Project Beginner steps
Next create a directory for the project
In my case I made "Rails_App"

```sh
mkdir Rails_app
cd Rails app
vagrant init
```
Once you run the init command a Vagrant file will be made.

The vagrant file will always consit of the first line

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "osname"
end
```
Once the file is created and saved run:

```sh
vagrant up
```

In the case used in this example the os was `"bento/ubuntu-16.04"`
This will create your vm for testing.

There are multiple [config.vm](https://www.vagrantup.com/docs/vagrantfile/machine_settings.html) options for the machine settings. In this example I user only the networking option to allow port forwarding.

**Before moving forward to the next phase run:** [vagrant destroy](https://www.vagrantup.com/docs/cli/destroy.html) 
_This will remove the vm and allow you to start over_

So we add that in the next config line.

```ruby
  Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "forwarded_port", guest: 3000, host: 9090
  end
```
Save the file and run:

```sh 
vagrant up
```

We now have a vm that has port `3000` in the vm forwarded out to the open world as 9090.
You should now be able to go to `127.0.0.1:9090` on your webbrowser, and see nothing but white on the page.

**Before moving forward to the next phase run:** [vagrant destroy](https://www.vagrantup.com/docs/cli/destroy.html) 
_This will remove the vm and allow you to start over_

#### Adding extra provisioning

The automated provisioning allows you to install the code or run commands as need be during the vm creation.

In this example I used ansible vm provisioning to set up a basic install of ruby on rails with 2 gem builds. I then added an extra shell script to configure the Welcome page to say, `hello world and sorry for the delay`  
_Sorry for the delay is due to this build taking a large amount of time to build_

With the added provisioning we now have this as our vagrant file.

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "forwarded_port", guest: 3000, host: 9090
  ####### Provision #######
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "prov/playbook.yml"
    ansible.verbose = true
  config.vm.provision "shell", path: "script.sh"
  end
end
``` 
Save the file and run:
```sh
vagrant up
```

You should now have a vm up and running with rails and when you put `127.0.0.1:9090` in your webbrowser you will see the webpage says _Hello World, Sorry for the Delay_. As previously stated the build does take a large amount of time to provision.


##### Playbook information

The play book is just built to install the rails application and run the gem bundle installs. This is to make sure that the application has the proper gems _probably more than usual so you can get creative with [bootstrapping](https://launchschool.com/blog/integrating-rails-and-bootstrap-part-1) on rails_

##### Shell script information

This script just creates a rails application and makes the edits to start the front end webpage to say hello world.
You can read the script in this example or you can [build your own with this tutorial](https://www.bogotobogo.com/RubyOnRails/RubyOnRails_HelloWorld_Rails.php)
**Note:** _This front end was made with colors for more fun and creativity_


#### Final notes

Once you have finished running this Vagrant file you should be able to go to `127.0.0.1:9090` and see the hello world message on the front page. I have found that vagrant is fairly easy to work with and has an abundant amount of docs to help you along the way. Vagrant is a great tool if you're looking to work with code in a small staging or development enviroment, any destruction is a non-issue because the enviroment itself is disposable.



### Want to give it a go to see how it works?

Go ahead and clone this repo and run `vagrant up`




Copyright Information
---------------------

Copyright (C) 2018 Jessica Repka

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
