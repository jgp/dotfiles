#################################
# Library: quick.rb             #
# Author: Botanicus             #
# knava.bestvinensis@gmail.com  #
# Version: 0.1 alpha            #
# Description: This is library  #
# to save pipe-menu. It could   #
# be good idea use it when the  #
# pipe-menu isnt't changing     #
# often or if is too slow.      #
#################################

class SaveMenu

  def initialize(file)
    @file = file
  end

  def save(what)
    @file = File.open(file, 'w')
    @file.puts(what)
  end

  def restore
    if FileTest.exists?(@file)
      @file = File.open(@file)
      @file.each do
        |line|
        puts line
      end
      @file.close
      return true
    else
      return false
    end
  end

end
