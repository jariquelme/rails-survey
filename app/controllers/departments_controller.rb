class DepartmentsController < DashboardController
  before_action :set_department, only: %i[ edit update destroy ]

  def index
    @departments = Department.all.includes(:teams)
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_url, notice: "Department was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update

    if @department.update(department_params)
      redirect_to departments_url, notice: "Department was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @department.destroy

    redirect_to departments_url, notice: "Department was successfully destroyed."
  end

  def teams
    @target = params[:target]
    @teams = Department.find(params[:department_id]).teams.order(:name)
    @teams = @teams.map { |team| [team.name, team.id]}

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name, teams_attributes: [:id, :name, :_destroy])
    end
end
