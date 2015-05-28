require "markdown_to_word/version"
require "markdown_to_word/document"
require 'html/pipeline'
require 'htmltoword'
require 'digest'

module MarkdownToWord
  def self.convert(markdown)
    Document.new(markdown).docx
  end
end
