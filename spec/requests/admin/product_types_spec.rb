require "rails_helper"

RSpec.describe "Api::Admin::ProductTypeAPI", type: :request do
  describe "GET /api/admin/product_types" do
    let(:path) { "/api/admin/product_types" }
    context "with authorization" do
      let(:current_admin) { create(:admin) }
      subject { get_with_auth path, {}, {}, true }
      let(:count) { 5 }
      before { create_list(:product_type, count) }

      it "get all records" do
        subject
        body = JSON.parse(response.body)
        expect(body.length).to eq count
      end
      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("admin/product_type_list")
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { get path }
      it_behaves_like "401"
    end
  end

  describe "POST /api/admin/product_types" do
    let(:current_admin) { create(:admin) }
    let(:path) { "/api/admin/product_types" }
    let(:params) { { product_type_id: 99, product_type_name: "Sample" } }

    context "with authorization" do
      subject { post_with_auth path, params, {}, true }

      it "create a new record" do
        expect{ subject }.to change{ ProductType.count }.by(1)
      end
      it "get created record" do
        subject
        body = JSON.parse(response.body)
        expect(body).not_to be nil
      end
      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("admin/product_type")
      end
      it_behaves_like "201"
    end

    context "without authorization" do
      subject { post path, params: params }
      it_behaves_like "401"
    end
  end

  describe "GET /api/admin/product_types/:id" do
    let(:path) { "/api/admin/product_types" }
    let(:product_type_id) { create(:product_type)[:product_type_id] }

    context "with authorization" do
      let(:current_admin) { create(:admin) }
      subject { get_with_auth "#{path}/#{product_type_id}", {}, {}, true }

      it "get a record by id" do
        subject
        expect(JSON.parse(response.body)).not_to be nil
      end
      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("admin/product_type")
      end
      it "return not found response when invalid id is given" do
        get_with_auth "#{path}/invalid", {}, {}, true
        expect(response.status).to eq 404
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { get "#{path}/1" }
      it_behaves_like "401"
    end
  end

  describe "PUT /api/admin/product_types/:id" do
    let(:current_admin) { create(:admin) }
    let(:path) { "/api/admin/product_types" }
    let(:product_type_id) { create(:product_type)[:product_type_id] }
    let(:new_product_type_name) { "Updated Product Type Name" }
    let(:params) { { product_type_name: new_product_type_name } }

    context "with authorization" do
      subject { put_with_auth "#{path}/#{product_type_id}", params, {}, true }

      it "update product type record" do
        expect{ subject }.to change{ ProductType.find_by(product_type_id: product_type_id)[:product_type_name] }.to(new_product_type_name)
      end
      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("admin/product_type")
      end
      it "return not found response when invalid id is given" do
        put_with_auth "#{path}/invalid", params, {}, true
        expect(response.status).to eq 404
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { put "#{path}/1", params: params }
      it_behaves_like "401"
    end
  end

  describe "DELETE /api/admin/product_types/:id" do
    let(:current_admin) { create(:admin) }
    let(:path) { "/api/admin/product_types" }
    let!(:product_type_id) { create(:product_type)[:product_type_id] }

    context "with authorization" do
      subject { delete_with_auth "#{path}/#{product_type_id}", {}, {}, true }

      it "delete product type record" do
        expect{ subject }.to change{ ProductType.count }.by(-1)
      end
      it "return not found response when invalid id is given" do
        delete_with_auth "#{path}/invalid", {}, {}, true
        expect(response.status).to eq 404
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { delete "#{path}/1" }
      it_behaves_like "401"
    end
  end
end
