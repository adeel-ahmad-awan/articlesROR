require 'test_helper'

class CreateCatagoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john",
                        email: "john@email.com",
                        password: "password",
                        admin: true)
  end


  test "get new catagory form and create catagory" do
    sign_in_as(@user, "password")
    get new_catagory_path
    assert_template 'catagories/new'
    assert_difference 'Catagory.count', 1 do
      post_via_redirect catagories_path, catagory: {name: "sports"}
    end
    assert_template 'catagories/index'
    assert_match "sports", response.body
  end

  test "invalid catagoty submisstion result in failure" do
    sign_in_as(@user, "password")
    get new_catagory_path
    assert_template 'catagories/new'
    assert_no_difference 'Catagory.count' do
      post catagories_path, catagory: {name: " "}
    end
    assert_template 'catagories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end
