feature 'Bookmarks page test' do
  scenario 'the page shows bookmarks' do
    visit('/')
    click_button 'See bookmarks'
    expect(page).to have_content 'All bookmarks'
  end
end
