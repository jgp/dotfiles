#!/usr/bin/env ruby1.8

Dir["#{ENV['HOME']}/TODO/*"].each do
  |file|
  name = File.basename(file)
  puts %Q|Entry = "#{name}" { Actions = "Exec gvim #{file}"}|
end
