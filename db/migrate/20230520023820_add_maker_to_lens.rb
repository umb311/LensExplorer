class AddMakerToLens < ActiveRecord::Migration[7.0]
  def change
    add_column :lenses, :maker, :string
    add_column :lenses, :grade, :string
  end
end
