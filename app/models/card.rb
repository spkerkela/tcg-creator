class Card < ActiveRecord::Base


    validates :name,
        presence: true, 
        uniqueness: {case_sensitive: false},
        length: {maximum: 40, minimum: 1}

    has_many :fields, dependent: :destroy

    accepts_nested_attributes_for :fields, reject_if: lambda { |a| a[:content].blank? || a[:name].blank? }, allow_destroy: true
end
