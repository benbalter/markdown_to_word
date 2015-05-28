require "spec_helper"

describe "MarkdownToWord Conversion" do
  it "converts unumbered lists" do
    md = fixture("ul")
    as_docx(md) do |docx|
      as_markdown(docx) do |ouput|
         expect(ouput).to eql(md)
      end
    end
  end

  it "converts numbered lists" do
    md = fixture("ol")
    as_docx(md) do |docx|
      as_markdown(docx) do |ouput|
         expect(ouput).to eql(md)
      end
    end
  end
end
