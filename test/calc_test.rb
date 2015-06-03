require 'test_helper'

class CalculatorTest < MiniTest::Test
  
  def setup
    @calculator = ResearchMinitest::Calculator.new
  end
  
  def test_that_calculator_can_do_subtractions
    result1 = @calculator.subtract(10, 2)
    result2 = @calculator.subtract(1,-1)

    assert_equal result1, 8
    assert_equal result2, 2
  end

  def test_that_calculator_can_do_multiplication
    result1 = @calculator.multiply(2,2)
    result2 = @calculator.multiply(1000,0)

    assert_equal result1, 4
    assert_equal result2, 0
  end

  def test_that_calculator_can_sum_a_set_of_numbers
    number_set1 = [1,2,3]
    number_set2 = [1,-2,3]
    number_set3 = []

    result1 = @calculator.sum(number_set1)
    result2 = @calculator.sum(number_set2)
    result3 = @calculator.sum(number_set3)

    assert_equal result1, 6
    assert_equal result2, 2
    assert_equal result3, 0
  end

end

