class WelcomeController < ApplicationController
  skip_before_action :check_access
  def index
  end
end
