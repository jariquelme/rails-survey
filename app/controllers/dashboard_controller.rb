class DashboardController < ActionController::Base
  before_action :authenticate_user!

  layout 'dashboard'
end
