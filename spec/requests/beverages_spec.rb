require 'rails_helper'

RSpec.describe "Beverages", type: :request do
  describe "GET /beverages" do
    it "works! (now write some real specs)" do
      get beverages_path
      expect(response).to have_http_status(200)
    end
  end
end
