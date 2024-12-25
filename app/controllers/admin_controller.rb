class AdminController < ApplicationController
  before_action :authenticate_admin!

  def index
    @stats = {
      new_customers_this_week: Customer.where(created_at: Time.now.beginning_of_week..Time.now).count,
      new_sellers_this_week: Seller.where(created_at: Time.now.beginning_of_week..Time.now).count,
      customer_sign_ins_this_week: Customer.where(last_sign_in_at: Time.now.beginning_of_week..Time.now).count,
      seller_sign_ins_this_week: Seller.where(last_sign_in_at: Time.now.beginning_of_week..Time.now).count,
      total_customers: Customer.count,
      total_sellers: Seller.count
    }
  end

  def show
    @admin = current_admin
  end
end
