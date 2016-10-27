require "rails_helper"

RSpec.describe OrderDetail, type: :model do
  context "association" do
    it {is_expected.to belong_to :order}
    it {is_expected.to belong_to :product}
  end

  it "instance methods" do
    @product = FactoryGirl.create(:product, price: "1")
    @order_detail = FactoryGirl.create(:order_detail, quantity: "1", product: @product)
    expect(@order_detail.total_price)
  end
end
