#!/usr/bin/env ruby1.8

#################################
# Script: Kill                  #
# Author: Botanicus             #
# knava.bestvinensis@gmail.com  #
# Version: 0.8 alfa             #
# Description: This script      #
# creates a pipe-menu with the  #
# most annoying processes, and  #
# you can kill them             #
# (click on it)                 #
#################################

require "yaml"

class KillMenu
  attr_reader :menu

  def initialize(psaux, type)
    @psaux = psaux
    case type.downcase
    when 'ram', 'mem'
      @column = 4
    when 'cpu'
      @column = 3
    end
  end

  def sort(x)
    tmp = Hash.new
    @psaux.each do
      |line|
      line = line.split(/ ?~~> ?/)
      tmp[line[@column].to_f] = line[0..3] # return float => array
    end
    tmp = tmp.sort.reverse
    @top = tmp[0..(x-1)]
    # 'cause ruby (and other languages) counts from 0, not from 1 as people count
  end

  def to_menu(kill_cmd_user, kill_cmd_admin)
    @menu = Array.new
    @top.each do
      |values|
      # cpu/mem, name, 
      cpu_or_ram = values[0]
      owner      = values[1][0]
      pid        = values[1][1]
      process    = values[1][2]
      if process =~ /\w\//
        process = File.basename(process)
      end
      label      = "#{process} (#{cpu_or_ram}%)"
      #if owner != ENV['USER'] or owner != ENV['UID']
        # FIXME: ENV['UID'] doesn't works!
      if owner == 'root' # only as long as the problem isn't solve
        command = kill_cmd_admin
      else
        command = kill_cmd_user
      end
       command = "#{command} #{pid}"
      @menu.push([label, command])
    end
  end

end

# load the configuration
config = YAML::load(File.open("#{ENV['HOME']}/.config/openbox/pipe/etc/kill.yml"))

# initialization
psaux = `ps aux | awk '{print $1, "~~>", $2, "~~>", $11, "~~>", $3, "~~>", $4, "~~>"}'`
psaux = psaux.split("\n")
psaux.shift 
# 'cause of the first line contains only info what does mean each column

# cpu
cpu = KillMenu.new(psaux, 'cpu')
cpu.sort(config['numbers_of_items'])
cpu.to_menu(config['kill_user'], config['kill_admin'])

# ram
ram = KillMenu.new(psaux, 'ram')
ram.sort(config['numbers_of_items'])
ram.to_menu(config['kill_user'], config['kill_admin'])

# menu
menus = {'RAM' => ram.menu, 'CPU' => cpu.menu}

# Here we can't use the menu.rb library 'cause we need have it sorted,
# so we need to use array instead of hash.
menus.each do
  |name,menu|
  puts %Q|Submenu = "#{name}" {|
  menu.each do
    |name,command|
    puts %Q|Entry = "#{name}" { Actions = "Exec #{command}" }|
  end
  puts "}"
end
