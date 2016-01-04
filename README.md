# Markdown to Word

Converts GitHub-flavored Markdown to a Word document

[![Build Status](https://travis-ci.org/benbalter/markdown_to_word.svg)](https://travis-ci.org/benbalter/markdown_to_word)

## Why

While Markdown is the *lingua franca* of the development world, the rest of the world still sees Word documents as the *de facto* way to share text. Rather than try to convert the rest of the world, just work in Markdown, and convert things to Word before sending to others.

## Demo

You can see it in action with [this demo](https://markdown-to-word.herokuapp.com/)

## Installation

Add the following to your project's Gemfile:

```ruby
gem 'markdown_to_word'
```

## Usage

```ruby
MarkdownToWord.convert("# Some Markdown").path
=> "/path/to/the/file.docx"
```

## Command line usage

```
m2w "# Some Markdown" > foo.docx
```

(Returns the contents of the docx to STDOUT)

## How it works

1. We use [HTML Pipeline](https://github.com/jch/html-pipeline) to convert the Markdown to HTML
2. We use [HTML to Word](https://github.com/karnov/htmltoword) to convert the HTML to a Word doc

## Why not just use Pandoc?

While Pandoc is great on the desktop, it's hard to install on servers or use on Heroku.

## Need to go the other way?

See [Word to Markdown](https://github.com/benbalter/word-to-markdown).
