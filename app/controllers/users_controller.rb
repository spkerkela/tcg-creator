class UsersController < ApplicationController
    before_action :signed_in_user, only: [:edit, :update, :index, :show]
    before_action :correct_user, only: [:edit, :update]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sign_in @user
            flash[:success] = "Welcome to TCG Creator"
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update_attributes(user_params)
            flash[:success] = "Settings updated"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

end
