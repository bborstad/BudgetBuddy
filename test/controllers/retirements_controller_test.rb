require 'test_helper'

class RetirementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retirement = retirements(:one)
  end

  test "should get index" do
    get retirements_url
    assert_response :success
  end

  test "should get new" do
    get new_retirement_url
    assert_response :success
  end

  test "should create retirement" do
    assert_difference('Retirement.count') do
      post retirements_url, params: { retirement: {  } }
    end

    assert_redirected_to retirement_url(Retirement.last)
  end

  test "should show retirement" do
    get retirement_url(@retirement)
    assert_response :success
  end

  test "should get edit" do
    get edit_retirement_url(@retirement)
    assert_response :success
  end

  test "should update retirement" do
    patch retirement_url(@retirement), params: { retirement: {  } }
    assert_redirected_to retirement_url(@retirement)
  end

  test "should destroy retirement" do
    assert_difference('Retirement.count', -1) do
      delete retirement_url(@retirement)
    end

    assert_redirected_to retirements_url
  end
end
