require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/product_collection'
require_relative 'lib/basket'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
basket = Basket.new


loop do
  puts "Что хотите купить:"
  puts

  collection.sort!(by: :title, order: :asc)

  collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end
  puts "0. Выход"

  user_choice = gets.to_i

  break if user_choice == 0
  next puts "Выберите цифру из списка" if user_choice > collection.to_a.length

  product_index = user_choice - 1
  product = collection.to_a[product_index]

  basket.buy(collection.to_a, product)
  if basket.check_collection?(product)
    puts "Вы купили последний экземпляр #{product.to_ss}"
  else
    puts "Вы купили #{product}"
  end
end

puts "Вы купили:"
puts
basket.content.each { |product| puts product.to_ss }
puts
puts "С Вас - #{basket.set_total} руб. Спасибо за покупки!"



