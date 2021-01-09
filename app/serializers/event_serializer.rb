# == Schema Information
#
# Table name: events
#
#  id           :bigint           not null, primary key
#  brochure     :string
#  description  :string
#  end_date     :date
#  end_time     :datetime
#  event_code   :string
#  event_type   :integer          default(0)
#  start_date   :date
#  start_time   :datetime
#  status       :integer          default(0)
#  stream_key   :string
#  stream_type  :integer
#  stream_video :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :event_code, :description, :start_date, :end_date,
            :start_time, :end_time, :status, :stream_type, :stream_key, :stream_video,
            :brochure

  def status_name
    object.status_name
  end

  def stream_type_name
    object.stream_type_name
  end

end
