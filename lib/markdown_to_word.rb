require "markdown_to_word/version"
require "markdown_to_word/document"
require 'htmltoword'
require 'kramdown'
require 'digest'

module MarkdownToWord
  def self.default_template
    @template ||= File.expand_path "./markdown_to_word/template.xslt", File.dirname(__FILE__)
  end

  def convert(markdown)

  end
end
