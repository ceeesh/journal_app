class Task < ApplicationRecord
    validates :category_id, presence: true
    belongs_to :category

    # scope :by_user, lambda { |user| 
    #     where(:user_id => user.id)
    # }
end
