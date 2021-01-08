# == Schema Information
#
# Table name: raffles
#
#  id            :bigint           not null, primary key
#  prize         :string
#  raffle_type   :integer          default(0)
#  status        :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_id      :bigint
#  guest_list_id :bigint
#
# Indexes
#
#  index_raffles_on_event_id       (event_id)
#  index_raffles_on_guest_list_id  (guest_list_id)
#
class Raffle < ApplicationRecord
  belongs_to :event
  belongs_to :winner, class_name: 'GuestList', foreign_key: 'guest_list_id'

  RANDOM_NAMES = 0
  SPIN_WHEEL = 1
  LOTTO = 2

  RAFFLE_TYPES = {
    RANDOM_NAMES => "Random Names",
    SPIN_WHEEL => "Spin a Wheel",
    LOTTO => "Lotto"
  }

  QUEUED = 0
  ONGOING = 1
  DONE = 2

  STATUSES = {
    QUEUED => "Queued",
    ONGOING => "On going",
    DONE => "Done"
  }
end
