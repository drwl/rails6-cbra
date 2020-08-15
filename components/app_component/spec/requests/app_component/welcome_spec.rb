require 'rails_helper'

module AppComponent
  RSpec.describe "/welcome", type: :request do
    include Engine.routes.url_helpers

    describe "GET /index" do
      it "renders a successful response" do
        get welcome_url
        expect(response).to be_successful
      end
    end
  end
end
