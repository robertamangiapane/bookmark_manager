feature 'Updating a bookmark' do
  scenario 'user update a bookmark' do
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    visit('/')
    click_button 'Edit'

    fill_in('url', with: "http://www.google.it")
    fill_in('title', with: "Google ITA")
    click_button('Submit')

    expect(page).not_to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Google ITA', href: 'http://www.google.it')
    expect(current_path).to eq '/'

  end
end
