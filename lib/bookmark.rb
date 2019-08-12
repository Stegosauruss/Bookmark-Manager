class Bookmark
  def initialize
    @bookmarks = [
      "http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://facebook.com"
     ]
  end

  def all
    @bookmarks.join(" ")
  end
end