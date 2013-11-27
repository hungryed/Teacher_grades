class GradeReader

  def intialize(filename)
    raise "#{filename} does not exit" unless File.file?(filename)
    @filename = filename
  end

end
