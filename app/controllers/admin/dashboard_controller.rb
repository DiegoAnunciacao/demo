class Admin::DashboardController < Admin::ApplicationController
  def index
    @products = Product.all
  end
end
