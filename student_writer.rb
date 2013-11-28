class StudentWriter

  def initialize(data)
    @data = data
  end

  def export(filename)
    headers = @data.first.keys
    CSV.open(filename, 'w+') do |row|
      row << headers
      @data.each do |student_information|
        row << student_information.values
      end
    end
  end

end
