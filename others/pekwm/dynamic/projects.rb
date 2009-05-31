#!/usr/bin/env ruby1.8

require "find"

# main function which set the name and command
def actions(name, exrc = name)
  name = File.basename(name)
  FileTest.zero?(exrc) ? cmd = "gvim" : cmd = "gvim -S"
  puts %Q|Entry = "#{name}" { Actions = "Exec #{cmd} #{exrc}" }|
end

# iterate across directories in ~/projects/
Find.find("#{ENV['HOME']}/projects/") do
  |file|
  if File.basename(file) == '.exrc'
    name = file.sub(/(\w+)\/\.exrc/, '\1')
    actions(name, file) 
  end
end

# iterate across files in ~/projects/all/
Dir["#{ENV['HOME']}/projects/all/*"].each do
  |file|
  actions(file)
end
