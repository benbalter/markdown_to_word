require 'html/pipeline'
require 'htmltoword'
require 'digest'

require_relative "markdown_to_word/version"
require_relative "markdown_to_word/document"

module MarkdownToWord
  def self.convert(markdown)
    Document.new(markdown)
  end

  def self.default_templates_path
    File.expand_path "./markdown_to_word", File.dirname(__FILE__)
  end
end

Htmltoword.config.default_templates_path = MarkdownToWord.default_templates_path
