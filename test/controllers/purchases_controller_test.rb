require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase = purchases(:one)
  end

  test "should get index" do
    get purchases_url, as: :json
    assert_response :success
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post purchases_url, params: { purchase: { brand: @purchase.brand, by_cup: @purchase.by_cup, date: @purchase.date, fair_trade: @purchase.fair_trade, price: @purchase.price, rating: @purchase.rating } }, as: :json
    end

    assert_response 201
  end

  test "should show purchase" do
    get purchase_url(@purchase), as: :json
    assert_response :success
  end

  test "should update purchase" do
    patch purchase_url(@purchase), params: { purchase: { brand: @purchase.brand, by_cup: @purchase.by_cup, date: @purchase.date, fair_trade: @purchase.fair_trade, price: @purchase.price, rating: @purchase.rating } }, as: :json
    assert_response 200
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete purchase_url(@purchase), as: :json
    end

    assert_response 204
  end
end
