require 'spec_helper'

RSpec.describe ArrayPrinter do
  it 'can properly format its output' do
    input = %w(A B C D H L K J I E F G)
    expect(ArrayPrinter.new(input).print).to eq('a b c d h l k j i e f g')
  end
end
