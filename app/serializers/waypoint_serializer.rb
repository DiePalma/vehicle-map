class WaypointSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :sent_at, :vehicle_identifier

  def sent_at
    object.sent_at.strftime("%Y-%m-%d %H:%M:%S") if object.sent_at.present?
  end

  def latitude
    '%.2f' % object.latitude
  end
  def longitude
    '%.2f' % object.longitude
  end

end
