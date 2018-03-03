require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

product = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
user_choice = nil
choices_amount = (1..product.to_a.length).to_a
count = 0
user_choices = []
puts

def check_amount(product)
  product.to_a.each do |prod|
    if prod.amount <= 0
      puts "Вы приобрели последний экз. #{prod.to_ss}"
      product.to_a.delete(prod)
    end
  end
end

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

  num = choices_amount[user_choice.to_i - 1]
  case user_choice.to_i
    when num
      puts
      product.to_a[num - 1].amount -= 1
      puts "Вы выбрали: #{product.to_a[num - 1]}"
      user_choices << product.to_a[num - 1]
      check_amount(product)
      choices_amount = (1..product.to_a.length).to_a
  end
  count = 0
end

money_amount = 0
puts "Вы купили:"
puts
user_choices.each do |choice|
  puts choice
  money_amount += choice.price
end

puts
puts "С Вас - #{money_amount} руб. Спасибо за покупки!"



