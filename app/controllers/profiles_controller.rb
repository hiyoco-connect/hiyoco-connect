class ProfilesController < ApplicationController
  def new 
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def profile_params
    params_require(:profile).permit(:name, :grade, :gender, :birthplace_code, :living_place_code, :blood_type, :siblings_relation, :hobby, :times_name, :team_dev_will, :twitter_account, :self_introduce, :avatar, :avatar_cache)
  end
end
