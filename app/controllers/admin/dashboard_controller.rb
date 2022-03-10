class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD']
  def show
    @num_products = Product.count
    @num_categories = Category.count
  end
end
