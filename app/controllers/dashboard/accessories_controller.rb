class Dashboard::AccessoriesController < Dashboard::BaseController
  before_action :find_accessory, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @accessories = policy_scope(Accessory).includes(:user).page(params[:page]).order("id DESC")
  end

  def show
  end

  def edit
  end

  def new
    @accessory = Accessory.new
    @accessory.category_id = Category.default_category.id
    @accessory.count = 20
    @accessory.price = 50
    @accessory.quanlity = Accessory::QUANTITY_LIST.keys.first

    3.times do
      @accessory.image_assets.build
    end
  end

  def create
    @accessory = current_user.accessories.new accessory_param
    if @accessory.save
      redirect_to dashboard_accessories_path, notice: '配件上传成功'
    else
      render :new
    end

  end

  def destroy
    if @accessory.destroy
      notice = "删除成功"
    else
      notice = "删除失败"
    end
    redirect_to dashboard_accessories_path, notice: notice
  end

  def update
    authorize @accessory
    if @accessory.update_attributes accessory_param
      redirect_to dashboard_categories_path, notice: "分类修改成功"
    else
      render :edit
    end
  end

  protected
  def find_accessory
    @accessory = Accessory.find params[:id]
  end

  def accessory_param
    params.required(:accessory).permit!
  end
end
