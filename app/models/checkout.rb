class Checkout < ApplicationRecord
    has_many :rentals
    helper_method :add

    def add(item)
      # byebug
      #add from the list of search results?
      #should tool have price?
      @cart = cart
      @cart << item

      # render :index
    end
end
