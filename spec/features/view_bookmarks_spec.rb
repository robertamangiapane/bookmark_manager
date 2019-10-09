feature 'Bookmarks page test' do
  scenario 'the page shows bookmarks' do
    visit('/')
    click_button 'See bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
