#!/usr/bin/env ruby

#################################
# Script: gtk_bookmarks         #
# Author: Botanicus             #
# knava.bestvinensis@gmail.com  #
# Version: 1 stable             #
# Description: This pipe-menu   #
# creates a menu with your      #
# nautilus or thunar bookmarks. #
#################################

menu_home = "#{ENV['HOME']}/.config/openbox/pipe"

require "#{menu_home}/lib/menu"
require "yaml"

config = YAML::load(File.open("#{menu_home}/etc/gtk_bookmarks.yml"))

gtk_file  = File.open("#{ENV['HOME']}/.gtk-bookmarks", "r")
gtk_items = Hash.new


gtk_file.each do
  |line|
  line.sub!(/file:../,"")
  line.chomp!
  gtk_items[File.basename(line)] = "#{config['file_manager']} #{line}"
end

gtk_menu = PipeMenu.new
gtk_menu.menu(gtk_items)
gtk_file.close
