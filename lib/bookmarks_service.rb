require 'pg'

class BookmarksService

  def initialize
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.create
    @bookmarks = BookmarksService.new
  end

  def self.instance
    @bookmarks
  end

  def show_all
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def add_bookmark(bookmark)
    @connection.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark}');")
  end
end
