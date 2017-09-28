require 'test_helper'

class ListCatagoriesTest < ActionDispatch::IntegrationTest

  def setup
    @catagory = Catagory.create(name: "books")
    @catagory2 = Catagory.create(name: "programming")
  end

  test "should show caragories listing" do
    get catagories_path
    assert_template 'catagories/index'
    assert_select "a[href=?]", catagory_path(@catagory), text: @catagory.name
    assert_select "a[href=?]", catagory_path(@catagory2), text: @catagory2.name
  end


end
