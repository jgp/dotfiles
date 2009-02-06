#!/usr/bin/env ruby

# Tim Riley <tr@slackzone.org> 2005/10/03
# http://tr.openmonkey.com/pages/openbox
# Wiggle to the rhythm like you just don't care

require 'rexml/document'
require 'cgi'

class RecentFile
  include Comparable
  attr_reader :uri, :timestamp
  def <=>(another)
    @timestamp <=> another.timestamp
  end
  def initialize(uri, timestamp)
    @uri = uri
    @timestamp = timestamp
  end
end

files = Array.new
xml = REXML::Document.new(File.open("#{ENV['HOME']}/.recently-used"))
xml.elements.each("//RecentItem") { |item|
  unless item.elements['Private']
    files << RecentFile.new(item.elements['URI'].text,
                            item.elements['Timestamp'].text)
  end
}

puts "<openbox_pipe_menu>"
files.sort.reverse[0..9].each { |file|
  name = file.uri
  puts "<item label=\"#{CGI.escapeHTML(CGI.unescape(File.basename(name)))}\">"
  puts "  <action name=\"execute\"><execute>gnome-open #{name}</execute></action>"
  puts "</item>"
}
puts "</openbox_pipe_menu>"
