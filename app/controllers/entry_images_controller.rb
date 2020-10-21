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
      redirect_to [@entry, :images], notice: "画像を作成しました。"
    else
      render "new"
    end
  end

  def edit
    @image = @entry.images.find(params[:id])
  end

  def update
    @image = @entry.images.find(params[:id])
    @image.assign_attributes(image_params)
    if @image.save
      redirect_to [@entry, :images], notice: "画像を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @image = @entry.images.find(params[:id])
    @image.destroy
    redirect_to [@entry, :images], notice: "画像を削除しました。"
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
