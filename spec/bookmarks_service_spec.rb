require 'bookmarks_service'

describe BookmarksService do
  let(:connection) { PG.connect(dbname: 'bookmark_manager_test') }
  let(:bookmarks) { BookmarksService.create }
  describe '#show_all' do
    it 'shows all the bookmarks' do
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      expect(bookmarks.show_all).to include 'http://www.makersacademy.com'
      expect(bookmarks.show_all).to include 'http://www.destroyallsoftware.com'
      expect(bookmarks.show_all).to include 'http://www.google.com'
    end
  end

  describe '#add_bookmark' do
    it 'adds a bookmark to the database' do
      url = 'http://www.makersacademy.com'
      bookmarks.add_bookmark(url)
      result = connection.exec("SELECT * FROM bookmarks WHERE url = '#{url}';")
      bookmark = result.map { |row| row['url'] }
      expect(bookmark[0]).to eq url
    end
  end
end
