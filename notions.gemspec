# frozen_string_literal: true

require_relative 'lib/notions/version'

Gem::Specification.new do |spec|
  spec.name = 'notions'
  spec.version = Notions::VERSION
  spec.authors = ['Andrei Horak']
  spec.email = ['linkyndy@gmail.com']

  spec.summary = 'Very simple yet powerful and extensible Object Document Mapper for Notion, written in Ruby.'
  spec.description = 'Very simple yet powerful and extensible Object Document Mapper for Notion, written in Ruby.'
  spec.homepage = 'https://github.com/linkyndy/notions'
  spec.license = 'MIT'

  spec.required_ruby_version = '>= 3.0.0'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split('\x0').reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ spec/ .git])
    end
  end
  spec.require_paths = ['lib']
end
