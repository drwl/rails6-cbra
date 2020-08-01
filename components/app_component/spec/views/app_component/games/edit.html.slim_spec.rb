require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      location: "MyString",
      first_team_id: 1,
      second_team_id: 1,
      winning_team: 1,
      first_team_score: 1,
      second_team_score: 1
    ))
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input[name=?]", "game[location]"

      assert_select "input[name=?]", "game[first_team_id]"

      assert_select "input[name=?]", "game[second_team_id]"

      assert_select "input[name=?]", "game[winning_team]"

      assert_select "input[name=?]", "game[first_team_score]"

      assert_select "input[name=?]", "game[second_team_score]"
    end
  end
end
