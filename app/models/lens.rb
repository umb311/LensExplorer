class Lens < ApplicationRecord

    # https://zenn.dev/goldsaya/articles/625bdf837c1c68

    has_many :lens_tags, dependent: :destroy
    has_many :tags, through: :lens_tags

    def self.ransackable_attributes(auth_object = nil)
        ["model_number", "name", "stabilization", "teleconverter_14x", "teleconverter_20x", "lens_type"]
    end

    def save_lens_tags(tags)
        # タグが存在していれば、タグの名前を配列として全て取得
        current_tags = self.tags.pluck(:name) unless self.tags.nil?

        # 現在取得したタグから送られてきたタグを除いてoldtagとする
        old_tags = current_tags - tags

        # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
        new_tags = tags - current_tags

         # 古いタグを消す
        old_tags.each do |old_name|
            self.tags.delete Tag.find_by(name:old_name)
        end
        
        # 新しいタグを保存
        new_tags.each do |new_name|
            tag = Tag.find_or_create_by(name:new_name)
            self.tags << tag
        end
    end
end