class UsersController < ApplicationController
  # before_action :require_user_logged_in, except: [:new, :create]
  before_action :require_user_logged_in

  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @entries = @user.entries.order(id: :desc).page(params[:page]).per(9)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザ登録に成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザの更新に成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザの削除に成功しました。'
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :email, :password, :password_confirmation, :new_profile_image)
  end
end
