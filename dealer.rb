class Dealer 
      def initialize
        @dealer_hand = Hand.new
        @dealer_deck = Deck.new
      end

      def deal 
        card = @dealer_deck.deal_card
      end
    end
