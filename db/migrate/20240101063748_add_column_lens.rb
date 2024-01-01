class AddColumnLens < ActiveRecord::Migration[7.0]
  def change
    add_column :lenses, :support_FF, :boolean
    add_column :lenses, :support_APSC, :boolean
  end
end
