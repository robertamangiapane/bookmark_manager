require 'bookmarks'

describe Bookmarks do
  bookmarks = Bookmarks.show_all
  describe '#show_all' do
    it 'shows all the bookmarks' do
      expect(bookmarks).to include 'www.google.com'
      expect(bookmarks).to include 'www.bbc.co.uk'
      expect(bookmarks).to include 'www.reddit.com'
    end
  end
end
