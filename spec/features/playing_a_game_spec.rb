require 'spec_helper'

feature 'Playing a game' do
  before(:each) do
    allow_any_instance_of(Computer).to receive(:move).and_return('Paper')
  end
  scenario 'Player can choose an option' do
    visit '/game?myname=Antonio'
    expect(page).to have_content 'Now select an option!'
  end
  scenario 'player can choose to play against cpu' do
    visit '/'
    expect(page).to have_button 'New Game'
  end
  scenario 'player is taken to the game' do
    visit '/game?myname=Antonio'
    expect(page).to have_selector('option')
  end
  scenario 'Player chooses an option' do
    visit '/game?myname=Antonio'
    select 'Rock', from: 'option'
    click_button 'Throw!'
    expect(page).to have_content "You threw Rock!"
  end
  scenario 'Computer throws random option' do
    visit '/game?myname=Antonio'
    select 'Rock', from: 'option'
    click_button 'Throw!'
    expect(page).to have_content "Computer threw Paper!"
  end
  scenario 'Draw' do
    visit '/game?myname=Antonio'
    select 'Paper', from: 'option'
    click_button 'Throw!'
    expect(page).to have_content "Draw!"
  end
  scenario 'A winner is declared' do
    visit '/game?myname=Antonio'
    select 'Rock', from: 'option'
    click_button 'Throw!'
    expect(page).to have_content "Computer wins!"
  end
end
