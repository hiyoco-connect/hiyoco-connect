class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger

  def not_authenticated
    redirect_to root_path, alert: 'ログインしてください'
  end
end
