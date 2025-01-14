require 'spec_helper'

RSpec.describe FacilityFactory do
  it 'creates OR facility objects' do
    or_facilities = DmvDataService.new.or_dmv_office_locations
    factory = FacilityFactory.new
    facilities = factory.create_or_facilities(or_facilities)
    expect(facilities).to be_a(Array)
    facilities.map do |facility|
      expect(facility).to be_an_instance_of(Facility)
    end
  end

  it 'creates NY facility objects' do
    ny_facilities = DmvDataService.new.ny_dmv_office_locations
    factory = FacilityFactory.new
    facilities = factory.create_ny_facilities(ny_facilities)
    expect(facilities).to be_a(Array)
    facilities.map do |facility|
      expect(facility).to be_an_instance_of(Facility)
    end
  end

  it 'reformats NY phone numbers' do
    factory = FacilityFactory.new
    expect(factory.formatted_ny_phone("5857531604")).to eq("585-753-1604")
    expect(factory.formatted_ny_phone(nil)).to eq(nil)
  end

  it 'reformats NY addresses' do
    factory = FacilityFactory.new
    address_hash = {
      :street_address_line_1=>"168-46 91ST AVE., 2ND FLR",
      :city=>"JAMAICA",
      :state=>"NY",
      :zip_code=>"11432",
    }
    expected = "168-46 91st Ave., 2nd Flr, Jamaica, Ny, 11432"
    expect(factory.formatted_ny_address(address_hash)).to eq(expected)
  end

  it 'creates MO facility objects' do
    mo_facilities = DmvDataService.new.mo_dmv_office_locations
    factory = FacilityFactory.new
    facilities = factory.create_mo_facilities(mo_facilities)
    expect(facilities).to be_a(Array)
    facilities.map do |facility|
      expect(facility).to be_an_instance_of(Facility)
    end
  end

  it 'reformats MO addresses' do
    factory = FacilityFactory.new
    address_hash = {
      :address1=>"3164 TELEGRAPH ROAD",
      :city=>"ST LOUIS",
      :state=>"MO",
      :zipcode=>"63125"
    }
    expected = "3164 Telegraph Road, St Louis, Mo, 63125"
    expect(factory.formatted_mo_address(address_hash)).to eq(expected)
  end

  it 'reformats MO phone numbers' do
    factory = FacilityFactory.new
    expect(factory.formatted_mo_phone("(314) 887-1050")).to eq("314-887-1050")
  end
end