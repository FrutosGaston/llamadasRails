class LocationExpert

  def self.all_possible_locations
    Location.all
  end

  def self.find_location_by_id(id)
    Location.find(id)
  end

  def self.add_location(location)
    location.save
  end

end