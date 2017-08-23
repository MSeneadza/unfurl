require 'spec_helper'

RSpec.describe MatrixValidator do
  it 'can can identify valid input' do
    input = [['A', 'B'],
             ['C', 'D']]
    result = MatrixValidator.new(input).validate
    expect(result[:success]).to eq(true)
  end

  it 'returns no messages if matrix is valid' do
    input = [['A', 'B'],
             ['C', 'D']]
    result = MatrixValidator.new(input).validate
    expect(result[:messages].empty?).to eq(true)
  end

  it 'can identify empty matrices' do
    input = []
    result = MatrixValidator.new(input).validate
    expect(result[:success]).to eq(false)
  end

  it 'can identify matrices with empty rows' do
    input = [[], [], []]
    result = MatrixValidator.new(input).validate
    expect(result[:success]).to eq(false)
  end

  it 'can return the proper message for empty matrices' do
    input = [[], [], []]
    result = MatrixValidator.new(input).validate
    message_found = result[:messages].detect { |cell| cell == 'Matrix must not be empty.' }
    expect(message_found).to be_truthy
  end

  it 'can identify matrices with invalid size' do
    input = [['A'],
             ['C', 'D']]
    result = MatrixValidator.new(input).validate
    expect(result[:success]).to eq(false)
  end

  it 'can return the proper message for matrices with invalid size' do
    input = [['A'],
             ['C', 'D']]
    result = MatrixValidator.new(input).validate
    message_found = result[:messages].detect { |cell| cell == 'All rows in the matrix must contain the same number of elements.' }
    expect(message_found).to be_truthy
  end

  it 'can identify non-array input' do
    input = nil
    result = MatrixValidator.new(input).validate
    expect(result[:success]).to eq(false)
  end

  it 'can return the proper message for non-array input' do
    input = 'a,b,c,d'
    result = MatrixValidator.new(input).validate
    message_found = result[:messages].detect { |cell| cell == 'Input must be a two-dimensional array.' }
    expect(message_found).to be_truthy
  end

  it 'can identify non-two-dimensional-array input' do
    input = [1]
    result = MatrixValidator.new(input).validate
    expect(result[:success]).to eq(false)
  end

  it 'can return the proper message for non-two-dimensional-array input' do
    input = [nil]
    result = MatrixValidator.new(input).validate
    message_found = result[:messages].detect { |cell| cell == 'Input must be a two-dimensional array.' }
    expect(message_found).to be_truthy
  end

  it 'can identify nil input' do
    input = [[nil]]
    result = MatrixValidator.new(input).validate
    expect(result[:success]).to eq(false)
  end

  it 'can identify nil input deep within the input' do
    input = [['A'], nil]
    result = MatrixValidator.new(input).validate
    expect(result[:success]).to eq(false)
  end

  describe 'invalid data input' do
    invalid_data_message = 'Every member of the matrix must be a single uppercase English letter.'

    it 'can can identify invalid, lowercase input' do
      input = [['a', 'B'],
               ['C', 'D']]
      result = MatrixValidator.new(input).validate
      expect(result[:success]).to eq(false)

      message_found = result[:messages].detect { |cell| cell == invalid_data_message }
      expect(message_found).to be_truthy
    end

    it 'can can identify invalid, numeric input' do
      input = [['A', 'B'],
               ['3', 'D']]
      result = MatrixValidator.new(input).validate
      expect(result[:success]).to eq(false)

      message_found = result[:messages].detect { |cell| cell == invalid_data_message }
      expect(message_found).to be_truthy
    end

    it 'can can identify invalid, multi-character input' do
      input = [['A', 'B'],
               ['CC', 'D']]
      result = MatrixValidator.new(input).validate
      expect(result[:success]).to eq(false)

      message_found = result[:messages].detect { |cell| cell == invalid_data_message }
      expect(message_found).to be_truthy
    end

    it 'can can identify invalid, non-English input' do
      input = [['A', 'B'],
               ['Ń', 'D']]
      result = MatrixValidator.new(input).validate
      expect(result[:success]).to eq(false)

      message_found = result[:messages].detect { |cell| cell == invalid_data_message }
      expect(message_found).to be_truthy
    end
  end
end
