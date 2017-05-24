require 'test_helper'

class ConsumptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consumption = consumptions(:one)
  end

  test "should get index" do
    get consumptions_url, as: :json
    assert_response :success
  end

  test "should create consumption" do
    assert_difference('Consumption.count') do
      post consumptions_url, params: { consumption: { beverage_type: @consumption.beverage_type, caffeine: @consumption.caffeine, cal: @consumption.cal, date: @consumption.date, disposable_cup: @consumption.disposable_cup, size: @consumption.size } }, as: :json
    end

    assert_response 201
  end

  test "should show consumption" do
    get consumption_url(@consumption), as: :json
    assert_response :success
  end

  test "should update consumption" do
    patch consumption_url(@consumption), params: { consumption: { beverage_type: @consumption.beverage_type, caffeine: @consumption.caffeine, cal: @consumption.cal, date: @consumption.date, disposable_cup: @consumption.disposable_cup, size: @consumption.size } }, as: :json
    assert_response 200
  end

  test "should destroy consumption" do
    assert_difference('Consumption.count', -1) do
      delete consumption_url(@consumption), as: :json
    end

    assert_response 204
  end
end
