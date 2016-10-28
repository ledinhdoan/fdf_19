require "rails_helper"

RSpec.describe "admin/categories/show", type: :view do
  let(:category) {FactoryGirl.create :category}
  let(:product) do
    mock_model Product, name: "product"
  end
  it "should display list category" do
    assign :category, category
    assign :products, [product]
    render

    expect(rendered).to include category.name
    expect(rendered).to include l category.created_at, format: :short
    expect(rendered).to include l category.updated_at, format: :long
    expect(rendered).to include product.name
  end
end
