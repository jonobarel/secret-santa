require 'test_helper'

class GiveAwaysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get give_aways_new_url
    assert_response :success
  end

  test "should get open" do
    get give_aways_open_url
    assert_response :success
  end

  test "should get close" do
    get give_aways_close_url
    assert_response :success
  end

  test "should get gift" do
    get give_aways_gift_url
    assert_response :success
  end

end
