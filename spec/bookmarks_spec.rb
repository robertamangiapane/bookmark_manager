require 'bookmarks'

describe Bookmarks do
  bookmarks = Bookmarks.show_all
  describe '#show_all' do
    it 'shows all the bookmarks' do
      expect(bookmarks).to include 'bookmarks_1'
      expect(bookmarks).to include 'bookmarks_2'
      expect(bookmarks).to include 'bookmarks_3'
    end
  end
end
