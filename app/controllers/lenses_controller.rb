class LensesController < ApplicationController
  def index
    @tag_list = Tag.all
  end

  def new
    @lens = Lens.new
  end

  def create
    @lens = Lens.new(lens_params)

    tag_list = params[:lens]['tag_names'].split(',')
    
    if @lens.save
      @lens.save_lens_tags(tag_list)
      redirect_to lenses_path, notice: 'created'
    else
      render :new
    end
  end

  def edit
    @lens = Lens.find(params[:id])
    @tag_list = @lens.tags.pluck(:name).join(',')
  end

  def show
    @lens = Lens.find(params[:id])
    # @tag_list = @lens.tags.pluck(:tag_name).join(',')
    @lens_tags = @lens.tags
  end

  def update
    @lens = Lens.find(params[:id])

    tag_list=params[:lens][:tag_name].split(',')
    if @lens.update(lens_params)
      @lens.save_lens_tags(tag_list)
      redirect_to lens_path
    else
      render :edit
    end
  end

  def destroy
    @lens = Lens.find(params[:id])
    @lens.destroy
    redirect_to lenses_path, notice: 'destroyed'
  end

  def search_tag
    # 検索結果画面でもタグ一覧表示
    @tag_list = Tag.all

    # 検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])

    # 検索されたタグに紐づく投稿を表示
    @lens = @tag.lenses
  end

  private
  def lens_params
    params.require(:lens).permit(
      :maker,
      :grade,
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

#hoge