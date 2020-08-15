require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PredictionsHelper. For example:
#
# describe PredictionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
module AppComponent
  RSpec.describe PredictionsHelper, type: :helper do
    it "returns a nice prediction text" do
      Named = Struct.new(:name)
      text = prediction_text(Named.new("A"), Named.new("B"), Named.new("C"))
      expect(text).to eq "In the game between A and B the winner will be C"
    end
  end
end
