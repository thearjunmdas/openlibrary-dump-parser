require 'minitest/autorun'
require 'mocha/minitest'
require 'ol_dump_parser'

class OldDumpParserTest < Minitest::Test
  def setup
    @out_dir_path = './output'
    FileUtils.mkdir_p @out_dir_path
    @ol_dump_parser = OlDumpParser.new({ out_file: './output/out.json' })
    @test_files_inp_path = File.expand_path('./test_files/inp', File.dirname(__FILE__))
    @test_files_out_path = File.expand_path('./test_files/out', File.dirname(__FILE__))
  end
  
  def teardown
    FileUtils.remove_dir @out_dir_path, true
  end
  
  def test_parsing_authors_dump
    @ol_dump_parser.inp_file = @test_files_inp_path + '/authors_5_lines.txt'
    @ol_dump_parser.parse
    assert_equal File.read(@test_files_out_path + '/authors_5_lines.json'), File.read(@ol_dump_parser.out_file)
  end

  def test_verbose_mode_off
    @ol_dump_parser.inp_file = @test_files_inp_path + '/authors_5_lines.txt'
    @ol_dump_parser.expects(:puts).never
    @ol_dump_parser.parse
  end

  def test_verbose_mode_on
    @ol_dump_parser.verbose = true
    @ol_dump_parser.inp_file = @test_files_inp_path + '/authors_5_lines.txt'
    @ol_dump_parser.expects(:puts).times(5)
    @ol_dump_parser.parse
  end
end
