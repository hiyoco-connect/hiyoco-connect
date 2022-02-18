class ProfilesController < ApplicationController
  def new; end

  def create; end

  def index
    @profiles = Profile.all
  end

  def show; end

  def edit; end

  def update; end

  private

  def profile_params
    params.require(:profile).permit(:name, :grade, :gender, :birthplace_code, :living_place_code,
      :date_of_birth, :blood_type, :siblings_relation, :hobby,
      :times_name, :team_dev_will, :twitter_account, :self_introduce,
      :avatar, :avatar_cache,
      portfolios_attributes: %i[id profile_id name url status])
  end
end
