require "rails_helper"

RSpec.describe "spirits_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/spirits_details/#{spirits_detail.id}", params: params
  end

  describe "basic fetch" do
    let!(:spirits_detail) { create(:spirits_detail) }

    it "works" do
      expect(SpiritsDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("spirits_details")
      expect(d.id).to eq(spirits_detail.id)
    end
  end
end
