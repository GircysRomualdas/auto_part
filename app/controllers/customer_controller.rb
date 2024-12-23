class CustomerController < ApplicationController
  before_action :authenticate_customer!
end
