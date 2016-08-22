require_relative 'spec_helper'
require 'data.maybe'
describe Maybe do
  it '#map' do
    expect(Just.new(1).map {|x| x + 1}).to eq(Just.new(2))
    expect(Nothing.map {|x| x + 1}).to eq(Nothing)
  end

  it '#get_or_else' do
    expect(Just.new(1).get_or_else(2)).to eq(1)
    expect(Nothing.get_or_else(2)).to eq(2)
  end

  it '#inspect' do
    expect(Just.new(1).inspect).to eq('#<Just 1>')
    expect(Nothing.inspect).to eq('#<Nothing>')
  end

  it '#>>=' do
    expect(Just.new(1).flat_map { |x| Nothing } ).to eq(Nothing)
    expect(Nothing.flat_map { |x| Just.new(2) } ).to eq(Nothing)
  end

end
