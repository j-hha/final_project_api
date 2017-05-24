require 'test_helper'

class PurchaseCupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_cup = purchase_cups(:one)
  end

  test "should get index" do
    get purchase_cups_url, as: :json
    assert_response :success
  end

  test "should create purchase_cup" do
    assert_difference('PurchaseCup.count') do
      post purchase_cups_url, params: { purchase_cup: { brand: @purchase_cup.brand, date: @purchase_cup.date, fair_trade: @purchase_cup.fair_trade, price: @purchase_cup.price, rating: @purchase_cup.rating } }, as: :json
    end

    assert_response 201
  end

  test "should show purchase_cup" do
    get purchase_cup_url(@purchase_cup), as: :json
    assert_response :success
  end

  test "should update purchase_cup" do
    patch purchase_cup_url(@purchase_cup), params: { purchase_cup: { brand: @purchase_cup.brand, date: @purchase_cup.date, fair_trade: @purchase_cup.fair_trade, price: @purchase_cup.price, rating: @purchase_cup.rating } }, as: :json
    assert_response 200
  end

  test "should destroy purchase_cup" do
    assert_difference('PurchaseCup.count', -1) do
      delete purchase_cup_url(@purchase_cup), as: :json
    end

    assert_response 204
  end
end
