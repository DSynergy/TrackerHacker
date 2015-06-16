require 'test_helper'

class AUserCanCreateATicketTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Tracker::Application
  end

  test 'A user can create a new ticket' do


    # When viewing a board, a user should have the option, via a form positioned clearly on the page,
    # to create a new ticket.
  end

  test 'A user can see there ticket under the correct category' do
  # Existing tickets should be displayed on the page grouped under the appropriate "status" section.

  end

end
