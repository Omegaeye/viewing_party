class Review
  attr_reader :author, :content, :rating
  def initialize(data)
    @author = data[:author_details][:username]
    @content = data[:content].gsub!("\r\n\r\n", '  ')
    @rating = data[:author_details][:rating]
  end
end
