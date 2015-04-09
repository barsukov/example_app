class CreateTwoColumnWidgetMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'TwoColumnWidget',
      attributes: [
        { name: 'column1_content', type: :widget },
        { name: 'column2_content', type: :widget },
        { name: 'column1_width', type: :string },
      ]
    )
  end
end
