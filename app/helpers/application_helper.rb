module ApplicationHelper
  include Pagy::Frontend

  def get_active_status(active)
    active ? "text-success" : "text-danger"
  end
end
