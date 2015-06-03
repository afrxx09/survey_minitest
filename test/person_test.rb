require 'test_helper'

class PersonTest < MiniTest::Test
  
  def setup
    @person = ResearchMinitest::Person.new('Bob', 35)
  end

  def test_that_a_person_can_speak
    assert_equal @person.speak, 'Hello!'
  end

  def test_that_a_person_has_a_name
    assert_equal @person.name, 'Bob'
  end

  def test_that_a_person_is_tired_after_working
    hours = 5
    @person.work(hours)

    assert @person.tired
  end

  def test_that_a_person_is_able_to_rest
    @person.rest

    refute @person.tired
  end

  def test_that_a_person_can_not_work_if_tired
    hours = 8
    first_work_result = @person.work(hours)
    second_work_result = @person.work(hours)

    assert_equal first_work_result, "job's done!"
    assert_equal second_work_result, "too tired"
  end

  def test_that_a_person_can_work_to_get_income
    current_salary = @person.salary
    hours = 3
    current_cash = @person.cash
    expected_cash_after_work = current_cash + (current_salary * hours)
    
    @person.work(hours)
    
    assert_equal expected_cash_after_work, @person.cash
  end

  def test_that_a_person_can_purchase_items_with_its_cash
    @person.cash = 100
    item = "jeans"
    price = 50
    expected_cash_after_purchase = @person.cash - price 

    purchase_success = @person.buy_something(item, price)

    assert_includes @person.items, item
    assert_equal expected_cash_after_purchase, @person.cash
    assert purchase_success
  end

  def test_that_a_person_can_not_purchase_items_that_it_can_not_afford
    @person.cash = 1000
    item = "car"
    price = 2000

    purchase_success = @person.buy_something(item, price)

    refute purchase_success
    refute_includes @person.items, item
  end

end