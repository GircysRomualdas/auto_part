class HomeController < ApplicationController
  def index
    @pagy, @part_types = pagy(PartType.all)
  end
end
