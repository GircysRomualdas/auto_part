module ApplicationHelper
  include Pagy::Frontend

  def get_active_status(active)
    active ? "text-success" : "text-danger"
  end

  def get_order_item_status(status)
    case status
    when "pending"
      "text-primary"
    when "sent"
      "text-warning"
    when "canceled"
      "text-danger"
    else
      "text-secondary"
    end
  end

  def get_order_status(status)
    case status
    when "pending"
      "text-primary"
    when "partially_sent"
      "text-warning-emphasis"
    when "fully_sent"
      "text-warning"
    when "canceled"
      "text-danger"
    else
      "text-secondary"
    end
  end
end
