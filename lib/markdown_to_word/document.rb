module MarkdownToWord
  class Document

    attr_accessor :markdown, :template, :html

    def initialize(markdown="")
      @markdown = markdown
    end

    def html
      @html ||= Nokogiri::HTML(raw_html).to_html
    end

    def hash
      @hash ||= Digest::MD5.hexdigest(html)
    end

    def contents
      @contents ||= Htmltoword::Document.create(html, template, true)
    end

    private

    def raw_html
      @raw_html ||= HTML::Pipeline::MarkdownFilter.new(markdown).call
    end
  end
end
