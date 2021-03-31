class Review
  attr_reader :author, :content
  def initialize(data)
    @author = data[:author_details][:username]
    @content = data[:content].squish
  end
end
