class Instrument < ApplicationRecord
    belongs_to :user
    belongs_to :category
    # accepts_nested_attributes_for :category, reject_if: :all_blank, allow_destroy: :true


    def category_attributes=(attribute_hash)
        Instrument.find_or_create_by(name: attribute_hash[:name])
    end 
end
