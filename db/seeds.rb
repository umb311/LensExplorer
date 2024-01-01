# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

CSV.foreach('db/seeds/csv/lens-profile.csv', headers: true) do |row|
    Content.create(
        name: row['name'],
        model_number: row['model_number'],
        mount: row['mount'],
        lens_type: row['lens-type'],
        focal_length: row['focal_length'],
        minimum_focusing_distance: row['minimum_focusing_distance'],
        maximum_focusing_distance: row['maximum_focusing_distance'],
        aperture: row['maximum_aperture'],
        maximum_aperture: row['maximum_aperture'],
        minimum_aperture: row['minimum_aperture'],
        number_of_aperture_blades: row['aperture_blades'],
        angle_of_view: row['angle_of_view'],
        maximum_angle_of_view: row['maximum_angle_of_view'],
        minimum_angle_of_view: row['minimum_angle_of_view'],
        minimum_shooting_distance: row['minimum_focusing_distance'],
        minimum_shooting_distance_tele: row['minimum_shooting_distance_tele'],
        minimum_shooting_distance_wide: row['minimum_shooting_distance_wide'],
        lens_construction: row['lens_construction'],
        maximum_magnification: row['maximum_magnification'],
        filter_diameter: row['filter-diameter'],
        stabilization: row['stabilization'],
        teleconverter_14x: row['teleconverter_14x'],
        teleconverter_20x: row['teleconverter_20x'],
        dimensions: row['size'],
        weight: row['weight'],
        sensor_size: row['sensor_size'],
        description: row['description'],
        maker: row['maker'],
        grade: row['grade'],
        kakakucom_id: row['kakakucom-id'],
        focus_mode: row['focus-mode'],
        lens_class: row['lens-class'],
        splash_proof: row['splash-proof'],
        dust_proof: row['dust-proof'],
        wide_lens: row['wide-lens'],
        telephoto_lens: row['telephoto-lens'],
        macro_lens: row['macro-lens'],
        high_magnification_lens: row['high-magnification-lens'],
        fisheye_lens: row['fisheye-lens'],
        aori_lens: row['aori-lens'],
        mirror_lens: row['mirror-lens'],
        large_diameter: row['large-diameter'],
        pancake: row['pancake'],
        support_FF: row['support-FF'],
        support_APSC: row['support-APSC']
    )
end