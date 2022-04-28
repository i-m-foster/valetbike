class BikeController < ApplicationController

  def index
    @bikes = Station.all.order(identifier: :asc)
  end

end
