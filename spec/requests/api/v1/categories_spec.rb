require "rails_helper"

RSpec.describe "Categories", :type => :request do
  before do
    @category = create(:category)
  end

  describe "when #show" do
    it "should return lesson from specyfic category" do
      get "/api/v1/categories/#{@category.id}"

      expect(response).to be_success
      expect(json['category']['name']).to eq("MyString")
    end
  end
end