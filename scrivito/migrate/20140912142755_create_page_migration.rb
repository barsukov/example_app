class CreatePageMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Page',
      attributes: [
        { name: 'title', type: 'string' },
        { name: 'page_title', type: 'string'},
        { name: 'body', type: 'widget' }
      ])
  end
end
