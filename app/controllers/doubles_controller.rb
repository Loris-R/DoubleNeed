class DoublesController < ApplicationController
  def index
    @doubles = Double.all
  end

  def show
    @double = Double.find(params[:id])
  end

  def new
    @double = Double.new
  end

  def create
    @double = Double.new(double_params)
    if @double.save!
      redirect_to double_path(@double)
    else
      render 'new'
    end
  end

  def edit
    @double = Double.find(params[:id])
  end

  def update
    @double = Double.find(params[:id])
    if @double.update!
      redirect_to double_path(@double)
    else
      render 'edit'
    end
  end

  def destroy
    @double = Double.find(params[:id])
    @double.destroy
    redirect_to doubles_path
  end

  private

  def double_params
    params.require(:double).permit(:name, :description, :city, :country, :price_per_day, :available)
  end
end
