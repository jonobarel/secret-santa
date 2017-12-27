require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit users_url
  #
  #   assert_selector "h1", text: "User"
  # end
  def setup
  	@user = users[:alice]
  end

  test "users saved" do 
  	assert_not_nil(users[:david])
  end

  test "join an exchange" do
  	@user.join(Exchange.find(1))
  	assert_error @user.join(Exchange.find(1))

  end

  test "join with secret name" do
  	@user.join(Exchange.find(2), secret_name: "not_alice")
  	assert_equal @user.participation.find_by(exchange: 2).secret_name, "not_alice"
  end

  test "leave an exchange" do
  	ex = Exchange.find(2)
  	@user.leave(ex)
  	assert_nil @user.exchanges.find(2)
  	assert_error @user.leave(ex)
  end

end
