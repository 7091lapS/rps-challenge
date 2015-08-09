require 'spec_helper'

feature 'playing a 2 players game' do
  scenario 'player can choose to play against a human' do
    visit '/'
    expect(page).to have_button 'New Multiplayer Game'
  end
  scenario 'player is taken to the multiplayer game' do
    visit '/multi'
    expect(page).to have_selector('option')
  end
end
