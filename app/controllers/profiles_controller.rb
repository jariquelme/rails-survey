class ProfilesController < DashboardController
  before_action :set_profile, only: %i[edit update]

  def edit
    @departments = Department.all.order(:name)
    @teams = @profile.department.present? ? @profile.department.teams : []
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_url, notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:department_id, :team_id, :anonymised)
    end
end
