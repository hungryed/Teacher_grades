class GradeReader
  include Enumerable

  def initialize(filename)
    raise "#{filename} does not exit" unless File.file?(filename)
    @filename = filename
  end

  def each(&block)
    self.each(&block)
  end

  def separate_grades
    array_of_assignments = []
    CSV.foreach(@filename) do |row|
      array_of_assignments << row[2..-1]
    end
    array_of_assignments = array_of_assignments.transpose
    assignments_to_hash(array_of_assignments)
  end

  def transform_assignments
    self.transpose
  end

  def grade_to_class(array)
    array.map do |grade|
      grade = Grade.new(grade)
    end
    array
  end

  def assignments_to_hash(array_of_assignments)
    assignments = {}
    array_of_assignments.each do |assignment|
      assignment_name = assignment.shift
      grades = assignment.map(&:to_i)
      grades = grade_to_class(grades)
      assignments[assignment_name]= grades
    end
    assignments
  end

end
