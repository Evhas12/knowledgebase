require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @category = categories(:one)
  end

  test "visiting the index" do
    sign_in users(:one)
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "should create category" do
    sign_in users(:one)
    visit categories_url
    click_on "New category"

    fill_in "Slug", with: "categorythree"
    fill_in "Title", with: "CategoryThree"
    click_on "Submit"

    assert_text "Category was successfully created"
    click_on "Back"
  end

  test "should update Category" do
    sign_in users(:one)
    visit category_url(@category)
    click_on "Edit this category", match: :first

    fill_in "Slug", with: @category.slug
    fill_in "Title", with: @category.title
    click_on "Submit"

    assert_text "Category was successfully updated"
    click_on "Back"
  end

  test "should destroy Category" do
    sign_in users(:one)
    visit category_url(@category)
    click_on "Destroy this category", match: :first

    assert_text "Category was successfully destroyed"
  end
end
