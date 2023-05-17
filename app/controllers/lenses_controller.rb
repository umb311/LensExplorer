class LensesController < ApplicationController
  def index
    @lenses = Lens.all
  end

  def new
    @lens = Lens.new
  end

  def create
  end

  def edit
  end

  def show
    @lens = Lens.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
