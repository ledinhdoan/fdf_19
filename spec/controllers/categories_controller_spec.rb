require "rails_helper"

RSpec.describe CategoriesController , type: :controller do
  describe "GET #index" do
    let(:category) do
      mock_model Category, name: "category"
    end

    it "index all category" do
      get :index, {category: category}
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    let(:category) do
      mock_model Category, name: "abc"
    end
    let(:product) do
      mock_model Product, name: "abcd", category: category
    end

    it "find and show category " do
      get :show, {id: category}
      expect(response).to render_template(:show)
    end
  end
end
