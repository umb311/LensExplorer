require 'nokogiri'
require 'open-uri'

# 対象のURL
# url = "https://www.sony.jp/ichigan/products/SELP1635G/"
url = "https://www.sony.jp/ichigan/lineup/e-lens.html"

# open-uriを明示的に有効化
OpenURI::Buffer::StringMax = 0

doc = Nokogiri::HTML(URI.open(url))

nodes = doc.css(".s5-listItem4__mainLink")

nodes.each do |node|
    puts node[:href]
end

# nodes = doc.xpath('//table/tr')

# nodes.each do |node|
#     th = node.xpath("./th").text
#     td = node.xpath("./td").text
#     puts th, td
# end