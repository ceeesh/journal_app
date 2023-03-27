require 'rails_helper'

# Test suite for the Category Model
RSpec.describe Category, type: :model do
    # Relationship Test
    it { should belong_to(:user) }

    it { should have_many(:tasks) }

    # Validation test
    it { should validate_presence_of(:title) }
end
