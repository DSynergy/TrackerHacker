class Board < ActiveRecord::Base
  has_many :tickets
  validates :title, presence: :true

end
