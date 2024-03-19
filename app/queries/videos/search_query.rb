module Videos
  class SearchQuery
    def initialize(search_params:)
      @search_params = search_params
    end

    def call
      fetch_video
    end

    private

    def fetch_video
      if @search_params[:search].presence
        Video.all.by_name(@search_params[:search])
      else
        filters.reduce(Video.all) { |videos, filter| send(filter, videos) }
      end
    end

    def filters
      %i[filter_tag filter_language filter_speaker filter_category]
    end

    def filter_tag(videos)
      @search_params[:tag_id].presence ? videos.by_tag(@search_params[:tag_id]) : videos
    end

    def filter_language(videos)
      @search_params[:language_id].presence ? videos.by_language(@search_params[:language_id]) : videos
    end

    def filter_speaker(videos)
      @search_params[:speaker_id].presence ? videos.by_speaker(@search_params[:speaker_id]) : videos
    end

    def filter_category(videos)
      @search_params[:category_id].presence ? videos.by_category(@search_params[:category_id]) : videos
    end
  end
end
