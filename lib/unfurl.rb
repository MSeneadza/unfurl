require 'unfurl/version'

class Unfurl
  def initialize(input_matrix)
    @matrix = input_matrix.dup # duplicating to prevent mutating the passed in matrix
  end

  def process
    #validate input
    result = unfurl(@matrix)
    print(result)
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

  def print(unfurled_matrix)
    unfurled_matrix.map(&:downcase).join(' ')
  end
end
