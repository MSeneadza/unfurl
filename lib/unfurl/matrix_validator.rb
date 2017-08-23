class MatrixValidator
  MAX_VALID_CHARS = 1

  def initialize(matrix)
    @matrix = matrix
  end

  def validate
    result = { success: true, messages: [] }
    validate_not_empty(result)
    return result unless result[:success]
    validate_shape(result)
    validate_data_type(result)
    result
  end

  def validate_data_type(result)
    single_capital_alpha_char = /[A-Z]/

    flattened_matrix = @matrix.flatten
    non_cap_alpha_chars = flattened_matrix.select { |cell| cell !~ single_capital_alpha_char }

    non_single_chars = flattened_matrix.select { |cell| cell.size > MAX_VALID_CHARS }

    invalid_data = !non_cap_alpha_chars.empty? || !non_single_chars.empty?

    if invalid_data
      result[:success] = false
      result[:messages] << 'Every member of the matrix must be a single uppercase English letter.'
    end
    result
  end

  def validate_not_empty(result)
    empty_matrix = false
    if @matrix.empty? || @matrix.first.empty?
      empty_matrix = true
      result[:success] = false
    end
    result[:messages] << 'Matrix must not be empty.' if empty_matrix
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
end
