class HomeController < ApplicationController
  def index
    part_types = PartType.all
    @q = part_types.ransack(params[:q])
    @pagy, @part_types = pagy(@q.result(distinct: true))
  end
end
