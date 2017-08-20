require "spec_helper"

RSpec.describe Unfurl do
  it "has a version number" do
    expect(Unfurl::VERSION).not_to be nil
  end

  it "can unfurl a small matrix" do
    # make these expect arrays
    input = [['A', 'B'],
             ['C', 'D']]
    expect(Unfurl.new(nil).unfurl(input)).to eq(%w(A B D C))
  end

  it "can unfurl a large matrix" do
    input = [['A', 'B', 'C', 'D'],
             ['E', 'F', 'G', 'H'],
             ['I', 'J', 'K', 'L']]
    expect(Unfurl.new(nil).unfurl(input)).to eq(%w(A B C D H L K J I E F G))
  end

  it 'can properly format its output' do
    # lower case and space it
  end
end
