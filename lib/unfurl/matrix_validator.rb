class MatrixValidator
  def initialize(matrix)
    @matrix = matrix
  end

  def validate
    result = { success: true, messages: [] }
    validate_not_empty(result)
    return result if result[:success] == false
    validate_shape(result)
    validate_data_type(result)
    result
  end

  def validate_shape(result)
    invalid_shape = false
    num_cells = @matrix.first.size
    @matrix.each do |row|
      if row.size != num_cells
        result[:success] = false
        invalid_shape = true
      end
    end
    result[:messages] << 'All rows in the matrix must contain the same number of elements.' if invalid_shape
  end

  def validate_data_type(result)

  end

  def validate_not_empty(result)
    empty_matrix = false
    if @matrix.empty? || @matrix.first.empty?
      empty_matrix = true
      result[:success] = false
      result[:messages] << 'Matrix must not be empty.' if empty_matrix
    end
    result
  end
end