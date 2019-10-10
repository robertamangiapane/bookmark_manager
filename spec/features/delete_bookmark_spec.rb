feature 'Delete bookmark' do
  scenario 'user delete a bookmark' do
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    visit('/')
    click_button 'Delete bookmark'

    expect(page).not_to have_link('Google', href: 'http://www.google.com')
    expect(current_path).to eq '/'
  end
end
