require "spec_helper"

describe MarkdownToWord::Document do

  subject do
    MarkdownToWord::Document.new("# Test")
  end

  it "stores the markdown" do
    expect(subject.markdown).to eql("# Test")
  end

  it "converts the html" do
    expect(subject.html).to eql("<h1>Test</h1>")
  end

  it "builds the hash" do
    expect(subject.hash).to eql("107c30d8ae3ae863480fccb24e9a2d21")
  end

  it "returns the docx file path" do
    path = subject.docx
    expect(path).to match(/\/.*\.docx/)
    expect(File.exists?(path)).to eql(true)
  end

  it "converts the file" do
    expect(WordToMarkdown.new(subject.docx).to_s).to eql("# Test")
  end
end
