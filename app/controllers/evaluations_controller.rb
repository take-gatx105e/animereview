class EvaluationsController < ApplicationController
  before_action :require_user_logged_in

  before_action do
    @entry = current_user.entries.find(params[:entry_id])
  end

  def show
  end

  def new
    @evaluation = @entry.build_evaluation
  end

  def create
    @evaluation = @entry.build_evaluation(evaluation_params)
    if @evaluation.save
      flash[:success] = '評価に成功しました。'
      redirect_to [@entry, :evaluation]
    else
      flash.now[:danger] = '評価に失敗しました。'
      render :new
    end
  end

  def edit
    @evaluation = @entry.evaluation
  end

  def update
    @evaluation = @entry.evaluation
    @evaluation.assign_attributes(evaluation_params)
    if @evaluation.save
      flash[:success] = '評価の更新に成功しました。'
      redirect_to [@entry, :evaluation]
    else
      flash.now[:danger] = '評価の更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @evaluation = @entry.evaluation
    @evaluation.destroy
    flash[:success] = '評価の削除に成功しました。'
    redirect_to [@entry, :evaluation]
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(
      :compreh,
      :constitution,
      :directing,
      :drawing,
      :music
    )
  end
end
