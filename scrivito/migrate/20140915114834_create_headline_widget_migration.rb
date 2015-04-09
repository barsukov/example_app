class CreateHeadlineWidgetMigration < ::Scrivito::Migration
  def up
    Scrivito::ObjClass.create(
      name: 'HeadlineWidget',
      attributes: [
        { name: 'headline', type: :string },
      ]
    )
  end
end
