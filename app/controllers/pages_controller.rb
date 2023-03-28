class PagesController < DashboardController
  def home
    redirect_to profile_path unless Profiles::UpdatedAtLeastOnce.call(current_user.profile)

    last_week
    last_month
    last_year
  end


  private

    def last_week
      request = build_chart_request(:last_week)
      @chart_week = build_chart_response(request)
      @responses_week = build_response(request)
    end

    def last_month
      request = build_chart_request(:last_month)
      @chart_month = build_chart_response(request)
      @responses_month = build_response(request)
    end

    def last_year
      request = build_chart_request(:last_year)
      @chart_year = build_chart_response(request)
      @responses_year = build_response(request)
    end

    def build_chart_request(period)
      filtered_period = Date.today.send(period)

      current_user
        .survey_responses
        .where(date: filtered_period..)
    end

    def build_chart_response(data)
      records = data.pluck(:date, Arel.sql("response -> 'how_was_your_work_day' as how_was_your_work_day"))
      [{ name: current_user.profile.alias, data: records }]
    end

    def build_response(data)
      data.pluck(:response).map do |response|
        response.deep_transform_keys!(&:humanize)
      end
    end
end
