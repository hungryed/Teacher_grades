class Student
  attr_accessor :first_name, :last_name, :grades

  def initialize(first_name, last_name, grades)
    @first_name = first_name
    @last_name = last_name
    @grades = grades
  end

  def average_grade
    self.grades.map(&:value).inject(:+).to_f / @grades.length
  end

  def list_grades
    self.grades.map(&:value)
  end

  def get_info
    list_of_grades = self.list_grades
    average = self.average_grade
    final_grade = FinalGrade.new(@first_name, @last_name, list_of_grades, average)
  end

end
