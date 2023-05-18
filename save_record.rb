require 'nokogiri'
require 'open-uri'


# 対象のURL
url = "https://www.sony.jp/ichigan/products/SELP1635G/"

# open-uriを明示的に有効化
OpenURI::Buffer::StringMax = 0

doc = Nokogiri::HTML(URI.open(url))

nodes = doc.xpath('//table/tr')


# nodes.each do |node|
for node in nodes
    th = node.xpath("./th").text
    td = node.xpath("./td").text

    name                        = td if th == "名称"
    model_number                = td if th == "型名"
    mount                       = td if th == "レンズマウント"
    focal_length                = td if th == "焦点距離(mm)"
    aperture                    = td if th == "開放絞り　（F値)"
    number_of_aperture_blades   = td if th == "絞り羽根 (枚）"
    angle_of_view               = td if th == "画角　（３５ｍｍ判）"
    minimum_shooting_distance   = td if th == "最短撮影距離 (m)"
    lens_construction           = td if th == "レンズ構成　（群-枚）"
    maximum_magnification       = td if th == "最大撮影倍率　（倍）"
    filter_diameter             = td if th == "フィルター径　(mm)"
    dimensions                  = td if th == "外形寸法　最大径ｘ長さ　(mm)"
    weight                      = td if th == "質量　約　(g)"
end

# puts name, model_number, mount, focal_length, aperture, number_of_aperture_blades, 
# angle_of_view, minimum_shooting_distance, lens_construction, maximum_magnification, filter_diameter, dimensions, weight

lens = Lens.new(name: name)
lens.save