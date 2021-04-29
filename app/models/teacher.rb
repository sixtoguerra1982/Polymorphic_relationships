class Teacher < ApplicationRecord
    validates :name, presence: true
    has_many :comments, as: :commentable
    def self.by_name
        self.order("name")
    end
end
