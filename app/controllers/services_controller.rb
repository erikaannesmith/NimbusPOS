class ServicesController < ApplicationController

  def index
    @services = Service.order(:position)
  end

end
