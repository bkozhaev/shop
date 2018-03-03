class Movie < Product
  attr_accessor :title, :year, :director

  def initialize(params = {})
    super
    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def update(params = {})
    super
    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

  def self.from_file(file_path)
    movie = File.readlines(file_path, encoding: 'UTF-8').map(&:chomp)

    new(
      title: movie[0],
      director: movie[1],
      year: movie[2].to_i,
      price: movie[3].to_i,
      amount: movie[4].to_i
    )
  end

  def to_s
    "Фильм #{@title}, #{@year}, режиссер - #{@director}, #{super}"
  end

  def to_ss
    "Фильма #{@title}, #{@year}, режиссер - #{@director}"
  end
end