require 'rails_helper'

RSpec.describe Screen, type: :model do
  it 'can be created' do
    screen = Screen.new(device_id: '90557a727ae22d32e4e1a230bf55eb2ce64a440b2c77e42208c97fcf520771',
                        url: 'https://www.gov.uk/')
    expect(screen).to be_valid
    
    screen.save
    expect(screen).to be_persisted
  end
end
