class Admin::DashboardController < Admin::ApplicationController
  def index
    @galleries = Gallery.all
    @products = Product.all
  end
end
