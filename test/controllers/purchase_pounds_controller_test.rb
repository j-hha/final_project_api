require 'test_helper'

class PurchasePoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_pound = purchase_pounds(:one)
  end

  test "should get index" do
    get purchase_pounds_url, as: :json
    assert_response :success
  end

  test "should create purchase_pound" do
    assert_difference('PurchasePound.count') do
      post purchase_pounds_url, params: { purchase_pound: { brand: @purchase_pound.brand, date: @purchase_pound.date, fair_trade: @purchase_pound.fair_trade, price: @purchase_pound.price, rating: @purchase_pound.rating } }, as: :json
    end

    assert_response 201
  end

  test "should show purchase_pound" do
    get purchase_pound_url(@purchase_pound), as: :json
    assert_response :success
  end

  test "should update purchase_pound" do
    patch purchase_pound_url(@purchase_pound), params: { purchase_pound: { brand: @purchase_pound.brand, date: @purchase_pound.date, fair_trade: @purchase_pound.fair_trade, price: @purchase_pound.price, rating: @purchase_pound.rating } }, as: :json
    assert_response 200
  end

  test "should destroy purchase_pound" do
    assert_difference('PurchasePound.count', -1) do
      delete purchase_pound_url(@purchase_pound), as: :json
    end

    assert_response 204
  end
end
