# テキストファイル読み込み
File.open("E_lenses.txt", mode = "rt"){|f|
    f.each_line{|line|
        put line
    }
}