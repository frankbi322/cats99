require 'byebug'
class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def create
    new_cat = Cat.new(cat_params)
    if new_cat.save
      redirect_to cat_url(new_cat)
    else
      render json: new_cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    # debugger
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name,:birth_date,:color,:sex,:description)
  end
end
