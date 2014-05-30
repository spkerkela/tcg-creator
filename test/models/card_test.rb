require 'test_helper'

class CardTest < ActiveSupport::TestCase
    
    test "should not save with no name" do
        card = Card.new

        assert !card.valid?, "Card should be invalid"
        assert !card.save, "Card should not have been saved"
    end

    test "should not save card with same name" do
        card1 = Card.new
        card1.name = "Card one"

        assert card1.valid?, "Card should be valid"
        assert card1.save, "Card should save normally"

        card2 = Card.new
        card2.name = card1.name

        assert !card2.valid?, "Card should not be valid"
        assert !card2.save, "Card should not be saved"
    end

    test "should not save card with too short name" do
        card = Card.new
        card.name = ""

        assert !card.valid?, "Card should not be valid"
        assert !card.save, "Card should not be saved"
    end

    test "should not save card with too long name" do
        card = Card.new
        card.name = "a"*41

        assert !card.valid?, "Card should not be valid"
        assert !card.save, "Card should not be saved" 
    end

    test "should save with fields" do
        card = Card.new
        card.name = "Cool card"

        3.times {|t| card.fields.build(name:"#{t}_field", content:"#{t}_content")}

        assert card.valid?, "Card should be valid"
        assert card.save, "Card should be valid"

        assert card.fields.size == 3, "Should be 3"

    end
end
