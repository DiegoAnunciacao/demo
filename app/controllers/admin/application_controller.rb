class Admin::ApplicationController < ActionController::Base
  layout "application"
  before_action :authenticate_user!
  before_action :ensure_admin!

  private

  def ensure_admin!
    redirect_to root_path, alert: "Denied access" unless current_user&.is_admin?
  end
end
