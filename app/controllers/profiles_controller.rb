class ProfilesController < ApplicationController
  before_action :set_q, only: %i[index search]
  before_action :set_profile, only: %i[show edit update]
  before_action :set_portfolio, only: %i[show edit update]

  def new
    @profile = current_user.build_profile
    @profile.portfolios.build
  end

  def index
    @profiles = @q.result.includes(:user).grade_desc.name_asc.page(params[:page]).per(18)
  end

  def show; end

  def edit; end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to @profile, success: t('defaults.messages.created', item: Profile.model_name.human)
    else
      @profile.portfolios.build if @portfolio.blank?
      flash.now['danger'] = t('defaults.messages.not_created', item: Profile.model_name.human)
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, success: t('defaults.messages.updated', item: Profile.model_name.human)
    else
      flash.now['danger'] = t('defaults.messages.not_updated', item: Profile.model_name.human)
      render :new
    end
  end

  def destroy
    current_user.profile.destroy
    redirect_to root_path, success: t('defaults.messages.deleted', item: Profile.model_name.human)
  end
  def likes
    @liked_profiles = current_user.liked_profiles.includes(:user).grade_desc.name_asc
    @connect_profiles = current_user.connect.includes(:user).grade_desc.name_asc
  end

  def search; end

  private

  def set_q
    @q = Profile.ransack(params[:q])
  end

  def profile_params
    params.require(:profile).permit(:name, :grade, :gender, :birthplace_code, :living_place_code,
                                    :date_of_birth, :blood_type, :siblings_relation, :hobby,
                                    :times_name, :team_dev_will, :twitter_account, :self_introduce,
                                    :avatar, :avatar_cache,
                                    portfolios_attributes:
                                    %i[id profile_id name url status _destroy])
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_portfolio
    @portfolio = @profile.portfolios
  end
end
