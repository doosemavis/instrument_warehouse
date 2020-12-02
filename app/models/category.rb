class Category < ApplicationRecord
    has_many :instruments
    has_many :users, through: :instruments 
end
