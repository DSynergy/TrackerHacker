class Ticket < ActiveRecord::Base
  belongs_to :board
  enum status: %w(backlog current_sprint in_progress done)
  validates :title, presence: :true

  scope :backlog, -> { where(status: 0)}
  scope :current_sprint, -> { where(status: 1) }
  scope :in_progress, -> { where(status: 2) }
  scope :done, -> { where(status: 3) }

end
