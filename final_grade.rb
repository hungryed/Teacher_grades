class FinalGrade
  attr_accessor :first_name, :last_name, :grades,
                 :average, :final_grade

  def initialize(first_name, last_name, grades, average)
    @first_name = first_name
    @last_name = last_name
    @grades = grades
    @average = average
    @final_grade = get_letter(@average)
  end

  def get_letter(score)
    final_grade = Grade.new(score)
    final_grade.letter
  end

  def display_information
    puts "#{self.last_name}, #{self.first_name}:"
    puts "\t Grades: #{self.grades.join(", ")}"
    puts "\t Average: #{self.average}"
    puts "\t Final Grade: #{self.final_grade}"
    puts "======================================="
  end

  def prepare_to_write
    hash_to_write = {
      last_name: self.last_name,
      first_name: self.first_name,
      average: self.average.round(1),
      final_grade: self.final_grade
    }
    hash_to_write
  end

end
