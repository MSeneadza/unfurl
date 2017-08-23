class ArrayPrinter
  def initialize(input_array)
    @array_to_print = input_array
  end

  def print
    @array_to_print.map(&:downcase).join(' ')
  end
end
