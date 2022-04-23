class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  def show
    @num_of_products = Product.all.count
    @num_of_categories = Category.all.length
  end
end
