class AssignmentGrade
  attr_accessor :name, :grades

  def initialize(name, grades)
    @name = name
    @grades = GradeSummary.new(grades)
  end

end
