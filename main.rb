require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/product_collection'
require_relative 'lib/basket'

product = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
user_choice = nil
basket = Basket.new
# choices_amount = (1..product.to_a.length).to_a
count = 0
user_choices = []
puts

until user_choice == '0'
  puts "Что хотите купить:"
  puts

  product.sort!(by: :title, order: :asc)

  product.to_a.each do |product|
    puts "#{count += 1}. #{product}"
  end
  puts "0. Выход"

  break if product.to_a.length <= 0

  user_choice = gets.chomp

  basket.check_choice(product.to_a, user_choice.to_i)
  product.check_amount

  count = 0
end

puts "Вы купили:"
puts
basket.set_total
puts
puts "С Вас - #{basket.money_amount} руб. Спасибо за покупки!"



