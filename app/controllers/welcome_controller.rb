class WelcomeController < ApplicationController
  layout "website"

  def index
    @accessories = Accessory.page params[:page]
  end
end
