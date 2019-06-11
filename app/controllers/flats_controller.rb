class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
  end
end
