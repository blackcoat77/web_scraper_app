require 'nokogiri'
require 'open-uri'

# Select target url in this case from website epijob.com
html_data = open('http://epijobs.com/tagadelic/chunk/1')

# Create Nokogiri object
nokogiri_object = Nokogiri::HTML(html_data)

# Find all elements within clas wrapper tagadelic using xpath
tagcloud_elements = nokogiri_object.xpath("//div[@class='wrapper tagadelic']")

# Find all tag links
tagcloud_elements_links = nokogiri_object.xpath(
              "//div[@class='wrapper tagadelic']/a").map { |link| link['href']
              }

# Loop through each element and show as text
tagcloud_elements.each do |tagcloud_element|
  puts tagcloud_element.text
end

# Find all related links; We can use to_html method too in our loop after
# removing .map..
tagcloud_elements_links.each do |tag_link|
  puts tag_link
end
