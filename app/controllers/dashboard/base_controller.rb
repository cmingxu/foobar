class Dashboard::BaseController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!

  def index
  end
end
