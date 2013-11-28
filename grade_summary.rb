class GradeSummary
  attr_accessor :grades, :min, :max, :average,
                :standard_deviation

  def initialize(grades)
    @grades = grades
    @min = minimum
    @max = maximum
    @average = average
    @standard_deviation = standard_deviation
  end

  def minimum
    @grades.min
  end

  def maximum
    @grades.max
  end

  def average
    @grades.inject(:+) / @grades.length
  end

  def standard_deviation
    difference_squared = []
    @grades.each do |grade|
      difference_squared << (grade - @average) ** 2
    end
    difference_mean = difference_squared.inject(:+) /
    difference_squared.length
    Math.sqrt(difference_mean).round(2)
  end

end
