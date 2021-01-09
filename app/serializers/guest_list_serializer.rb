# == Schema Information
#
# Table name: guest_lists
#
#  id            :bigint           not null, primary key
#  raffle_number :integer
#  raffle_status :integer          default(0)
#  status        :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  approver_id   :bigint
#  event_id      :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_guest_lists_on_approver_id  (approver_id)
#  index_guest_lists_on_event_id     (event_id)
#  index_guest_lists_on_user_id      (user_id)
#
class GuestListSerializer < ActiveModel::Serializer
  attributes :id, :raffle_number, :raffle_status, :status, :approver_id, :event_id, :user_id,
            :status_name, :raffle_status_name

  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :event
  belongs_to :approver, class_name: "User", foreign_key: "approver_id"

  def status_name
    object.status_name
  end

  def raffle_status_name
    object.raffle_status_name
  end


end
