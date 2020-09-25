class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categories = Category.all
    @hotels = [Hotel.all[0], Hotel.all[1]]
  end
end
