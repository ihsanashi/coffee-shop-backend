class V1::Admin::UsersController < ApplicationController
  def register
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: {
        user: @user.as_json(except: :password_digest),
        token: token
      }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      token = encode_token({ user_id: @user.id })
      render json: {
        user: @user.as_json(except: :password_digest),
        token: token
      }, status: :ok
    else
      render json: { error: 'Invalid credentials '}, status: :unprocessable_entity
    end
  end

  def index
    @users = User.where(role_id: params[:role_id])

    render json: { users: @users }, status: :ok
  end

  def show
    @user = User.where(id: params[:id]).first

    render json: { user: @user }, status: :ok
  end

  def destroy
    @user = User.destroy(params[:id])

    if @user.destroyed?
      render body: nil, status: :no_content
    else
      render json: { error: 'Error deleting user' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password).merge(:role_id => 1)
  end
end
