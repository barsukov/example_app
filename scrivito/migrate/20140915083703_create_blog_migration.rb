class CreateBlogMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Blog',
      attributes: [
        { name: 'title', type: :string },
        { name: 'page_title', type: :string},
      ]
    )

    Scrivito::ObjClass.create(
      name: 'BlogPost',
      attributes: [
        { name: 'title', type: :string },
        { name: 'page_title', type: :string},
        { name: 'body', type: :widget },
        { name: 'author_name', type: :string },
        { name: 'published_at', type: :date }
      ]
    )
  end
end
