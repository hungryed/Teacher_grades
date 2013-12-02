class AssignmentZone

  def initialize(filename)
    @filename = filename
  end

  def compile_grades
    grades = GradeReader.new(@filename)
    grades = grades.separate_grades
    @assignments = []
    cumulative_grades = []
    grades.each do |key, value|
      assignment = AssignmentGrade.new(key, value)
      @assignments << assignment
      cumulative_grades << value
    end

    entire_course =
      AssignmentGrade.new('Whole Course', cumulative_grades.flatten)
    @assignments << entire_course
  end

  def display_grades
    @assignments.each do |assignment_info|
      name = assignment_info.name
      average = assignment_info.grades.average
      minimum = assignment_info.grades.min
      maximum = assignment_info.grades.max
      stand_dev = assignment_info.grades.standard_deviation
      summary = GradeReport.new(name, average, minimum,
                              maximum, stand_dev)
      summary.report_grades
    end
  end

end
