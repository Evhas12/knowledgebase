require "application_system_test_case"
require "action_text/system_test_helper"

class QuestionsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  include ActionText::SystemTestHelper
  
  setup do
    @question = questions(:one)
  end

  test "visiting the index" do
    sign_in users(:one)
    visit questions_url
    assert_selector "h1", text: "Questions"
  end

  test "should create question" do
    sign_in users(:one)
    visit questions_url
    click_on "New question"

    select "CategoryOne", from: "Category"
    fill_in "Slug", with: "topicthree"
    fill_in "Topic", with: "Topic Three"
    # find(".trix-content").set("This is the answer to topic three")
    fill_in_rich_text_area "Answer", with: "This is the answer to topic three"
    check "Publish"
    click_on "Submit"

    assert_text "Question was successfully created"
    click_on "Back"
  end

  test "should update Question" do
    sign_in users(:one)
    visit question_url(@question)
    click_on "Edit this question", match: :first

    select "CategoryOne", from: "Category"
    fill_in "Slug", with: @question.slug
    fill_in "Topic", with: @question.topic
    click_on "Submit"

    assert_text "Question was successfully updated"
    click_on "Back"
  end

  test "should destroy Question" do
    sign_in users(:one)
    visit question_url(@question)
    click_on "Destroy this question", match: :first
    accept_confirm

    assert_text "Question was successfully destroyed"
  end
end
