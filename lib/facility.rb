class Facility
  attr_accessor :collected_fees
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.antique? 
      vehicle.plate_type = :antique
      @collected_fees += 25
    elsif vehicle.electric_vehicle? 
      vehicle.plate_type = :ev
      @collected_fees += 200
    else 
      vehicle.plate_type = :regular
      @collected_fees += 100
    end
    
    vehicle.registration_date = Date.today.year
    @registered_vehicles.push(vehicle)
  end
end
