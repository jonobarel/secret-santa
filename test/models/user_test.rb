require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "joining an exchange" do
  	users = User.first(5)
  	ex = Exchange.first
  	users.each do |u| 
  		u.join(ex)
  	end
  	users.each do |u| 
  		assert_not_nil ex.users.find(u.id)
  	end
  end

end
