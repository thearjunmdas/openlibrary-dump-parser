require File.expand_path('lib/ol_dump_parser/version', __dir__)


Gem::Specification.new do |s|
  s.name        = 'ol_dump_parser'
  s.version     = OlDumpParser::Version
  s.authors     = ['Arjun M Das']
  s.email       = 'arjundas.27586@gmail.com'
  s.files       = Dir['lib/**/*']
  # Include the CHANGELOG.md, LICENSE.md, README.md manually
#  s.files      += %w[CHANGELOG.md LICENSE.md README.md]
#  s.homepage    = 'https://rubygems.org/gems/ol_dump_parser'
  s.license     = 'MIT'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'

  
  s.summary = 'Open Library Dump Parser'
  s.description = <<-DESC
  ol_dump_parser parses the Open Library Dump into a csv, simple json format for easy processing
  DESC
end
