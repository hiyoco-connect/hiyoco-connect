class UserSessionsController < ApplicationController
  def destroy
    logout
    redirect_to root_path, success: t('.success')
  end
end
