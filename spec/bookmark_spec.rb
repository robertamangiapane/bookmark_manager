require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '#create' do
    it 'creates new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      # expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '#show_all' do
    it 'shows all the bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      bookmarks = Bookmark.show_all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      # expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.show_all.length).to eq 0
    end
  end

  describe '#find' do
    it 'return the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Maker Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Maker Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#update' do
    it 'updates the bookmark' do
      bookmark = Bookmark.create(title: 'Google', url: 'http://www.google.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.google.it', title: 'Google ITA')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Google ITA'
      expect(updated_bookmark.url).to eq 'http://www.google.it'
    end
  end
end
