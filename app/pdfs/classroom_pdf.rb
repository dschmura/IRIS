class ClassroomPdf < Prawn::Document
  def initialize(classroom)
    super(top_margin: 70, page_layout: :landscape)
    text "Order goes here"
  end
end