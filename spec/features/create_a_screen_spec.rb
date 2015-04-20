require 'rails_helper'

RSpec.describe 'creating a screen', type: :feature do

  it 'creates the screen' do
    visit screens_path

    click_on 'Add a new screen'

    fill_in 'Device ID', with: '90557a727ae22d32e4e1a230bf55eb2ce64a440b2c77e42208c97fcf520771'
    fill_in 'URL', with: 'https://example.org'

    click_on 'Create Screen'

    expect(page).to have_content('Screen created')
    expect(page).to have_content('90557a727ae22d32e4e1a230bf55eb2ce64a440b2c77e42208c97fcf520771')
  end

end
