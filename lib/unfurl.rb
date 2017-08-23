require 'unfurl/array_printer'
require 'unfurl/matrix_turner'
require 'unfurl/matrix_validator'

class Unfurl
  def initialize(input_matrix)
    @matrix = input_matrix.dup # duplicating to prevent mutating the passed in matrix
    @outputter = ArrayPrinter
    @validator = MatrixValidator.new(input_matrix)
  end

  def process
    validation_result = @validator.validate
    if validation_result[:success]
      result = unfurl(@matrix)
      @outputter.new(result).print
    else
      'Invalid input.  Please correct the following: ' << validation_result[:messages].join(' ')
    end
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
