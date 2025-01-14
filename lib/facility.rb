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
    if @services.include?("Vehicle Registration")
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
    else
      nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.permit && registrant.age >= 16
        true
        registrant.license_data[:written] = true
      else
        false
      end
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
      if registrant.license_data[:written] = true
        true
        registrant.license_data[:license] = true
      else
        false
      end
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.age >= 16
      if registrant.license_data[:license] = true
        registrant.license_data[:written] = true
        true
        registrant.license_data[:renewed] = true
      else
        false
      end
    else
      false
    end
  end
end
