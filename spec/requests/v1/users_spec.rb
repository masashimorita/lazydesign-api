RSpec.describe "Api::V1::UserAPI", type: :request do
  after(:each) { User.delete_all }

  describe "GET /api/v1/users/me" do
    let!(:current_user) { create(:user) }
    let(:path) { "/api/v1/users/me" }

    context "with authorization" do
      subject { get_with_auth path }

      it "get current logged in user info" do
        subject
        expect(JSON.parse(response.body)).not_to be nil
      end
      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("v1/user")
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { get path }
      it_behaves_like "401"
    end
  end

  describe "POST /api/v1/users/sign_up" do
    let(:path) { "/api/v1/users/sign_up" }
    let(:password) { "password" }
    let!(:user_info) { build(:user, default_password: password).attributes }
    let!(:params) { { email: user_info["email"], name: user_info["name"], password: password } }
    subject { post path, params: params }

    it "create a new user" do
      expect{ subject }.to change{ User.count }.by(1)
    end
    it "has valid json schema" do
      subject
      expect(response).to match_response_schema("v1/user")
    end
    it "return bad request response when required parameters is not given" do
      params["email"] = nil
      subject
      expect(response.status).to eq 400
    end
    it "return conflict error when given email address already exist" do
      create(:user, default_email: user_info["email"])
      subject
      expect(response.status).to eq 409
    end
    it_behaves_like "201"
  end

  describe "POST /api/v1/users/sign_in" do
    let(:path) { "/api/v1/users/sign_in" }
    let(:password) { "password" }
    let!(:user) { create(:user, default_password: password) }
    let!(:params) { { email: user[:email], password: password } }
    subject { post path, params: params }

    it "has valid json schema" do
      subject
      expect(response).to match_response_schema("v1/user")
    end
    it "return not found when user with given email was not found" do
      params[:email] = "invalid@example.com"
      subject
      expect(response.status).to eq 404
    end
    it_behaves_like "200"
  end

  describe "PUT /api/v1/users/update" do
    let(:path) { "/api/v1/users/update" }
    let!(:current_user) { create(:user) }
    let!(:new_name) { "updated" }
    let!(:params) { { name: new_name } }

    context "with authorization" do
      subject { put_with_auth path, params }

      it "has valid json schema" do
        subject
        expect(response).to match_response_schema("v1/user")
      end
      it_behaves_like "200"
    end

    context "without authorization" do
      subject { put path, params: params }
      it_behaves_like "401"
    end
  end
end
