require 'bookmarks'

describe Bookmarks do
  bookmarks = Bookmarks.show_all
  describe '#show_all' do
    it 'shows all the bookmarks' do
      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include 'http://www.destroyallsoftware.com'
      expect(bookmarks).to include 'http://www.google.com'
    end
  end
end
