# 以下のコマンドで実行可能
# rails runner save_record.rb

require 'nokogiri'
require 'open-uri'
# open-uriを明示的に有効化
OpenURI::Buffer::StringMax = 0


def scrape(url)
    puts "----- scprape : #{url} -----"
    # open-uriを明示的に有効化
    # OpenURI::Buffer::StringMax = 0

    doc = Nokogiri::HTML(URI.open(url))

    nodes = doc.xpath('//table/tr')

    for node in nodes
        th = node.xpath("./th").text
        td = node.xpath("./td").text

        name                        = td if th == "名称"
        model_number                = td if th == "型名"
        mount                       = td if th == "レンズマウント"
        # focal_length                = td if th == "焦点距離(mm)"
        aperture                    = td if th == "開放絞り　（F値)"
        number_of_aperture_blades   = td if th == "絞り羽根 (枚）"
        # angle_of_view               = td if th == "画角　（３５ｍｍ判）"
        # minimum_shooting_distance   = td if th == "最短撮影距離 (m)"
        lens_construction           = td if th == "レンズ構成　（群-枚）"
        maximum_magnification       = td if th == "最大撮影倍率　（倍）"
        filter_diameter             = td if th == "フィルター径　(mm)"
        dimensions                  = td if th == "外形寸法　最大径ｘ長さ　(mm)"
        weight                      = td if th == "質量　約　(g)"

        #lens_type
        if th == "焦点距離(mm)"
            focal_length = td

            # "焦点距離"の文字列内に "-" が入っていればズームレンズと判別可能
            # lens_type : false => ズーム | true => 単焦点
            # td.include?("-") ? lens_type = false : lens_type = true
            if !td.include?("-")
                lens_type = true
                minimum_focusing_distance = focal_length.to_i
                maximum_focusing_distance = focal_length.to_i
            else
                lens_type = false
                focal_length_number = /-/.match(focal_length)
                minimum_focusing_distance = focal_length_number.pre_match.to_i
                maximum_focusing_distance = focal_length_number.post_match.to_i
            end
        end

        # angle_of_view
        if th == "画角　（３５ｍｍ判）"
            angle_of_view = td

            if !td.include?("-")
                minimum_angle_of_view = angle_of_view.slice(/\d+\.?\d*|\d*\.?\d+/).to_f
                maximum_angle_of_view = angle_of_view.slice(/\d+\.?\d*|\d*\.?\d+/).to_f
            else
                angle_of_view_number = /-/.match(angle_of_view)
                minimum_angle_of_view = angle_of_view_number.pre_match.slice(/\d+\.?\d*|\d*\.?\d+/).to_f
                maximum_angle_of_view = angle_of_view_number.post_match.slice(/\d+\.?\d*|\d*\.?\d+/).to_f
            end
        end

        # minimum_shooting_distance
        if th == "最短撮影距離 (m)"
            minimum_shooting_distance = td

            if !td.include?("-")
                minimum_shooting_distance_wide = minimum_shooting_distance.slice(/\d+\.?\d*|\d*\.?\d+/).to_f
                minimum_shooting_distance_tele = minimum_shooting_distance.slice(/\d+\.?\d*|\d*\.?\d+/).to_f
            else
                minimum_shooting_distance_number = /-/.match(minimum_shooting_distance)
                minimum_shooting_distance_wide = minimum_shooting_distance_number.pre_match.slice(/\d+\.?\d*|\d*\.?\d+/).to_f
                minimum_shooting_distance_tele = minimum_shooting_distance_number.post_match.slice(/\d+\.?\d*|\d*\.?\d+/).to_f
            end
        end

        #stabilization
        if th == "手ブレ補正"
            td.include?("-") ? stabilization = false : stabilization = true
        end
        
        #teleconverter_14x
        if th == "テレコンバーター　(1.4x)"
            td == "非対応" ? teleconverter_14x = false : teleconverter_14x = true
        end
        
        #teleconverter_20x
        if th == "テレコンバーター　(2.0x)"
            td == "非対応" ? teleconverter_20x = false : teleconverter_20x = true
        end

        #sensor_size
        if th == "対応撮像画面サイズ"
            td.include?("35mmフルサイズ") ? sensor_size = "FF" : sensor_size = "APS-C"
        end
    end

    lens = Lens.new(
        name: name,
        model_number: model_number,
        mount: mount,
        focal_length: focal_length,
        lens_type: lens_type,
        minimum_focusing_distance: minimum_focusing_distance,
        maximum_focusing_distance: maximum_focusing_distance,
        aperture: aperture,
        number_of_aperture_blades: number_of_aperture_blades,
        angle_of_view: angle_of_view,
        minimum_angle_of_view: minimum_angle_of_view,
        maximum_angle_of_view: maximum_angle_of_view,
        minimum_shooting_distance: minimum_shooting_distance,
        minimum_shooting_distance_wide: minimum_shooting_distance_wide,
        minimum_shooting_distance_tele: minimum_shooting_distance_tele,
        lens_construction: lens_construction,
        maximum_magnification: maximum_magnification,
        filter_diameter: filter_diameter,
        stabilization: stabilization,
        teleconverter_14x: teleconverter_14x,
        teleconverter_20x: teleconverter_20x,
        dimensions: dimensions,
        weight: weight,
        sensor_size: sensor_size
    )

    lens.save
end

# テキストファイル読み込み
File.open("E_lenses.txt", mode = "rt"){|f|
    f.each_line{|line|
        url = line.chomp
        scrape(url)
    }
}