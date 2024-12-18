class HomeController < ApplicationController
  def index
    if admin_signed_in?
      redirect_to admin_path
    end
  end
end
