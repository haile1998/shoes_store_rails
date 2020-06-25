class Home::HomepageController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @product = Product.all
  end
end
