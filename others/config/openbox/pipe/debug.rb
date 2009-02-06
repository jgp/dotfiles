#!/usr/bin/env ruby

#################################
# Script: debug.rb              #
# Author: Botanicus             #
# knava.bestvinensis@gmail.com  #
# Version: 1.0 stable           #
# Description: This pipe-menu   #
# skript is good just for       #
# debugging.                    #
#################################

require "#{ENV['HOME']}/.config/openbox/pipe/lib/error"

debug_file = "#{ENV['HOME']}/.config/openbox/pipe/TMP.xml"
if FileTest.exists?(debug_file)
  file = File.open(debug_file, "r")
  file.each do
    |line|
    puts line
  end
else
  errmenu = ErrorMenu.new
  errmenu.error("There is no file TMP.xml!")
end
