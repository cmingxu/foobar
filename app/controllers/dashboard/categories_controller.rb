class Dashboard::CategoriesController < Dashboard::BaseController
  before_filter :find_category, only: [:edit, :update, :destroy, :conditions_list]

  def index
    @default_category = Category.find_by(id: params[:category_id]) || Category.find_by(name: "CPU")
    @default_condition = Condition.find_by(id: params[:condition_id]) || @default_category.conditions.first
    @default_condition_value = ConditionValue.find_by(id: params[:condition_value_id]) || @default_condition.try(:condition_values).try(:first) || []
    @categories = Category.order('id desc').page params[:page]
    @conditions = @default_category.conditions
    @condition_values = @default_condition.try(:condition_values) || []
    @category = Category.new
  end

  def new
    @category = Category.new
  end

  def create
    @category = policy_scope(Category).new category_param
      authorize @category
      if @category.save
        render js: "window.location.reload()"
      else
        render js: "$.notify('#{@category.errors.full_messages.first}', 'error')"
    end
  end

  def edit
  end

  def conditions_list
    @conditions = @category.conditions
    @condition_values = {}
    @conditions.each do |c|
      @condition_values[c] = c.condition_values
    end
    render layout: false
  end

  def update
    authorize @category
    if @category.update_attributes category_param
      redirect_to dashboard_categories_path, notice: "分类修改成功"
    else
      render :edit
    end
  end

  def destroy
    authorize @category

    if @category.conditions.count > 0
      redirect_to dashboard_categories_path, notice: "分类已被使用,暂时不能删除"
      return
    end

    if @category.destroy
      redirect_to dashboard_categories_path, notice: "分类删除成功"
    else
      redirect_to dashboard_categories_path, notice: "分类删除失败, #{@category.errors.full_messages.first}"
    end
  end

  private
  def category_param
    params.require(:category).permit!
  end

  def find_category
    @category  = policy_scope(Category).find params[:id]
  end
end
