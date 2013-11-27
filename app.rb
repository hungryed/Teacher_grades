require 'csv'
require 'pry'
require 'json'
require_relative 'student'
require_relative 'final_grade'
require_relative 'assignment_grade'
require_relative 'grade_reader'
require_relative 'grade_summary'
require_relative 'student_reader'

filename = 'assignments.csv'


students = StudentReader.new(filename)
students = students.populate_students(filename)
binding.pry
