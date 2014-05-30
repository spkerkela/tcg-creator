class Field < ActiveRecord::Base
    belongs_to :card

    validates :name,
        presence: true, 
        uniqueness: {case_sensitive: false},
        length: {maximum: 15, minimum: 1}

    validates :content, presence: true
end
