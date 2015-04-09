class BlogPost < Obj
  attribute :author_name, :string
  attribute :body, :widgetlist
  attribute :page_title, :string
  attribute :published_at, :date
  attribute :title, :string

  def overview_title
    self[:title].presence || "[New Blog Post]"
  end

  def menu_title
    self[:page_title].presence || overview_title
  end
end
