class V1::Admin::ProfilesController < ApplicationController
  def show
    @profile = Profile.where(user_id: params[:user_id]).first

    if @profile.present?
      render json: { profile: @profile }, status: :ok
    else
      render json: { error: "The user with id #{params[:user_id]} does not have a profile." }, status: :unprocessable_entity
    end

  end

  def create
    @profile = Profile.create(profile_params)

    if @profile.valid?
      render json: { profile: @profile }, status: :ok
    else
      render json: { error: @profile.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    @profile = Profile.where(user_id: params[:user_id]).first

    update_profile = @profile.update(profile_params)

    if update_profile
      render json: { profile: @profile }, status: :ok
    else
      render json: { error: @profile.errors.messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @profile = Profile.destroy(params[:user_id])

    if @profile.destroyed?
      render body: nil, status: :no_content
    else
      render json: { error: @profile.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone).merge(user_id: params[:user_id])
  end
end
