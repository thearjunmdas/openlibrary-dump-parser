require 'minitest/autorun'
require 'ol_dump_parser'
require 'byebug'

class OldDumpParserTest < Minitest::Test
  def setup
    out_dir_path = './output'
    FileUtils.mkdir_p out_dir_path
    @ol_dump_parser = OlDumpParser.new({ out_file: './output/out.json' })
    @test_files_path = File.expand_path('./test_files', File.dirname(__FILE__))
  end

  def test_english_hello
    @ol_dump_parser.inp_file = @test_files_path + '/authors_5_lines.txt'
    @ol_dump_parser.parse
    
  end
end
