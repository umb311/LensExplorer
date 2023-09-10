class Tag < ApplicationRecord
    has_many :lens_tags, dependent: :destroy
    has_many :tags, through: :lens_tags

    validates :name, presence:true, length:{maximum:50}
end