#!/usr/bin/env ruby

#################################
# Script: background.rb         #
# Author: Botanicus             #
# knava.bestvinensis@gmail.com  #
# Version: 0.1 alpha            #
# Description: This pipe-menu   #
# can change backgound on your  #
# desktop.                      #
#################################

menu_home = "#{ENV['HOME']}/.config/openbox/pipe"

require "#{menu_home}/lib/menu"
require "yaml"

config = YAML::load(File.open("#{menu_home}/etc/backgroundrc.yml"))
