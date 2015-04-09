class CreateSearchResultsPageMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'SearchResultsPage',
      attributes: [
        { name: 'title', type: :string },
        { name: 'page_title', type: :string}
      ]
    )

    Scrivito::ObjClass.find('Homepage').attributes.add(
      name: 'search_result_page',
      type: :reference
    )

    search_page = SearchResultsPage.create(
      _path: '/_global/search',
      title: 'Search Results',
    )

    Obj.homepage.update(search_result_page: search_page)
  end
end
