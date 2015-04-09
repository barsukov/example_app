class CreateHomepageMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Homepage',
      attributes: [
        { name: 'title', type: 'string'},
        { name: 'page_title', type: 'string'},
        { name: 'body', type: 'widget' },
        { name: 'child_order', type: 'referencelist' },
      ]
    )

    Homepage.create(
      _path: '/',
      title: 'Your ScrivitoExample',
    )
  end
end
