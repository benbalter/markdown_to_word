require "spec_helper"

describe MarkdownToWord::Document do

  subject do
    MarkdownToWord::Document.new("# Test")
  end

  it "stores the markdown" do
    expect(subject.markdown).to eql("# Test")
  end

  it "converts the html" do
    expect(subject.send(:raw_html)).to eql("<h1>Test</h1>")
  end

  it "makes it a valid HTML document" do
    expect(subject.html).to match(/<html><body><h1>Test<\/h1><\/body><\/html>/)
  end

  it "converts the file" do
    as_markdown(subject.contents) { |md| expect(md).to eql("# Test") }
  end
end
