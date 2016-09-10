class Dashboard::ConditionsController < Dashboard::BaseController
  before_filter :find_condition, only: [:edit, :update, :destroy]

  def create
    @condition = policy_scope(Condition).new condition_param

      authorize @condition
      if @condition.save
        render js: "window.location.reload()"
      else
        render js: "alert('#{@condition.errors.full_messages.first}')"
    end
  end

  def destroy
    authorize @condition

    if @condition.condition_values.count > 0
      render js: "$.notify('当前分类指标已经使用', 'error')"
      return
    end

    if @condition.destroy
      redirect_to dashboard_categories_path, notice: "模型删除成功"
      render js: "alert('#{@condition.errors.full_messages.first}')"
      
    else
      redirect_to dashboard_categories_path, notice: "模型删除失败"
    end
  end

  def update
    authorize @condition
    if @condition.update_attributes condition_param
      redirect_to dashboard_categories_path, notice: "分类修改成功"
    else
      render :edit
    end
  end

  private
  def condition_param
    params.require(:condition).permit!
  end

  def find_condition
    @condition  = policy_scope(Condition).find params[:id]
  end
end

