#!/usr/bin/env ruby1.8

gtk = File.open("#{ENV['HOME']}/.gtk-bookmarks")

gtk.each do
  |item|
  item.chomp!
  name = item.sub(/file:\/\//, "")
  puts %Q(Entry = "#{name}" { Actions = "Exec $FILEMANAGER #{item}" })
end
