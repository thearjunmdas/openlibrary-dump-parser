# Open Library Dump Parser

openlibrary-dump-parser is a simple ruby parser that parses the csv dump from open library into a json file

## Getting started
### Installation
```sh
gem install ol_dump_parser
```

### Ruby sample code:
```ruby
require 'ol_dump_parser'
# Create a ol_dump_parser object
ol_dump_parser = OlDumpParser.new({ inp_file: './inp_file_path', out_file: './output/out.json' })

# parse the data, this will create the output file
ol_dump_parser.parse
```
