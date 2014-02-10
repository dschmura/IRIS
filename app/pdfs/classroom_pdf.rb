class ClassroomPdf < Prawn::Document
  def initialize(classroom)
    super(top_margin: 70)

    text "This is a pdf"
  end
end