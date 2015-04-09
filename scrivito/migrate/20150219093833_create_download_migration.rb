class CreateDownloadMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(name: 'Download', attributes:[
      {name: 'blob', type: 'binary'},
    ])
  end
end
