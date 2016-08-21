class Dashboard::SettingController < Dashboard::BaseController
  def index
    redirect_to dashboard_categories_path
  end
end
