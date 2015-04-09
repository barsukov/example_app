class CreateTextWidgetMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'TextWidget',
      attributes: [{ name: 'text', type: :html }]
    )
  end
end
