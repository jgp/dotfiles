#!/usr/bin/env ruby1.8

#################################
# Script: Help                  #
# Author: Botanicus             #
# knava.bestvinensis@gmail.com  #
# Version: 0.1 alpha            #
# Description: This pipe menu   #
# creates a menu with files     #
# from directories mentioned    #
# in etc/helprc.yml             #
#################################

menu_home = "#{ENV['HOME']}/.config/openbox/pipe"

require "#{menu_home}/lib/menu"
require "#{menu_home}/lib/error"
require "yaml"

config = YAML::load(File.open("#{menu_home}/etc/ff_bookmarks.yml"))

class FirefoxBookmarks
  attr_reader :data

  def initialize
    ff_dir = Dir["#{ENV['HOME']}/.mozilla/firefox/*default*"]
    ff_dir = ff_dir.to_s
    begin
      @bookmarks = File.open("#{ff_dir}/bookmarks.html")
    rescue
      message = ErrorMenu.new
      message.error("Firefox directory wasn't found!")
      exit 1
    end
  end

  def get_lines
    @lines = Array.new
    @bookmarks.each do
      |line|
      if line =~ /^ +<DT>(<A HREF="|<H3>)/
        @lines.push(line)
      end
    end
  end

  def get_yaml(max_chars)
    @yaml = Array.new
    @lines.each do
      |line|
      if line =~ /^( +)<DT><H3/ # doesn't works
        @yaml.push("#$1#{title}:")
      elsif line =~ /^( +)<DT><A/
        @yaml.push("- #$1#{name}")
        @yaml.push("- #$1#{url}")
      end
    @yaml = @yaml.join("\n")
    @yaml.gsub!(/<[^>]+/, "")
    @yaml.gsub!(/&/, "&amp;") # 'cause of XML syntax cause error
  end

  def get_data
    @data = YAML::load(@yaml)
  end
      name = line.sub(/>.*<.\/H3/, '\1')
    url  = line.scan(/http:\/\/[^"]+/).to_s
    name = line.scan(/>[^<]*<\/A>/).to_s
    name.sub!(/>([^<]*)<\/A>/, '\1')
    if name == ""
      name = url.sub(/^http:\/\/(.+)/, '\1')
      name.sub!(/\.\w{2,4}/, "")
      name.sub!(/www\./, "")
    end
    name.sub!(/(.{#{max_chars}})/, '\1') if name.length >= max_chars

  def finish
    @bookmarks.close
  end

end

bookmarks = FirefoxBookmarks.new
bookmarks.get_lines
bookmarks.get_yaml(config['max_chars_in_name_in_menu'])
bookmarks.get_data
bookmarks.finish

menu = PipeMenu.new
menu.menu(bookmarks.data)
