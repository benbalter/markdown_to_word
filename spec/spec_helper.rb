require "bundler/setup"
require 'word-to-markdown'
require 'open3'
require_relative "../lib/markdown_to_word"

def fixture_path(fixture)
  File.expand_path "./fixtures/#{fixture}.md", File.dirname(__FILE__)
end

def fixture(fixture)
  path = fixture_path(fixture)
  File.open(path).read
end

def as_markdown(contents, &block)
  Tempfile.open(["MarkdownToWord", ".docx"]) do |file|
    File.write(file, contents)
    md = WordToMarkdown.new(file).to_s
    yield(md)
  end
end

def as_docx(md, &block)
  yield(MarkdownToWord.convert(md).contents)
end
