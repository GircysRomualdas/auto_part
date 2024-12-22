class HomeController < ApplicationController
  def index
    part_types = PartType.all.order(created_at: :desc)
    @q = part_types.ransack(params[:q])
    @pagy, @part_types = pagy(@q.result(distinct: true))
  end
end
