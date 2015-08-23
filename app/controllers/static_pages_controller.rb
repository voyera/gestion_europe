# Controller with all static pages
class StaticPagesController < ApplicationController
  def home
    redirect_to cooperatives_path if user_signed_in?
  end
end
