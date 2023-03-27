require 'rails_helper'

# Test suite for the user model
RSpec.describe User, type: :model do
    #Relationship test
    it { should have_many(:categories) }
end