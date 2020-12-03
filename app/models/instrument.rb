class Instrument < ApplicationRecord
    belongs_to :user
    belongs_to :category
    # accepts_nested_attributes_for :category, reject_if: :all_blank


    def category_attributes=(attribute_hash)
        category = Category.find_or_create_by(attribute_hash)
        self.category = category
        # binding.pry
    end 
end
