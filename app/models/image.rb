class Image < Obj
  attribute :blob, :binary

  def menu_title
    self[:title].presence || name
  end
end
