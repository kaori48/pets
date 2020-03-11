require 'test_helper'

class AnimalPermitsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get animal_permits_create_url
    assert_response :success
  end

  test "should get destroy" do
    get animal_permits_destroy_url
    assert_response :success
  end

end
