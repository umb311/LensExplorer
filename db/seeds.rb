# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Lens.create!(
    name: "FE 24-105mm F4 G OSS",
    model_number: "SEL24105G",
    mount: "E",
    lens_type: true,
    focal_length: "24-105",
    minimum_focusing_distance: "24",
    maximum_focusing_distance: "105",
    aperture: "F4",
    maximum_aperture: "4",
    minimum_aperture: "22",
    number_of_aperture_blades: "9",
    angle_of_view: "84°-23°",
    maximum_angle_of_view: "84",
    minimum_angle_of_view: "23",
    minimum_shooting_distance: "0.38",
    minimum_shooting_distance_tele: "",
    minimum_shooting_distance_wide: "0.38",
    lens_construction: "14-17",
    maximum_magnification: "0.31",
    filter_diameter: "77",
    stabilization: true,
    teleconverter_14x: false,
    teleconverter_20x: false,
    dimensions: "83.4 x 113.3",
    weight: "663",
    sensor_size: "FF",
    description: ""
)