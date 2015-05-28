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
    expect(subject.path).to match(/\/.*\.docx/)
    expect(File.exists?(subject.path)).to eql(true)
  end

  it "converts the file via path" do
    expect(WordToMarkdown.new(subject.path).to_s).to eql("# Test")
  end

  it "converts the file via STDOUT" do
    Tempfile.open("MarkdownToWord") do |file|
      File.write(file, subject.contents)
      expect(WordToMarkdown.new(file).to_s).to eql("# Test")
    end
  end
end
