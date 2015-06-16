require 'test_helper'

class AUserCanCreateABoardTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'A User can see existing boards' do
    board = Board.create(title: 'Board 1')
    visit '/'
    assert page.has_content?('Board 1')
    click_link_or_button 'Board 1'
    assert_equal board_path(board), current_path
    assert page.has_content?('Backlog')
    assert page.has_content?('Current Sprint')
    assert page.has_content?('In Progress')
    assert page.has_content?('Done')
  end

  test 'A user can create a new board' do
    visit '/'
    click_link_or_button 'New Board'
    assert_equal new_board_path, current_path
    fill_in 'board[title]', with: 'Board2'
    click_link_or_button "Create New Board"
    assert_equal board_path(1), current_path
  end


end
