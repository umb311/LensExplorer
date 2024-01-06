class ChangeSupport001DefaltToLens < ActiveRecord::Migration[7.0]
  def change
    change_column_default :lenses, :support_FF, from: true, to: false
  end
end
