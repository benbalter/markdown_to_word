# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markdown_to_word/version'

Gem::Specification.new do |spec|
  spec.name          = "markdown_to_word"
  spec.version       = MarkdownToWord::VERSION
  spec.authors       = ["Ben Balter"]
  spec.email         = ["ben.balter@github.com"]
  spec.summary       = "Converts GitHub-flavored Markdown to a Word document"
  spec.homepage      = "https://github.com/benbalter/markdown_to_word"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "htmltoword", "~> 0.4.2"
  spec.add_dependency "html-pipeline"
  spec.add_dependency "github-markdown"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "word-to-markdown"

end
