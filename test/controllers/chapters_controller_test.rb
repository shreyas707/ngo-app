require 'test_helper'

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get chapters_new_url
    assert_response :success
  end

  test "should get edit" do
    get chapters_edit_url
    assert_response :success
  end

end
