require 'test_helper'

class ServingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @serving = servings(:one)
  end

  test "should get index" do
    get servings_url, as: :json
    assert_response :success
  end

  test "should create serving" do
    assert_difference('Serving.count') do
      post servings_url, params: { serving: { beverage_type: @serving.beverage_type, caffeine: @serving.caffeine, cal: @serving.cal, date: @serving.date, disposable_cup: @serving.disposable_cup, size: @serving.size, sugar_content: @serving.sugar_content } }, as: :json
    end

    assert_response 201
  end

  test "should show serving" do
    get serving_url(@serving), as: :json
    assert_response :success
  end

  test "should update serving" do
    patch serving_url(@serving), params: { serving: { beverage_type: @serving.beverage_type, caffeine: @serving.caffeine, cal: @serving.cal, date: @serving.date, disposable_cup: @serving.disposable_cup, size: @serving.size, sugar_content: @serving.sugar_content } }, as: :json
    assert_response 200
  end

  test "should destroy serving" do
    assert_difference('Serving.count', -1) do
      delete serving_url(@serving), as: :json
    end

    assert_response 204
  end
end
