require "rails_helper"

RSpec.describe "spirits_brands#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/spirits_brands", params: params
  end

  describe "basic fetch" do
    let!(:spirits_brand1) { create(:spirits_brand) }
    let!(:spirits_brand2) { create(:spirits_brand) }

    it "works" do
      expect(SpiritsBrandResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["spirits_brands"])
      expect(d.map(&:id)).to match_array([spirits_brand1.id, spirits_brand2.id])
    end
  end
end
