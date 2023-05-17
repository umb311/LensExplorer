class LensesController < ApplicationController
  def index
    @lenses = Lens.all
  end

  def new
    @lens = Lens.new
  end

  def create
    @lens = Lens.new(lens_params)
    
    if @lens.save
      redirect_to lenses_path, notice: 'created'
    else
      render :new
    end
  end

  def edit
    @lens = Lens.find(params[:id])
  end

  def show
    @lens = Lens.find(params[:id])
  end

  def update
    @lens = Lens.find(params[:id])
    @lens.update(lens_params)
    redirect_to lens_path
  end

  def destroy
    @lens = Lens.find(params[:id])
    @lens.destroy
    redirect_to lenses_path, notice: 'destroyed'
  end

  private
  def lens_params
    params.require(:lens).permit(
      :name,
      :model_number,
      :mount,
      :lens_type,
      :focal_length,
      :minimum_focusing_distance,
      :maximum_focusing_distance,
      :aperture, :maximum_aperture,
      :minimum_aperture,
      :number_of_aperture_blades,
      :angle_of_view,
      :maximum_angle_of_view,
      :minimum_angle_of_view,
      :minimum_shooting_distance,
      :minimum_shooting_distance_tele,
      :minimum_shooting_distance_wide,
      :lens_construction,
      :maximum_magnification,
      :filter_diameter,
      :stabilization,
      :teleconverter_14x,
      :teleconverter_20x,
      :dimensions,
      :weight,
      :sensor_size,
      :description
    )
  end
end