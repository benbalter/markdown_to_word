require 'html/pipeline'
require 'htmltoword'
require 'digest'

require_relative "markdown_to_word/version"
require_relative "markdown_to_word/document"

module MarkdownToWord
  def self.convert(markdown)
    Document.new(markdown)
  end

  def self.default_template
    File.expand_path "./markdown_to_word/template.docx", File.dirname(__FILE__)
  end
end
