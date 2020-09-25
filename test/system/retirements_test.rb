require "application_system_test_case"

class RetirementsTest < ApplicationSystemTestCase
  setup do
    @retirement = retirements(:one)
  end

  test "visiting the index" do
    visit retirements_url
    assert_selector "h1", text: "Retirements"
  end

  test "creating a Retirement" do
    visit retirements_url
    click_on "New Retirement"

    fill_in "Annual saving", with: @retirement.annual_saving
    fill_in "Intrest", with: @retirement.intrest
    fill_in "Retire by", with: @retirement.retire_by
    fill_in "Start amount", with: @retirement.start_amount
    click_on "Create Retirement"

    assert_text "Retirement was successfully created"
    click_on "Back"
  end

  test "updating a Retirement" do
    visit retirements_url
    click_on "Edit", match: :first

    fill_in "Annual saving", with: @retirement.annual_saving
    fill_in "Intrest", with: @retirement.intrest
    fill_in "Retire by", with: @retirement.retire_by
    fill_in "Start amount", with: @retirement.start_amount
    click_on "Update Retirement"

    assert_text "Retirement was successfully updated"
    click_on "Back"
  end

  test "destroying a Retirement" do
    visit retirements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Retirement was successfully destroyed"
  end
end
