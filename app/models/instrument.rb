class Instrument < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :name, :price, :weight, presence: true
    validates :name, uniqueness: true
    scope :heavy, -> { where("weight > 100") }
    scope :expensive, -> { where("price > 500") }
    scope :cheap, -> { where("price < 1000") }
    # accepts_nested_attributes_for :category, reject_if: :all_blank

    def category_attributes=(attribute_hash)
        category = Category.find_or_create_by(attribute_hash)
        self.category = category
    end 
end
