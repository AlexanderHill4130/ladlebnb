class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @flats = Flat.all
  end

  def new_host
    @user = current_user
    @user.host = true
    @user.save
    redirect_to new_flat_path
  end
end
