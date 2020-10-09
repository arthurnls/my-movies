require 'test_helper'

class NetflixTitlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get netflix_titles_index_url
    assert_response :success
  end

  test "should get show" do
    get netflix_titles_show_url
    assert_response :success
  end

end
