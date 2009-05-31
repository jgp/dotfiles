#!/usr/bin/env ruby1.8

=begin
Author: Botanicus
Contact: knava.bestvinensis@gmail.com
Description: Check if all the items in
pekwm menu are installed in your system.
Licence: GPL
=end

commands = Array.new
path = ENV['PATH'].split(":")
menu = File.open("#{ENV['HOME']}/.pekwm/menu")

path.each do
  |pathdir|
  Dir["#{pathdir}/*"].each do
    |command|
    command = File.basename(command)
    commands.push(command)
  end
end

menu.each do
  |line|
  if line =~ /Exec (\w+)/
    if ! commands.include?($1)
      $stderr.puts("Error: command #$1 doesn't exist!")
    end
  end
end
