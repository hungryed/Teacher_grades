class Grade
  attr_accessor :value, :letter

  def initialize(value)
    @value = value
    @letter = letterize_grade(@value)
  end

  def letterize_grade(value)
    case
    when value >= 90
      'A'
    when value >= 80
      'B'
    when value > 70
      'C'
    when value
      'D'
    else
      'F'
    end
  end

end
