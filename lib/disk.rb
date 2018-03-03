class Disk < Product
  attr_accessor :title, :singer, :genre, :year

  def initialize(params = {})
    super
    @title = params[:title]
    @singer = params[:singer]
    @genre = params[:genre]
    @year = params[:year]
  end

  def update(params = {})
    super
    @title = params[:title] if params[:title]
    @singer = params[:singer] if params[:singer]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end

  def self.from_file(file_path)
    disk = File.readlines(file_path, encoding: 'UTF-8').map(&:chomp)

    new(
      title: disk[0],
      singer: disk[1],
      genre: disk[2],
      year: disk[3].to_i,
      price: disk[4].to_i,
      amount: disk[5].to_i
    )
  end

  def to_s
    "Альбом #{@title} - \"#{singer}\", #{@genre}, #{@year}, #{super}"
  end

  def to_ss
    "Альбома #{@title} - \"#{singer}\""
  end
end