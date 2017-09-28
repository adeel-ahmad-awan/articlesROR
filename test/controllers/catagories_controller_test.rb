require "test_helper"

class CatagoriesControllerTest < ActionController::TestCase

  def setup
    @catagory = Catagory.create(name: "sports")
    @user = User.create(username: "john",
                        email: "john@email.com",
                        password: "password",
                        admin: true)
  end

  test "should get catagories index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "should get show" do
    get(:show, {'id' => @catagory.id})
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Catagory.count' do
      post :create, catagory: {name: "sports"}
    end
    assert_redirected_to catagories_path
  end

end
