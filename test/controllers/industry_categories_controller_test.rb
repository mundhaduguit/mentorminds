require 'test_helper'

class IndustryCategoriesControllerTest < ActionController::TestCase
  setup do
    @industry_category = industry_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:industry_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create industry_category" do
    assert_difference('IndustryCategory.count') do
      post :create, industry_category: { description: @industry_category.description, name: @industry_category.name, parent_id: @industry_category.parent_id }
    end

    assert_redirected_to industry_category_path(assigns(:industry_category))
  end

  test "should show industry_category" do
    get :show, id: @industry_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @industry_category
    assert_response :success
  end

  test "should update industry_category" do
    patch :update, id: @industry_category, industry_category: { description: @industry_category.description, name: @industry_category.name, parent_id: @industry_category.parent_id }
    assert_redirected_to industry_category_path(assigns(:industry_category))
  end

  test "should destroy industry_category" do
    assert_difference('IndustryCategory.count', -1) do
      delete :destroy, id: @industry_category
    end

    assert_redirected_to industry_categories_path
  end
end
