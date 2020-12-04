class Instrument < ApplicationRecord
    belongs_to :user
    belongs_to :category
    validates :name, :price, :weight, :description, presence: true
    validates :name, :description, uniqueness: true
    scope :heavy, -> { where("weight > 100") }
    scope :expensive, -> { where("price > 500") }
 
    # accepts_nested_attributes_for :category, reject_if: :all_blank


    def category_attributes=(attribute_hash)
        category = Category.find_or_create_by(attribute_hash)
        self.category = category
    end 
end
