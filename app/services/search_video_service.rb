# frozen_string_literal: true

require './app/queries/videos/search_query'

class SearchVideoService
  def initialize(search_params:)
    @search_params = search_params
  end

  def call
    if @search_params.present?
      Videos::SearchQuery.new(search_params: @search_params).call
    else
      Video.all
    end
  end
end
