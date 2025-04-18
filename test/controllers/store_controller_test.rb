require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select "nav a", minimum: 4
    assert_select ".max-w-7xl .space-y-8 > div", 3
    assert_select "h2", "The Pragmatic Programmer"
    assert_select ".text-2xl.font-bold.text-black", /\$[,\d]+\.\d\d/
    assert_select "button", "Add to Cart"
  end
end
