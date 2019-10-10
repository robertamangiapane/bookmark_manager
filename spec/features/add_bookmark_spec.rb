feature 'Add bookmark page' do
  scenario 'user chose add a bookmark' do
    visit('/')
    click_button 'Add bookmark'
    expect(page).to have_content "Add your bookmark"
  end

  scenario 'the bookmark is added to the database' do
    visit('/')
    click_button 'Add bookmark'
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button 'Submit'
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
