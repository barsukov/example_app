class RemoveObjClassesMigration < Scrivito::Migration
  def up
    Scrivito::ObjClass.remove
  end
end
