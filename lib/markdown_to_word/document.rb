module MarkdownToWord
  class Document

    attr_accessor :markdown, :template, :html

    def initialize(markdown="")
      @markdown = markdown
    end

    def template
      @template ||= MarkdownToWord.default_template
    end

    def html
      @html ||= Kramdown::Document.new(markdown).to_html
    end

    def hash
      Digest::MD5.hexdigest(html)
    end

    def docx
      Htmltoword::Document.create(html, hash, template).path
    end
  end
end
