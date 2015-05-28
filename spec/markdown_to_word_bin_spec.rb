require "spec_helper"

describe "MarkdownToWord binary" do
  it "returns the help" do
    output, status = Open3.capture2e "bundle", "exec", "m2w"
    expect(output).to eql("Usage: bundle exec m2w [markdown]\n")
  end

  it "returns the version" do
    output, status = Open3.capture2e "bundle", "exec", "m2w", "--version"
    expect(output).to match(/MarkdownToWord v\d+\.\d+\.\d+/)
  end

  it "converts the document" do
    content, status = Open3.capture2e "bundle", "exec", "m2w", "# Test"
    as_markdown(content) { |md| expect(md).to eql("# Test") }
  end
end
