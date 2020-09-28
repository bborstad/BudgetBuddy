require 'test_helper'

class CalculateDebtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calculate_debt = calculate_debts(:one)
  end

  test "should get index" do
    get calculate_debts_url
    assert_response :success
  end

  test "should get new" do
    get new_calculate_debt_url
    assert_response :success
  end

  test "should create calculate_debt" do
    assert_difference('CalculateDebt.count') do
      post calculate_debts_url, params: { calculate_debt: { compounds_per_year: @calculate_debt.compounds_per_year, monthly_payements: @calculate_debt.monthly_payements, number_of_year: @calculate_debt.number_of_year, principle: @calculate_debt.principle, rate: @calculate_debt.rate } }
    end

    assert_redirected_to calculate_debt_url(CalculateDebt.last)
  end

  test "should show calculate_debt" do
    get calculate_debt_url(@calculate_debt)
    assert_response :success
  end

  test "should get edit" do
    get edit_calculate_debt_url(@calculate_debt)
    assert_response :success
  end

  test "should update calculate_debt" do
    patch calculate_debt_url(@calculate_debt), params: { calculate_debt: { compounds_per_year: @calculate_debt.compounds_per_year, monthly_payements: @calculate_debt.monthly_payements, number_of_year: @calculate_debt.number_of_year, principle: @calculate_debt.principle, rate: @calculate_debt.rate } }
    assert_redirected_to calculate_debt_url(@calculate_debt)
  end

  test "should destroy calculate_debt" do
    assert_difference('CalculateDebt.count', -1) do
      delete calculate_debt_url(@calculate_debt)
    end

    assert_redirected_to calculate_debts_url
  end
end
