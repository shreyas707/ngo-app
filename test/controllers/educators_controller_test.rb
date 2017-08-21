require 'test_helper'

class EducatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get educators_new_url
    assert_response :success
  end

  test "should get edit" do
    get educators_edit_url
    assert_response :success
  end

end
