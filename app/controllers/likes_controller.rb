class LikesController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])
    current_user.like(@profile)
    redirect_to profile_path(@profile)
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
    current_user.unlike(@profile)
    redirect_to profile_path(@profile)
  end
end
