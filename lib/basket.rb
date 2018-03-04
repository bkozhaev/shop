class Basket
  attr_reader :basket, :money_amount

  def initialize(products)
    @basket = []
    @money_amount = 0
    @products = products
  end

  def check_number?(user_choice)
    user_choice.between?(1, @products.length)
  end


  def check_choice(products, user_choice)
    if check_number?(user_choice)
      products[user_choice - 1].amount -= 1
      @basket << products[user_choice - 1]
    end
  end

  def set_total
    @basket.each do |product|
      puts product
      @money_amount += product.price
    end
  end
end