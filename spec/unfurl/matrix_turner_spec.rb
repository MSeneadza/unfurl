require 'spec_helper'

RSpec.describe MatrixTurner do

  it 'can rotate a small matrix 90 degrees counter-clockwise' do
    input = [['A', 'B'], ['C', 'D']]
    expect(MatrixTurner.new(input).turn).to eq([['B', 'D'], ['A', 'C']])
  end

  it 'can rotate a medium-sized matrix 90 degrees counter-clockwise' do
    input = [['A', 'B', 'C', 'D'],
             ['E', 'F', 'G', 'H'],
             ['I', 'J', 'K', 'L'],
             ['M', 'N', 'O', 'P']]
    expect(MatrixTurner.new(input).turn).to eq([['D', 'H', 'L', 'P'],
                                                       ['C', 'G', 'K', 'O'],
                                                       ['B', 'F', 'J', 'N'],
                                                       ['A', 'E', 'I', 'M']])
  end
end