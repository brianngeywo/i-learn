class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "user account successfully created"
      redirect_to login_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "your account was successfully updated"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "your account was successfully deleted."
      redirect_to users_url
    else
      flash[:error] = "Something went wrong"
      redirect_to @user
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :id_number, :password, :admin, :teacher, :student)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
