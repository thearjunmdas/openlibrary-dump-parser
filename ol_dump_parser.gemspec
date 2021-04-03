require File.expand_path('lib/ol_dump_parser/version', __dir__)


Gem::Specification.new do |s|
  s.name        = 'ol_dump_parser'
  s.version     = OlDumpParser::VERSION
  s.authors     = ['Arjun M Das']
  s.email       = 'arjundas.27586@gmail.com'
  s.files       = Dir['lib/**/*']
  # Include the CHANGELOG.md, LICENSE.md, README.md manually
  s.files      += %w[LICENSE README.md]
  s.homepage    = 'https://github.com/thearjunmdas/openlibrary-dump-parser'
  s.license     = 'MIT'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-performance'

  
  s.summary = 'Open Library Dump Parser'
  s.description = <<-DESC
  ol_dump_parser parses the Open Library Dump into a simple json file for easy processing
  DESC
end
