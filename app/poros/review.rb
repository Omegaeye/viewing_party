class Review
  attr_reader :author, :content, :rating
  def initialize(data)
    @author = data[:reviewer]
    @content = data[:content]
    @rating = data[:rating]
  end
end
