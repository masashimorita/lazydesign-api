require "rails_helper"

RSpec.describe "Api::V1::ProductTypeAPI", type: :request do
  describe "GET /api/v1/product_types" do
    let(:path) { "/api/v1/product_types" }

    context "with authorization" do
      let(:current_user) { create(:user) }
      subject { get_with_auth path }
      let(:count) { 5 }
      before { create_list(:product_type, count) }

      it "get all records" do
        subject
        body = JSON.parse(response.body)
        expect(body["data"].length).to eq count
      end
      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("v1/product_type_list")
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { get path }
      it_behaves_like "401"
    end
  end

  describe "GET /api/v1/product_types/:id" do
    let(:path) { "/api/v1/product_types" }
    let(:product_type_id) { create(:product_type)[:product_type_id] }

    context "with authorization" do
      let(:current_user) { create(:user) }
      subject { get_with_auth "#{path}/#{product_type_id}" }

      it "get a record by id" do
        subject
        expect(JSON.parse(response.body)).not_to be nil
      end
      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("v1/product_type")
      end
      it "return not found response when invalid id is given" do
        get_with_auth "#{path}/invalid"
        expect(response.status).to eq 404
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { get "#{path}/1" }
      it_behaves_like "401"
    end
  end
end
