##################################
# Module: recursion.rb           #
# Author: Botanicus              #
# knava.bestvinensis@gmail.com   #
# Version: 0.1 alpha             #
# Description: This module is    #
# something like Ruby "find"     #
# library, but it can directly   #
# return openbox menu.           #
##################################

require "yaml"

module Recursion

  def Recursion.recursion(file)
    if FileTest.directory?(file)
      Dir["#{file}/*"].each do
        |file|
        return file
        recursion(file)
      end
    else
      return file
    end
  end

  def Recursion.to_menu(file, command)
    menu = Array.new
    if ! defined?(ind)
      ind = " "
    end
    if FileTest.directory?(file)
      Dir["#{file}/*"].each do
        |file|
        menu.push("#{ind}#{file}:")
        ind += 1
        recursion(file)
      end
    else
      menu.push("#{ind} - #{command} #{file}")
    end
    menu.join("\n")
    menu = YAML::load(menu)
    return menu
  end

end
