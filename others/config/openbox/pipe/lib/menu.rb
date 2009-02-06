#################################
# Library: menu.rb              #
# Author: Botanicus             #
# knava.bestvinensis@gmail.com  #
# Version: 0.6 alpha            #
# Description: This is library  #
# to prints pipe-menus.         #
#################################

class PipeMenu

  def initialize(max_items_in_menu = 25)
    @max_items_in_menu = max_items_in_menu
  end

  def indent(level)
    @i   = " " * level
    @ii  = @i * 2
    @iii = @i * 3
    @iv  = @i * 4
  end

  # punchline pleasantry with test data type is pretty simple:
  # menu points to other menu or item, which has name (key)
  # and another parameters (value). Value can be Array or String.
  # If the test to Array or String return true, recursion
  # got the deepest point and go up.
  def puts_menu(menu_hash)
    indent(3)
    menu_hash.each do
      |key, value|
      counter = 0 # TODO
      if value.class == Hash
        puts %Q{
        #@i<!-- MENU "#{key.upcase}" -->
        #@i<menu id="#{key}" label="#{key}">}.gsub(/\t/, '')
        puts_menu(value) # the recursion
        puts %Q{
        #@i</menu>}.gsub(/\t/, ''), ""
      elsif value.class == Array or value.class == String
        counter += 1 # TODO
        if counter >= @max_items_in_menu
          counter = 0
          redo
        end
        if value.class == Array
          command = value.join(' ')
        else
          command = value
        end
        puts %Q{
        #@ii<item label="#{key}">
          #@iii<action name="Execute">
            #@iv<execute>#{command}</execute>
          #@iii</action>
        #@ii</item>}.gsub(/\t/, '')
      else
        puts value.class
      end
    end
  end

  # TODO:
  # there's still problem with indenting multiple menu
  # the max items in menu feature must be implemented!

  def menu(*menus)
    puts %Q{<?xml version="1.0" encoding="utf-8"?>
    <openbox_pipe_menu>"}.gsub(/\t/, '')
    if menus.class == Array
      menus.each do
        |menu|
        puts_menu(menu)
      end
    else
      puts_menu(menu)
    end
    puts "\n</openbox_pipe_menu>"
  end

end
