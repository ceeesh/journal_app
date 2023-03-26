class Category < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    belongs_to :user
    has_many :tasks

    scope :by_user, lambda { |user| 
        where(:user_id => user.id)
    }
end

