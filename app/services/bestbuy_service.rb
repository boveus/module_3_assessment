class BestbuyService
  def initialize
    @total = 0
    @pages = {}
  end
  def find_stores_by_zip(zip, page=1, page_size=10, radius=25)
    response = HTTParty.get("https://api.bestbuy.com/v1/stores(area(#{zip.to_i},#{radius.to_i}))?format=json&show=city,longName,distance,phone,storeType&pageSize=#{page_size}&apiKey=#{ENV['bb_key']}")
    # paginate_request(response)
    # binding.pry
    response
  end

  # def paginate_request(response)
  #   stores = response["stores"]
  #   num = 0
  #   while stores.count > stores.count % 10
  #     num += 1
  #     @pages["page_#{num}"] = stores.reverse.pop(10)
  #   end
  #   @pages
  # end
end
