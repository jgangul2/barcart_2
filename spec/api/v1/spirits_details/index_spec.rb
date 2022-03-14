require "rails_helper"

RSpec.describe "spirits_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/spirits_details", params: params
  end

  describe "basic fetch" do
    let!(:spirits_detail1) { create(:spirits_detail) }
    let!(:spirits_detail2) { create(:spirits_detail) }

    it "works" do
      expect(SpiritsDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["spirits_details"])
      expect(d.map(&:id)).to match_array([spirits_detail1.id,
                                          spirits_detail2.id])
    end
  end
end
