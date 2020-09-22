class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
  end

  def show
    @hotels = Hotel.all
  end

  private

  def set_category
    @category = Category.find(params[:format])
  end
end
