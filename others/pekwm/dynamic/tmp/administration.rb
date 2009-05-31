#!/usr/bin/env ruby1.8

##################################
# Script: administration         #
# Author: Botanicus              #
# knava.bestvinensis@gmail.com   #
# Version: 0.1 alpha             #
# Description: This is a pipe    #
# menu for openbox. It create    #
# a menu with yours config       #
# files, which are induction in  #
# ~/.config/openbox/adminrc      #
##################################

menu_home = "#{ENV['HOME']}/.config/openbox/pipe"

require "#{menu_home}/lib/menu"
require "#{menu_home}/lib/recursion"
require "yaml"

config = YAML::load(File.open("etc/adminrc.yml"))

config['user'].each do
  |file|
  Recursion.recursion(file.sub(/\/$/, ''))
end

config['root'].each do
  |file|
  Recursion.recursion(file.sub(/\/$/, ''))
end

menu = PipeMenu.new
