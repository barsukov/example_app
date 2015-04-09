class CreateImageWidgetMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'ImageWidget',
      attributes: [
        { name: 'image', type: :reference },
      ]
    )
  end
end
