class Student
  attr_accessor :first_name, :last_name, :grades

  def initialize(first_name, last_name, grades)
    @first_name = first_name
    @last_name = last_name
    @grades = grades.flatten
  end

end
