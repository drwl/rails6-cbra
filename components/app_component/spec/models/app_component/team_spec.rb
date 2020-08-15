require 'rails_helper'

module AppComponent
  RSpec.describe Team, type: :model do
    it { should validate_presence_of :name }
  end
end
