class Basket
  attr_reader :content

  def initialize
    @content = []
  end

  def check_collection?(product)
    product.amount == 0
  end

  def buy(collection, product)
    return if product.amount == 0
    product.amount -= 1
    collection.delete(product) if check_collection?(product)
    @content << product
  end

  def set_total
    @content.inject(0) { |sum, product| sum + product.price }
  end
end