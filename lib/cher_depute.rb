require 'nokogiri'
require 'open-uri'

html= Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/tableau"))

url = []
puts html.search("td/a")
 

puts url
