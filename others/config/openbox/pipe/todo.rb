#!/usr/bin/env ruby1.8

##################################
# Script: todo.rb                #
# Author: Botanicus              #
# knava.bestvinensis@gmail.com   #
# Version: 1.0                   #
# Description: This is a pipe    #
# menu for openbox. It create    #
# a menu with files from your    #
# TODO directory.                #
##################################

menu_home = "#{ENV['HOME']}/.config/openbox/pipe"

require "#{menu_home}/lib/menu"
require "yaml"

config  = YAML::load(File.open("#{menu_home}/etc/todo.yml"))
tododir = config['tododir']

todo_items = Hash.new
todo_items['All'] = "-p #{tododir}/*"
# FIXME, still doesn't work! 
# Yeah, it's openbox's problem, 
# but solve it must I... :o

Dir["#{tododir}/*"].each do
  |file|
  if FileTest.directory?(file) # i rekurzivne
  end
  name = file.sub(/^.*\/([^\/]+)$/, '\1')
  todo_items[name] = "#{config['editor']} #{file}"
end

todo = PipeMenu.new
todo.menu(todo_items)
