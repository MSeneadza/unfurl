class MatrixTurner
  def initialize(matrix)
    @matrix = matrix
  end

  def turn
    reversed = @matrix.collect {|elem| elem.reverse}
    reversed.transpose
  end
end