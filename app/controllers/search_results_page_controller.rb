class SearchResultsPageController < CmsController
  def index
    @search_results = if query_param.present?
      Obj.where(:*, :contains_prefix, query_param).take(10)
    else
      []
    end
  end

  private

  def query_param
    params[:q]
  end
end
