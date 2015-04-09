class TwoColumnWidget < Widget
  attribute :column1_content, :widgetlist
  attribute :column1_width, :string
  attribute :column2_content, :widgetlist

  GRID_SIZE=12

  def column2_width
    GRID_SIZE - column1_width.to_i
  end

  def column1_width
    self[:column1_width].presence || '6'
  end
end
