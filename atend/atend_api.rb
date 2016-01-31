require 'rexml/document'
require 'open-uri'

uri = "http://api.atnd.org/events/"
path = "?keyword=ruby"
result = open(uri+path)

doc = REXML::Document.new(result)

doc.elements.each('hash/events/event[1]/description') do |element|
  puts element.text
end
