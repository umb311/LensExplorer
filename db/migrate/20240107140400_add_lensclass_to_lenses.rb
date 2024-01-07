class AddLensclassToLenses < ActiveRecord::Migration[7.0]
  def change
    add_column :lenses, :lens_class, :string, null: false
  end
end
