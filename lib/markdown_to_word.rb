require 'html/pipeline'
require 'htmltoword'
require 'digest'

require_relative "markdown_to_word/version"
require_relative "markdown_to_word/document"

module MarkdownToWord
  def self.convert(markdown)
    Document.new(markdown)
  end
end
