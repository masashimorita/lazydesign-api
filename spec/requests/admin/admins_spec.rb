require "rails_helper"

RSpec.describe "Api::Admin::AdminAPI", type: :request do
  after(:each) { Admin.delete_all }

  describe "GET /api/admin/admins/me" do
    let!(:current_admin) { create(:admin) }
    let(:path) { "/api/admin/admins/me" }

    context "with authorization" do
      subject { get_with_auth path, {}, {}, true }

      it "get current logged in admin info" do
        subject
        expect(JSON.parse(response.body)["data"]).not_to be nil
      end
      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("admin/admin")
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { get path }
      it_behaves_like "401"
    end
  end

  describe "POST /api/admin/admins/sign_up" do
    let(:path) { "/api/admin/admins/sign_up" }
    let(:password) { "password" }
    let!(:admin_info) { build(:admin, default_password: password).attributes }
    let!(:params) { { email: admin_info["email"], name: admin_info["name"], password: password } }
    subject { post path, params: params }

    it "create a new admin" do
      expect{ subject }.to change{ Admin.count }.by(1)
    end
    it "has valid json schema" do
      subject
      expect(response).to match_response_schema("admin/admin")
    end
    it "return bad request response when required parameters is not given" do
      params["email"] = nil
      subject
      expect(response.status).to eq 400
    end
    it "return conflict error when given email address already exist" do
      create(:admin, default_email: admin_info["email"])
      subject
      expect(response.status).to eq 409
    end
    it_behaves_like "201"
  end

  describe "POST /api/admin/admins/sign_in" do
    let(:path) { "/api/admin/admins/sign_in" }
    let(:password) { "password" }
    let!(:admin) { create(:admin, default_password: password) }
    let!(:params) { { email: admin[:email], password: password } }
    subject { post path, params: params }

    it "has valid json schema" do
      subject
      expect(response).to match_response_schema("admin/admin")
    end
    it "return not found when admin with given email was not found" do
      params[:email] = "invalid@example.com"
      subject
      expect(response.status).to eq 404
    end
    it_behaves_like "200"
  end

  describe "PUT /api/admin/admins/update" do
    let(:path) { "/api/admin/admins/update" }
    let!(:current_admin) { create(:admin) }
    let!(:new_name) { "updated" }
    let!(:params) { { name: new_name } }

    context "with authorization" do
      subject { put_with_auth path, params, {}, true }

      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("admin/admin")
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { put path, params: params }
      it_behaves_like "401"
    end
  end
end
