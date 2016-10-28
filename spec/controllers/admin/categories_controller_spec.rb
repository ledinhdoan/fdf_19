require "rails_helper"

RSpec.describe Admin::CategoriesController , type: :controller do
  let(:category) {FactoryGirl.create :category}
  before :each do
    user = FactoryGirl.create(:user, is_admin: true)
    sign_in user
  end
  describe "GET #index" do
    it "should index all category" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    let(:product) do
      mock_model Product, name: "Product1", category: category
    end

    it "should show category" do
      get :show, {id: category}
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "should created category" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "created category" do
      post :create, category: {name: category}
      response.should redirect_to admin_categories_path
    end

    it "don't created category" do
      post :create, category: {name: nil}
      expect(response).to render_template(:new)
    end
  end

  describe "PUT #update" do
    it "updated category" do
      put :update, id: category,
        category: FactoryGirl.attributes_for(:category)
      response.should redirect_to admin_category_path
    end

    it "don't update category" do
      put :update, {id: category, category: {name: nil}}
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    it "deleted category" do
      delete :destroy, {id: category}
      expect(flash[:success]).not_to be_empty
    end

    it "don't delete category" do
      delete :destroy, {id: 0}
      expect(flash[:warning]).not_to be_empty
      response.should redirect_to root_path
    end
  end
end
