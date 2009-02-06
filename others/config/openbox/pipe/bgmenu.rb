#!/usr/bin/env ruby

# USAGE
# Create the configuration file ~/.config/openbox/bgmenurc
# Each line in this file should follow the following format:
#  /directory/of/images mode
#
# The 'mode' part should be replaced with 'full', 'tile', or 'center', 
# depnding on how you want the image to be set.
#
# In your openbox3 menu file, include the following line:
# <menu id="bg-menu" label="Backgrounds" execute="location/bgmenu.rb"/>
# If you are using openbox with GNOME, then include this line:
# <menu id="bg-menu" label="Backgrounds" execute="location/bgmenu.rb --gnome"/>
#

require "lib/menu"

class Bgmenu
  def initialize(rcfile)
    @rcfile = rcfile
    @dirs = Array.new
    @menu = Array.new
    getconf
    generate
  end
  def getconf
    File.foreach(@rcfile) do |line|
      unless line =~ /^#/
        @dirs.push([$1, $2]) if line =~ /^(.*)\s+(full|tile|center|centre)$/i
      end
    end
  end
  def generate
    @dirs.each do |info|
      @menu.push Bgdir.new(info[0], info[1])
    end
  end
  def print
    puts "<openbox_pipe_menu>"
    @menu.each do |item|
      item.print 
    end
    puts "</openbox_pipe_menu>"
  end
end
class Bgdir
  def initialize(dir, type)
    @dirname = File.expand_path(dir)
    @menu = Array.new
    @mode = findtype type
    generate
    @menu.sort!
  end
  def generate
    /.*\/(.*)$/i =~ @dirname
    @easyname = $1
    Dir.foreach(@dirname) do |filename|
      if filename =~ /(.*)\.(png|jpg|jpeg|gif|xpm|tiff|bmp)$/i 
        @menu.push Bgitem.new(filename, $1)
      end
    end
  end
  def findtype(type)
    if $*.to_s =~ /gnome/
      case type
        when "full" then "stretched"
        when "tile" then "wallpaper"
        when "centre" then "centered"
        when "center" then "centered"
        else "centered"
      end
    else
      case type
        when "full" then "-f"
        when "tile" then "-t"
        when "centre" then "-c"
        when "center" then "-c"
        else "-c"
      end
    end
  end
  def print
    puts "<menu id=\"bgmenu #{@easyname}\" label=\"#{@easyname}\">"
    @menu.each do |item|
      puts "<item label=\"#{item.easyname}\">"
      if ! ( $*.to_s =~ /gnome/ )
        puts " <action name=\"execute\"><execute>feh --bg-scale \"#{@dirname}/#{item.filename}\"</execute></action>"
      #fehbg = File.open("w", "/home/botanicus/.fehbg")
      #fehbg.puts("feh --bg-scale \"#{@dirname}/#{item.filename}")
        puts " <action name=\"execute\"><execute>feh --bg-scale #{@mode}</execute></action>"
      else
        puts " <action name=\"execute\"><execute>bsetbg #{@mode} \"#{@dirname}/#{item.filename}\"</execute></action>"
      end
      puts "</item>"
    end
    puts "</menu>"
  end
end
class Bgitem
  include Comparable
  attr_reader :filename, :easyname
  def <=>(another)
    @filename <=> another.filename
  end
  def initialize(filename, easyname)
    @filename = filename
    @easyname = easyname
  end
end

# *********** OWN PROGRAM ************** #
$= = true
menu = Bgmenu.new(File.expand_path("~/.config/openbox/bgmenurc"))
menu.print
