class SearchController < ApplicationController
  def index
    bb_service.find_stores_by_zip("80202")
    binding.pry
  end

  private

  def bb_service
    @bb_service ||= BestbuyService.new
  end
end
