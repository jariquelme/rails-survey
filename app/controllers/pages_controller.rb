class PagesController < DashboardController
  def home
    redirect_to profile_path unless Profiles::UpdatedAtLeastOnce.call(current_user.profile)
  end
end
