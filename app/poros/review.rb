class Review
  attr_reader :author, :content, :rating
  def initialize(data)
    @author = data[:results][:author_details][:username]
    @content = data[:results][:content]
    @rating = data[:results][:author_details][:rating]
  end
end
