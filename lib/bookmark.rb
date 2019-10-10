require 'pg'

class Bookmark
  attr_reader :id, :title, :url

 def initialize(id:, title:, url:)
   @id = id
   @title = title
   @url = url
 end

  def self.connection_instance
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.create(url:, title:)
    # return false unless is_url?(url)
    connection_instance
    result = @connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.show_all
    connection_instance
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end
end
