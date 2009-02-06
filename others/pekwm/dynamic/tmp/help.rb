#!/usr/bin/env ruby

#################################
# Script: Help                  #
# Author: Botanicus             #
# knava.bestvinensis@gmail.com  #
# Version: 0.1 alpha            #
# Description: This pipe menu   #
# creates a menu with files     #
# from directories mentioned    #
# in etc/helprc.yml             #
#################################

menu_home = "#{ENV['HOME']}/.config/openbox/pipe"

require "#{menu_home}/lib/menu"
require "#{menu_home}/lib/recursion"
require "yaml"
require "find"

config  = YAML::load File.open("#{menu_home}/etc/help.yml")
dirs = config['directories']
help_items = Hash.new

def to_menu(file)
  Find.find(file) do
    |file|
    if FileTest.directory?(file)
      xxx = File.basename(file) = Hash.new
    else
      name = File.basename(file)
      menu = "#{config['command']} #{file}"
    end
  end
end

if dirs.length > 1
  dirs.each do
    |file|
    menu = Hash.new
    menu.push(to_menu(file))
  end
else
  menu = Hash.new
  dirs.each do
    |file|
    menu = to_menu(file)
  end
end

help = PipeMenu.new
help.menu(menu)
