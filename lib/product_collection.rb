class ProductCollection
  attr_reader :products

  def initialize(products = [])
    @products = products
  end

  PRODUCT_TYPE = [
    {file: 'books', class: Book},
    {file: 'movies', class: Movie},
    {file: 'disks', class: Disk}
  ].freeze

  def self.from_dir(dir_path)

    products = []

    PRODUCT_TYPE.each do |hash|
      folder = hash[:file]
      class_type = hash[:class]
      file_paths = Dir[dir_path + '/' + folder + '/*txt']

      file_paths.each do |path|
        products << class_type.from_file(path)
      end
    end
    new(products)
  end

  def to_a
    @products
  end

  def sort!(params)

    case params[:by]
      when :title then
        @products.sort_by! {|product| product.to_s}
      when :price then
        @products.sort_by! {|product| product.price}
      when :amount then
        @products.sort_by! {|product| product.amount}
    end

    @products.reverse! if params[:orcder] = :asc

    self
  end

  def check_amount
    @products.each do |product|
      if product.amount <= 0
        puts "Вы приобрели последний экз. #{product.to_ss}"
        @products.delete(product)
      end
    end
  end
end
