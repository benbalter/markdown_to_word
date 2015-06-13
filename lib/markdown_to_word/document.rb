module MarkdownToWord
  class Document

    attr_accessor :template, :html

    # https://github.com/jekyll/jekyll/blob/master/lib/jekyll/document.rb#L9
    YAML_FRONT_MATTER_REGEXP = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m

    def initialize(markdown="")
      @raw_markdown = markdown
    end

    def markdown
      @raw_markdown.split(YAML_FRONT_MATTER_REGEXP).last
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
