class EntryImagesController < ApplicationController
  before_action :require_user_logged_in

  before_action do
    @entry = current_user.entries.find(params[:entry_id])
  end

  def index
    @images = @entry.images.order(:position)
  end

  def show
    redirect_to action: "edit"
  end

  def new
    @image = @entry.images.build
  end

  def create
    @image = @entry.images.build(image_params)
    if @image.save
      flash[:success] = '画像の投稿に成功しました。'
      redirect_to [@entry, :images]
    else
      flash.now[:danger] = '画像の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @image = @entry.images.find(params[:id])
  end

  def update
    @image = @entry.images.find(params[:id])
    @image.assign_attributes(image_params)
    if @image.save
      flash[:success] = '画像の更新に成功しました。'
      redirect_to [@entry, :images]
    else
      flash.now[:danger] = '画像の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @image = @entry.images.find(params[:id])
    @image.destroy
    flash[:success] = '画像の削除に成功しました。'
    redirect_to [@entry, :images]
  end

  # 表示位置を上げる
  def move_higher
    @image = @entry.images.find(params[:id])
    @image.move_higher
    redirect_back fallback_location: [@entry, :images]
  end

  # 表示位置を下げる
  def move_lower
    @image = @entry.images.find(params[:id])
    @image.move_lower
    redirect_back fallback_location: [@entry, :images]
  end

  private
  
  def image_params
    params.require(:image).permit(
      :new_profile_entry_image,
      :alt_text
    )
  end
end
