module RequestResponseExamples
  RSpec.shared_examples "200" do
    it do
      subject
      expect(response.status).to eq 200
    end
  end

  RSpec.shared_examples "201" do
    it do
      subject
      expect(response.status).to eq 201
    end
  end

  RSpec.shared_examples "400" do
    it do
      subject
      expect(response.status).to eq 400
    end
  end

  RSpec.shared_examples "401" do
    it do
      subject
      expect(response.status).to eq 401
    end
  end

  RSpec.shared_examples "404" do
    it do
      subject
      expect(response.status).to eq 404
    end
  end

  RSpec.shared_examples "409" do
    it do
      subject
      expect(response.status).to eq 409
    end
  end

  RSpec.shared_examples "500" do
    it do
      subject
      expect(response.status).to eq 500
    end
  end
end
