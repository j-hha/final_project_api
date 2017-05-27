require 'test_helper'

class NutrientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nutrient = nutrients(:one)
  end

  test "should get index" do
    get nutrients_url, as: :json
    assert_response :success
  end

  test "should create nutrient" do
    assert_difference('Nutrient.count') do
      post nutrients_url, params: { nutrient: { beverage_type: @nutrient.beverage_type, caffeine: @nutrient.caffeine, cal: @nutrient.cal, fat: @nutrient.fat, sugar: @nutrient.sugar } }, as: :json
    end

    assert_response 201
  end

  test "should show nutrient" do
    get nutrient_url(@nutrient), as: :json
    assert_response :success
  end

  test "should update nutrient" do
    patch nutrient_url(@nutrient), params: { nutrient: { beverage_type: @nutrient.beverage_type, caffeine: @nutrient.caffeine, cal: @nutrient.cal, fat: @nutrient.fat, sugar: @nutrient.sugar } }, as: :json
    assert_response 200
  end

  test "should destroy nutrient" do
    assert_difference('Nutrient.count', -1) do
      delete nutrient_url(@nutrient), as: :json
    end

    assert_response 204
  end
end
