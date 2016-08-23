class Dashboard::AccessoriesController < Dashboard::BaseController
  before_action :find_accessories, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @accessories = policy_scope(Accessory).page params[:page]
  end

  def show
  end

  def edit
  end

  def new
    @accessory = Accessory.new
    3.times do 
      @accessory.image_assets.build
    end
  end

  def create
    @accessory = Accessory.new accessory_param
    if @accessory.save
      redirect_to dashboard_accessories_path, notice: '配件上传成功'
    else
      render :new
    end

  end

  def destroy
  end

  def update
  end

  protected
  def find_accessory
    @accessory = Accessory.find params[:id]
  end

  def accessory_param
    params.required(:accessory).permit!
  end
end
