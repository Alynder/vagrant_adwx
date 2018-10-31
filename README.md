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

```sh
Vagrant.configure("2") do |config|
  config.vm.box = "osname"
end
```

In the case used in this example the os was `"bento/ubuntu-16.04"`




Pull and run vagrant up
