class PagesController < DashboardController
  def home
    redirect_to profile_path unless Profiles::UpdatedAtLeastOnce.call(current_user.profile)

    @responses = current_user.survey_responses.pluck(:date, Arel.sql("response -> 'how_was_your_work_day' as how_was_your_work_day"))
  end
end
