require 'rails_helper'

module AppComponent
  RSpec.describe "/prediction", type: :request do
    include Engine.routes.url_helpers

    before do
      @team1 = create_team
      @team2 = create_team
    end

    describe "GET /new" do
      it "renders a successful response" do
        get new_prediction_url
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      it "assigns a prediction as @prediction" do
        post prediction_url, params: { first_team: { id: @team1.id }, second_team: { id: @team2.id } }
        expect(response).to be_successful
      end
    end
  end
end
