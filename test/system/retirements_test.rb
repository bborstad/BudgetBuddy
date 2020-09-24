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

    click_on "Create Retirement"

    assert_text "Retirement was successfully created"
    click_on "Back"
  end

  test "updating a Retirement" do
    visit retirements_url
    click_on "Edit", match: :first

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
