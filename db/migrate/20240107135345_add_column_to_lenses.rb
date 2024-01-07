class AddColumnToLenses < ActiveRecord::Migration[7.0]
  def change
    add_column :lenses, :kakakucom_id, :string, null: false
    add_column :lenses, :focus_mode, :boolean, default: false
    add_column :lenses, :splash_proof, :boolean, default: false
    add_column :lenses, :dust_proof, :boolean, default: false
    add_column :lenses, :wide_lens, :boolean, default: false
    add_column :lenses, :telephoto_lens, :boolean, default: false
    add_column :lenses, :macro_lens, :boolean, default: false
    add_column :lenses, :high_magnification_lens, :boolean, default: false
    add_column :lenses, :fisheye_lens, :boolean, default: false
    add_column :lenses, :aori_lens, :boolean, default: false
    add_column :lenses, :mirror_lens, :boolean, default: false
    add_column :lenses, :large_diameter, :boolean, default: false
    add_column :lenses, :pancake, :boolean, default: false
  end
end
