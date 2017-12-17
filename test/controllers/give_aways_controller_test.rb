require 'test_helper'

class ExchangesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get exchanges_new_url
    assert_response :success
  end

  test "should get open" do
    get exchanges_open_url
    assert_response :success
  end

  test "should get close" do
    get exchanges_close_url
    assert_response :success
  end

  test "should get gift" do
    get exchanges_gift_url
    assert_response :success
  end

end
