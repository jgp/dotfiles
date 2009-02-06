#!/usr/bin/env ruby

require 'yaml'

programs = File.open("etc/programs.yml") {|file| YAML::load file}

def proceed(programs)
  programs.each do
    |menu|
    if menu.class == String
      if ENV['PATH'].include?(menu)
        puts %Q|Entry = "#{menu}" { Actions = "Exec #{menu}}"|
      end
    elsif menu.class == Hash
      proceed(menu)
    else
      raise TypeError
      exit 1
    end
  end
end

proceed(programs)
