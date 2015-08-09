require 'spec_helper'

feature 'playing a 2 players game' do
  scenario 'player can choose to play against a human' do
    visit '/'
    expect(page).to have_button 'New Multiplayer Game'
  end
end
