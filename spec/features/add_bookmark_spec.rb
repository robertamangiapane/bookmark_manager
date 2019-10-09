feature 'Add bookmark page' do
  scenario 'user can add a bookmark' do
    visit('/')
    click_button 'Add bookmark'
    expect(page).to have_content "Add your url"
  end
end
