class UsersController < ApplicationController
    skip_before_action :authorized, only: :create

    def show
        render json: @user, status: :ok
    end

    def create
        user = User.create(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    private

    def user_params
        params.permit(:username, :password, :image_url, :bio, :password_confirmation)
    end

end
