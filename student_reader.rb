class StudentReader

  def initialize(filename)
    raise "#{filename} does not exit" unless File.file?(filename)
    @filename = filename
  end

  def gather_info
    array_of_stuff = []
    CSV.foreach(@filename) do |row|
      array_of_stuff << row
    end
    populate_students(array_of_stuff)
  end

  def populate_students(array)
    array_of_students = []
    array.each_with_index do |content, index|
      if index == 0
        @assignment_amount = (content.length - 2)
        next
      else
        student = build_student(content)
        array_of_students << student
      end
    end
    array_of_students
  end

  def build_student(attributes)
    first_name = attributes.shift
    last_name = attributes.shift
    grades = attributes.map(&:to_i)
    if grades.length != @assignment_amount
      raise "#{first_name} #{last_name} is missing an assignment"
      exit
    end

    grades = grades.map do |grade|
      grade = Grade.new(grade)
    end
    Student.new(first_name, last_name, grades)
  end
end
