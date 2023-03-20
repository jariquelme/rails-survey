module DepartmentsHelper

  def team_names(department)
    department.teams.map(&:name).join(', ')
  end
end
