class CreateImageMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'Image',
      title: 'Image',
      attributes: [{ name: 'blob', type: :binary }]
    )
  end
end
