class CreateLensTags < ActiveRecord::Migration[7.0]
  def change
    create_table :lens_tags do |t|
      t.references :lens, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    # 同じタグは２回保存出来ない
    add_index :lens_tags, [:lens_id,:tag_id],unique: true
  end
end
