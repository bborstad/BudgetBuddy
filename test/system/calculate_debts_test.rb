require "application_system_test_case"

class CalculateDebtsTest < ApplicationSystemTestCase
  setup do
    @calculate_debt = calculate_debts(:one)
  end

  test "visiting the index" do
    visit calculate_debts_url
    assert_selector "h1", text: "Calculate Debts"
  end

  test "creating a Calculate debt" do
    visit calculate_debts_url
    click_on "New Calculate Debt"

    fill_in "Compounds per year", with: @calculate_debt.compounds_per_year
    fill_in "Email", with: @calculate_debt.email
    fill_in "Monthly payements", with: @calculate_debt.monthly_payements
    fill_in "Number of year", with: @calculate_debt.number_of_year
    fill_in "Principle", with: @calculate_debt.principle
    fill_in "Rate", with: @calculate_debt.rate
    fill_in "Select", with: @calculate_debt.select
    click_on "Create Calculate debt"

    assert_text "Calculate debt was successfully created"
    click_on "Back"
  end

  test "updating a Calculate debt" do
    visit calculate_debts_url
    click_on "Edit", match: :first

    fill_in "Compounds per year", with: @calculate_debt.compounds_per_year
    fill_in "Email", with: @calculate_debt.email
    fill_in "Monthly payements", with: @calculate_debt.monthly_payements
    fill_in "Number of year", with: @calculate_debt.number_of_year
    fill_in "Principle", with: @calculate_debt.principle
    fill_in "Rate", with: @calculate_debt.rate
    fill_in "Select", with: @calculate_debt.select
    click_on "Update Calculate debt"

    assert_text "Calculate debt was successfully updated"
    click_on "Back"
  end

  test "destroying a Calculate debt" do
    visit calculate_debts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Calculate debt was successfully destroyed"
  end
end
