class UsersController < ApplicationController
  before_action :require_user_logged_in, cxcept: [:new, :create]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザは正常に登録されました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザは登録されませんでした。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザは正常に更新されました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザは更新されませんでした。'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = 'ユーザは正常に削除されました。'
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :email, :password, :password_confirmation)
  end
end
