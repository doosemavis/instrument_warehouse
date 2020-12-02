class Instrument < ApplicationRecord
    belongs_to :user
    belongs_to :category
    accepts_nested_attributes_for :category
end
