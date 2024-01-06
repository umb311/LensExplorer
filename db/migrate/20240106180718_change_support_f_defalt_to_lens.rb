class ChangeSupportFDefaltToLens < ActiveRecord::Migration[7.0]
  def change
    change_column_default :lenses, :support_FF, from: nil, to: false
  end
end
