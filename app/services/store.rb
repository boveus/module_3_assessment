class Store
  attr_reader :city,
              :long_name,
              :distance,
              :phone,
              :store_type
              
  def initialize(city, long_name, distance, phone, store_type)
    @city = city
    @long_name = long_name
    @distance = distance
    @phone = phone
    @store_type = store_type
  end
end
