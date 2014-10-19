require File.dirname(__FILE__) + '/test_helper'
require "app/models/user"

class UserTest < Test::Unit::TestCase
   def test_intialize_with_attributes
    user = User.new(id: 1, name: "Marc")
    assert_equal 1, user.id
    assert_equal "Marc", user.name
  end
end
