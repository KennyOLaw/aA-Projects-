class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cats = Cat.find(params[:id])
    render :show 
  end

  def new 
    @cats = Cat.new()
    render :new
  end 

  def create 
    @cats = Cat.new(cat_params)
    if @cats.save
      redirect_to cat_url(@cats.id)
    else
      render :new 
    end
  end 
  
  def update
    @cats = Cat.find(params[:id])
    if @cats.update
      redirect_to cat_url(@cats.id)
    else
      render :edit
    end
  end

  def edit
    @cats = Cat.find(params[:id])
    render :edit
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :description, :sex)
  end 
end