class BestbuyService
  def find_stores_by_zip(zip, radius=25)
    HTTParty.get("https://api.bestbuy.com/v1/stores(area(#{zip.to_i},#{radius.to_i}))?format=json&show=city,longName,distance,phone,storeType&pageSize=2&apiKey=#{ENV['bb_key']}")
  end
end
