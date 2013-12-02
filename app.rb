require 'csv'
require_relative 'student'
require_relative 'final_grade'
require_relative 'assignment_grade'
require_relative 'grade_reader'
require_relative 'grade_summary'
require_relative 'student_reader'
require_relative 'grade'
require_relative 'student_writer'
require_relative 'assignment'
require_relative 'grade_report'
require_relative 'student_zone'
require_relative 'assignment_zone'

filename = 'assignments.csv'

def clear_screen
  puts "\e[H\e[2J"
end

clear_screen
puts "What would you like to do?"
puts "1) See Student Information"
puts "2) See Assignment Grades"
puts ""
input = gets.chomp.to_i
clear_screen

if input == 1
  students = StudentZone.new(filename)
  students.make_student_list
  students.display_student_info
  students.write_to_file
elsif input == 2
  grades = AssignmentZone.new(filename)
  grades.compile_grades
  grades.display_grades
else
  puts "Please enter a valid number"
end
