require 'rails_helper'

RSpec.describe "Landings", type: :request do
  describe "GET /landings" do
    it "works! (now write some real specs)" do
      get landings_path
      expect(response).to have_http_status(200)
    end
  end
end
