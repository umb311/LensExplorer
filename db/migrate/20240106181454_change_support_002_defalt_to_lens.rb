class ChangeSupport002DefaltToLens < ActiveRecord::Migration[7.0]
  def change
    change_column_default :lenses, :support_FF, from: true, to: false
    change_column_default :lenses, :support_APSC, from: true, to: false
  end
end
