class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params = {})
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def update(params = {})
    super
    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end

  def self.from_file(file_path)
    book = File.readlines(file_path, encoding: 'UTF-8').map(&:chomp)

    new(
      title: book[0],
      genre: book[1],
      author: book[2],
      price: book[3].to_i,
      amount: book[4].to_i
    )
  end

  def to_s
    "Книга #{@title}, #{@genre}, автор - #{@author}, #{super}"
  end

  def to_ss
    "Книги #{@title}, #{@genre}, автор - #{@author}"
  end
end