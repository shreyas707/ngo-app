require 'test_helper'

class LearnersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get learners_new_url
    assert_response :success
  end

end
