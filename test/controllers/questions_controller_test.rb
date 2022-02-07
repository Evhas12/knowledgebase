require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @question = questions(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get questions_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    sign_in users(:one)
    assert_difference("Question.count") do
      post questions_url, params: { question: { user_id: @question.user_id, category_id: @question.category_id, slug: "topicthree", topic: "TopicThree", answer: "This is Topic Three" } }
    end
    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    sign_in users(:one)
    patch question_url(@question), params: { question: { user_id: @question.user_id, category_id: @question.category_id, slug: @question.slug, topic: @question.topic } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    sign_in users(:one)
    assert_difference("Question.count", -1) do
      delete question_url(@question)
    end
    assert_redirected_to questions_url
  end
end
