class StudentZone

  def initialize(filename)
    @filename = filename
  end

  def make_student_list
    @students = StudentReader.new(@filename)
    @students = @students.gather_info
    @students = @students.sort_by {|student| student.last_name}
    @students
  end

  def display_student_info
    @writing_to_file = []

    @students.each do |student|
      output = student.get_info
      output.display_information
      @writing_to_file << output.prepare_to_write
    end
  end

  def write_to_file
    print "What file would you like to export to?: "
    filename_to_write_to = gets.chomp
    if filename_to_write_to.include?('.csv')
      @writing_to_file = StudentWriter.new(@writing_to_file)
      @writing_to_file.export(filename_to_write_to)
    else
      raise "Please use a .csv extension"
      exit
    end
  end



end
