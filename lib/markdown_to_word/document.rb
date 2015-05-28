module MarkdownToWord
  class Document

    attr_accessor :markdown, :template, :html

    def initialize(markdown="")
      @markdown = markdown
    end

    def html
      @html ||= HTML::Pipeline::MarkdownFilter.new(markdown).call
    end

    def hash
      @hash ||= Digest::MD5.hexdigest(html)
    end

    def template
      @template ||= MarkdownToWord.default_template
    end

    def contents
      @contents ||= Htmltoword::Document.create(html, template)
    end
  end
end
