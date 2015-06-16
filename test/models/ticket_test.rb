require 'test_helper'

class TicketTest < ActiveSupport::TestCase

  test 'When creating a new ticket, the user must provide a "Title".' do
#   They may also provide
# a "Description" (textbox) and a "Status" (dropdown selection of available ticket states).

  end

  test 'the default description is blank and the default status is backlog' do
    # If not provided, the description should be blank, and the status should default to "backlog".
  end

  test 'A ticket in the "backlog" state would only include one link: "move to current sprint".' do

  end

end
