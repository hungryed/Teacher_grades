class GradeReport


  def initialize(name, average, min, max,
                 standard_deviation)
    @name = name
    @average = average
    @min = min
    @max = max
    @standard_deviation = standard_deviation
  end

  def report_grades
    puts "#{@name}: \tAverage: #{@average}"
    puts "\t \tMinimum Grade: #{@min}"
    puts "\t \tMaximum Grade: #{@max}"
    puts "\t \tStandard Deviation #{@standard_deviation}"
    puts "============================"
  end

end
