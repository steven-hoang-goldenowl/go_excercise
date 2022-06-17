require 'minitest/autorun'
require './resolver'
class TestCalculate < Minitest::Test
  describe 'when input is (10, [3, 4, 5, 6, 7])' do
    before do
      @data = Calculate.new(10, [3, 4, 5, 6, 7])
    end
    it 'must equal [[4, 6], [3, 7]]' do
      @data.calculate_desired_sum.must_equal [[3, 7], [4, 6]]
    end
  end

  describe 'when input is (8, [3, 4, 5, 4, 4])' do
    before do
      @data = Calculate.new(8, [3, 4, 5, 4, 4])
    end
    it 'must equal [(3, 5)]' do
      @data.calculate_desired_sum.must_equal [[3, 5]]
    end
  end
end
