class CardsController < ApplicationController
    before_action :signed_in_user
    
    def index
        @cards = Card.all
    end

    def new
        @card = Card.new

        4.times {|t| @card.fields.build}
    end

    def create
        @card = Card.new(cards_params)

        if @card.save
            redirect_to @card
        else
            render 'new'
        end
    end

    def edit
        @card = Card.find(params[:id])
    end

    def update
        @card = Card.find(params[:id])
        if @card.update_attributes(cards_params)
            flash[:success] = "Card updated"
            redirect_to @card
        else
            render 'edit'
        end        
    end

    def show
        @card = Card.find(params[:id])
    end

    private

        def cards_params
            params.require(:card).permit(:name, fields_attributes: [:name, :id, :content, :_destroy])
        end
end
