class CreateLenses < ActiveRecord::Migration[7.0]
  def change
    create_table :lenses do |t|

      t.timestamps
      t.string :name
      t.string :model_number
      t.string :mount
      t.boolean :lens_type
      t.string :focal_length
      t.integer :minimum_focusing_distance
      t.integer :maximum_focusing_distance
      t.string :aperture
      t.float :maximum_aperture
      t.float :minimum_aperture
      t.integer :number_of_aperture_blades
      t.string :angle_of_view
      t.float :maximum_angle_of_view
      t.float :minimum_angle_of_view
      t.string :minimum_shooting_distance
      t.float :minimum_shooting_distance_tele
      t.float :minimum_shooting_distance_wide
      t.string :lens_construction
      t.string :maximum_magnification
      t.string :filter_diameter
      t.boolean :stabilization
      t.boolean :teleconverter_14x
      t.boolean :teleconverter_20x
      t.string :dimensions
      t.integer :weight
      t.string :sensor_size
      t.text :description
    end
  end
end
