require 'csv'
require 'pry'
require 'json'
require_relative 'student'
require_relative 'final_grade'
require_relative 'assignment_grade'
require_relative 'grade_reader'
require_relative 'grade_summary'
require_relative 'student_reader'
require_relative 'grade'
require_relative 'student_writer'
require_relative 'assignment'

filename = 'assignments.csv'

students = StudentReader.new(filename)
students = students.gather_info
students = students.sort_by {|student| student.last_name}
writing_to_file = []

students.each do |student|
  output = student.get_info
  output.display_information
  writing_to_file << output.prepare_to_write
end

# print "What file would you like to export to?: "
# filename_to_write_to = gets.chomp
# if filename_to_write_to.include?('.csv')
#   writing_to_file = StudentWriter.new(writing_to_file)
#   writing_to_file.export(filename_to_write_to)
# else
#   puts "Please use a .csv extension"
#   exit
# end

grades = GradeReader.new(filename)
grades = grades.separate_grades
assignments = []
grades.each do |key, value|
  assignment = AssignmentGrade.new(key, value)
  assignments << assignment
end
binding.pry
