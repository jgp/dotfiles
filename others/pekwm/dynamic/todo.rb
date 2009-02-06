#!/usr/bin/env ruby

Dir["#{ENV['HOME']}/TODO/*"].each do
  |file|
  name = File.basename(file)
  puts %Q|Entry = "#{name}" { Actions = "Exec gvim #{file}"}|
end
