require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  	ex = Exchange.first
  	users = User.first(5)
  	users.each do |u|
  		u.join(ex)
  	end
  end


  test "assigning giftees" do
  	ex = Exchange.first
  	assert_not_equal(ex.users.count, 0, "no participants found in Test Exchange")
    assert_equal(ex.giftees.count, 0, "giftees before assignment should be 0")
  	ex.lock_and_assign
  	assert_equal ex.users.order(:id).ids, ex.giftees.order(:id).ids, "Participant and giftee lists do not match"
  	ex.participations.each do |part|
  		assert_not_equal part.user.id, part.giftee.id, "Participant and giftee should not be the same!"
  	end
  end
end
