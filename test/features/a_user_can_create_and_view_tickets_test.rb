require 'test_helper'

class AUserCanCreateATicketTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'A user can create a new ticket and can see their ticket under the correct category' do
    @board = Board.create(title: 'Board 1')
    @board.tickets.create(title: "ticket 1", description: "1", status: 0)
    @board.tickets.create(title: "ticket 2", description: "2", status: 1)
    @board.tickets.create(title: "ticket 3", description: "3", status: 2)
    @board.tickets.create(title: "ticket 4", description: "4", status: 3)

    visit board_path(@board)
    click_link_or_button "Create a New Ticket"
    assert_equal new_boards_ticket_path, current_path
    fill_in 'ticket[title]', with: 'Title5'
    fill_in 'ticket[description]', with: 'Title5'
    fill_in 'ticket[status]', with: 'backlog'
    click_link_or_button "Create Ticket"
    assert_equal board_path(1), current_path
    within(:css, "backlog") do
      assert page.has_content?("Title5")
    end
  end

end
