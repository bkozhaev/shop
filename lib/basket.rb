class Basket
  attr_reader :basket, :money_amount

  def initialize
    @basket = []
    @money_amount = 0
  end


  def check_choice(products, user_choice)
    size = products.length
    if user_choice.between?(1, size)
      products[user_choice - 1].amount -= 1
      @basket << products[user_choice - 1]
      puts "Вы выбрали: #{products[user_choice - 1]}"
    else
      puts "Вводите цифру в соответствии со списком предложенной продукции"
    end
  end

  def set_total
    @basket.each do |product|
      puts product
      @money_amount += product.price
    end
  end
end