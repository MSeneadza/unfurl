class MatrixTurner
  def initialize(matrix)
    @matrix = matrix
  end

  def turn
    reversed = @matrix.collect(&:reverse)
    reversed.transpose
  end
end