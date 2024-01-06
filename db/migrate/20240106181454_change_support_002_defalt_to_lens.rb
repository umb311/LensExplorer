class ChangeSupport002DefaltToLens < ActiveRecord::Migration[7.0]
  def change
    change_column_default :lenses, :support_FF, from: true, to: false
    change_column_default :lenses, :support_APSC, from: true, to: false
    change_column_default :lenses, :stabilization, from: true, to: false
    change_column_default :lenses, :splash_proof, from: true, to: false
    change_column_default :lenses, :dust_proof, from: true, to: false
    change_column_default :lenses, :wide_lens, from: true, to: false
    change_column_default :lenses, :telephoto_lens, from: true, to: false
    change_column_default :lenses, :macro_lens, from: true, to: false
    change_column_default :lenses, :high_magnification_lens, from: true, to: false
    change_column_default :lenses, :fisheye_lens, from: true, to: false
    change_column_default :lenses, :aori_lens, from: true, to: false
    change_column_default :lenses, :mirror_lens, from: true, to: false
    change_column_default :lenses, :large_diameter, from: true, to: false
    change_column_default :lenses, :pancake, from: true, to: false
    change_column_default :lenses, :teleconverter_14x, from: true, to: false
    change_column_default :lenses, :teleconverter_20x, from: true, to: false
  end
end
