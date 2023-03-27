require 'rails_helper'


RSpec.describe Task, type: :model do
    # Test suite for the Task Model
    it { should belong_to(:category) }

     # Validation test
    it { should validate_presence_of(:category_id)}

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:body) }

     
end
