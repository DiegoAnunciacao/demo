class Admin::PortfoliosController < Admin::ApplicationController
  before_action :set_portfolio, only: [ :edit, :update, :destroy_photo ]
  def edit
  end

  def update
    @portfolio = Portfolio.first
    if params[:portfolio][:photos]
      @portfolio.photos.attach(params[:portfolio][:photos])
    end
    if @portfolio.save
      redirect_to admin_root_path, notice: "Photos Updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy_photo
    photo = @portfolio.photos.attachments.find(params[:id])
    photo.purge
    redirect_to edit_admin_portfolio_path
  end

  private
  def set_portfolio
    @portfolio = Portfolio.first_or_create!
  end

  def portfolio_params
    params.require(:portfolio).permit(photos: [])
  end
end
