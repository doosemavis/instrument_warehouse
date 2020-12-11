class Category < ApplicationRecord
    has_many :instruments
    has_many :users, through: :instruments
    validates :name, presence: true
    validates :name, uniqueness: true
end
 