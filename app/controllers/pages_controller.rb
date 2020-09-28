class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categories = Category.all
    @hotels_preview = [Hotel.all[0], Hotel.all[1]]
    @hotels = Hotel.all
  end
end
