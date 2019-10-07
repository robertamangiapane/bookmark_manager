feature 'Bookmarks page test' do
  scenario 'the page shows bookmarks' do
    visit('/')
    click_button 'See bookmarks'
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.bbc.co.uk'
    expect(page).to have_content 'www.reddit.com'
  end
end
