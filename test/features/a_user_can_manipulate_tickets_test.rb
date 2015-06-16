require 'test_helper'

class AUserCanCreateATicketTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Tracker::Application
  end

  test 'A user can move a ticket to different states' do
  #   Once a ticket has been created, a user should be able to move it through the various ticket states.
  # To facilitate this, each ticket should be rendered with links or buttons for the appropriate "neighbor" states.
  # Thus, given the states "backlog", "current sprint", "in progress", and "done", a ticket in
  # the "current sprint" state should include links to "move to backlog" and "move to in progress".

  end

end
