class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit]
  before_action :set_portfolio, only: %i[show edit update]

  def new
    @profile = current_user.build_profile
    @profile.portfolios.build
  end

  def index
    @profiles = Profile.all.includes(:user).grade_desc.name_asc.page(params[:page]).per(18)
  end

  def show; end

  def edit; end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to @profile, success: t('defaults.messages.created', item: Profile.model_name.human)
    else
      flash.now['danger'] = t('defaults.messages.not_created', item: Profile.model_name.human)
      render :new
    end
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to @profile, success: t('defaults.messages.updated', item: Profile.model_name.human)
    else
      flash.now['danger'] = t('defaults.messages.not_updated', item: Profile.model_name.human)
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :grade, :gender, :birthplace_code, :living_place_code,
                                    :date_of_birth, :blood_type, :siblings_relation, :hobby,
                                    :times_name, :team_dev_will, :twitter_account, :self_introduce,
                                    :avatar, :avatar_cache,
                                    portfolios_attributes: %i[id name url status _destroy])
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_portfolio
    @portfolio = Profile.find(params[:id]).portfolios
  end
end
