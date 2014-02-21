require 'test_helper'

class QuestionWeightsControllerTest < ActionController::TestCase
  setup do
    @question_weight = question_weights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_weights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_weight" do
    assert_difference('QuestionWeight.count') do
      post :create, question_weight: { expert_id: @question_weight.expert_id, question_id: @question_weight.question_id, weight: @question_weight.weight }
    end

    assert_redirected_to question_weight_path(assigns(:question_weight))
  end

  test "should show question_weight" do
    get :show, id: @question_weight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_weight
    assert_response :success
  end

  test "should update question_weight" do
    patch :update, id: @question_weight, question_weight: { expert_id: @question_weight.expert_id, question_id: @question_weight.question_id, weight: @question_weight.weight }
    assert_redirected_to question_weight_path(assigns(:question_weight))
  end

  test "should destroy question_weight" do
    assert_difference('QuestionWeight.count', -1) do
      delete :destroy, id: @question_weight
    end

    assert_redirected_to question_weights_path
  end
end
