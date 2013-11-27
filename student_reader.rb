class StudentReader

  def initialize(filename)
    raise "#{filename} does not exit" unless File.file?(filename)
    @filename = filename
  end

  def populate_students(filename)
    array_of_stuff = []
    CSV.foreach(filename) do |row|
      array_of_stuff << row
    end

    array_of_students = []
    array_of_stuff.each_with_index do |content, index|
      next if index == 0
      student = build_student(content, index)
      array_of_students << student
    end
    array_of_students
  end

  def build_student(content, index)
    students = {}
    student_grades = []
    student_grades << content[2..-1]
    student = Student.new(content[0],content[1], student_grades)
    students["#{student.last_name}, #{student.first_name}".to_sym] =
    student_grades.flatten
    students
  end
end
