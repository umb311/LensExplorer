class ChangeDataLensTypeToLens < ActiveRecord::Migration[7.0]
  def change
    change_column :lenses, :lens_type, :string
  end
end