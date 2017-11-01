class SearchController < ApplicationController
  def index
    response = bb_service.find_stores_by_zip("80202")
    @stores = store_search_creator.create_stores(response)
    @total_stores = response["total"]
  end

  private

  def store_search_creator
    @store_search_create ||= StoreSearchCreator.new
  end

  def bb_service
    @bb_service ||= BestbuyService.new
  end
end
