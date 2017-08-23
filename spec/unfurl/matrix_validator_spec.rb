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
    puts result
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
    message_found = result[:messages].detect {|cell| cell == 'Matrix must not be empty.'}
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
    message_found = result[:messages].detect {|cell| cell == 'All rows in the matrix must contain the same number of elements.'}
    expect(message_found).to be_truthy
  end
end