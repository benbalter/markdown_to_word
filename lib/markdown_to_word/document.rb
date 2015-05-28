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
      Digest::MD5.hexdigest(html)
    end

    def path
      Htmltoword::Document.create(html, hash, template).path
    end

    def contents
      File.open(path).read
    end
  end
end
