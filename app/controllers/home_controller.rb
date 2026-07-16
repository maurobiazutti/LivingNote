class HomeController < ApplicationController
  # Permite que visitantes vejam a página inicial antes de fazer login
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
  end
end
