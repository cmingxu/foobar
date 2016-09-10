class Dashboard::ConditionValuesController < Dashboard::BaseController
  before_filter :find_condition_value, only: [:edit, :update, :destroy]

  def create
    @condition_value = policy_scope(ConditionValue).new condition_value_param

      authorize @condition_value
      if @condition_value.save
        render js: "window.location.reload()"
      else
        render js: "alert('#{@condition_value.errors.full_messages.first}')"
    end
  end

  def destroy
    authorize @condition_value

    if @condition_value.condition_value_values.count > 0
      render js: "$.notify('当前分类指标已经使用', 'error')"
      return
    end

    if @condition_value.destroy
      redirect_to dashboard_categories_path, notice: "模型删除成功"
      render js: "alert('#{@condition_value.errors.full_messages.first}')"
    else
      redirect_to dashboard_categories_path, notice: "模型删除失败"
    end
  end

  def update
    authorize @condition_value
    if @condition_value.update_attributes condition_value_param
      redirect_to dashboard_categories_path, notice: "分类修改成功"
    else
      render :edit
    end
  end

  private
  def condition_value_param
    params.require(:condition_value).permit!
  end

  def find_condition_value
    @condition_value  = policy_scope(ConditionValue).find params[:id]
  end
end
