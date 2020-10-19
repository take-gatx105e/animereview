class EntriesController < ApplicationController
  before_action :require_user_logged_in

  def index
    @entries = current_user.entries.order(id: :desc).page(params[:page]).per(9)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
