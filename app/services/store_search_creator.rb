class StoreSearchCreator
  def create_stores(response)
    response["stores"].map do |store|
      Store.new(
        store["city"],
        store["longName"],
        store["distance"],
        store["phone"],
        store["storeType"]
      )
      binding.pry
    end
  end
end
