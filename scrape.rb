require 'nokogiri'
require 'open-uri'

# 対象のURL
# url = ""

# open-uriを明示的に有効化
OpenURI::Buffer::StringMax = 0

### 全Eマウントレンズへのリンクを取得 ###
def getAllLensLink(url)
    doc = Nokogiri::HTML(URI.open(url))
    
    nodes = doc.css(".s5-listItem4__mainLink")
    
    nodes.each do |node|
        puts node[:href]
    end
end
# getAllLensLink("https://www.sony.jp/ichigan/lineup/e-lens.html")

### 各レンズの仕様を取得 ###
def getLensInfo(url)
    doc = Nokogiri::HTML(URI.open(url))

    nodes = doc.xpath('//table/tr')
    
    nodes.each do |node|
        th = node.xpath("./th").text
        td = node.xpath("./td").text
        puts th, td
    end
end
# getLensInfo("https://www.sony.jp/ichigan/products/SELP1635G/"")

### レンズの仕様を取得 ###
def scrape(url)
    puts "----- scprape : #{url} -----"

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
end

### レンズの画像を取得 ###
def getAllLensImage
    def getImage(url)
        require "fileutils"
        # https://www.sony.jp/ichigan/products/SELP28135G
        model_num = url.slice(/SEL.*/)      # URLから型番を取得。正規表現で"SEL"以降の文字列を抽出
        model_num = model_num.delete("/")   # URL末尾に "/" がある場合削除

        download_dir = "public/images/#{model_num}"
        img_name_path = "#{download_dir}/#{model_num}.jpg"

        FileUtils.mkdir_p(download_dir)     # 画像をDLする画像のディレクトリを作成

        img_url = "https://www.sony.jp/products/picture/#{model_num}.jpg"   # 画像URLを組み立て
        
        URI.open(img_name_path, 'wb') do |output|
            URI.open(img_url) do |data|
                output.write(data.read)
            end
        end
    end

    # テキストファイル読み込み
    File.open("E_lenses.txt", mode = "rt"){|f|
        f.each_line{|line|
            url = line.chomp    # .chompで改行コード削除

            begin
                getImage(url)   # getImageメソッド
            rescue OpenURI::HTTPError => e
                next
            end
        }
    }
end
# getAllLensImage

### SIGMAの全Eマウントレンズへのリンクを取得 ###
def getAllSigmaLensLink(url)
    doc = Nokogiri::HTML(URI.open(url))
    
    nodes = doc.css(".c-content-figure")
    puts nodes
    
    nodes.each do |node|
        puts node[:href]
    end
end
getAllSigmaLensLink("https://www.sigma-global.com/jp/magazine/m_series/others-lenses/sony-e-mount/sigma_emount_lenses/")