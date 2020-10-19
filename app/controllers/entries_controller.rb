class EntriesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def index
    @entries = current_user.entries.order(id: :desc).page(params[:page]).per(9)
  end

  def show
    @entry = current_user.entries.find(params[:id])
    # @entry = Entry.find(params[:id])
  end

  def new
    @entry = current_user.entries.build(productiontime: Date.new(2000, 1, 1))  # form_with 用
    # @entry = current_user.entries.new(productiontime: Date.new(2000, 1, 1))  # form_with 用
  end

  def create
    @entry = current_user.entries.build(entry_params)
    # @entry = current_user.entries.new(entry_params)
    if @entry.save
      flash[:success] = 'アニメレビューを投稿しました。'
      redirect_to @entry
    else
      flash.now[:danger] = 'アニメレビューの投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @entry = current_user.entries.find(params[:id])
  end

  def update
    @entry = current_user.entries.find(params[:id])
    if @entry.update(entry_params)
      flash[:success] = 'アニメレビューの更新に成功しました。'
      redirect_to @entry
    else
      flash.now[:danger] = 'アニメレビューの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @entry.destroy
    flash[:success] = 'アニメレビューは正常に削除されました。'
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(
      :title,
      :introduction,
      :directedby,
      :screenplay,
      :character,
      :cast,
      :productioncom,
      :productiontime
    )
  end

  def correct_user
    @entry = current_user.entries.find_by(id: params[:id])
    unless @entry
      redirect_to root_url
    end
  end
end
