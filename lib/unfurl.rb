require 'unfurl/version'

class Unfurl
  def initialize(input_matrix)
    @matrix = input_matrix.dup # duplicating to prevent mutating the passed in matrix
    @outputter = ArrayPrinter
  end

  def process
    #validate input
    result = unfurl(@matrix)
    @outputter.new(result).print
  end

  def unfurl(matrix)
    result = []
    result << matrix.slice!(0)
    unless matrix.empty?
      rotated_matrix = MatrixTurner.new(matrix).turn
      result << unfurl(rotated_matrix)
    end
    result.flatten
  end
end
