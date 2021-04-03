require 'csv'
require 'json'

module OlDumpParser
  # Parser class that will parses ol dump
  class Parser
    # @return [String] Path to the input file
    attr_accessor :inp_file

    # @return [String] Path to the output file
    attr_accessor :out_file

    # Constructor for Parser
    # @param [Hash] params Inputs to parser
    # @option params [String] :inp_file Path to the input file
    # @option params [String] :out_file Path to the output file
    def initialize(params)
      self.inp_file = params[:inp_file]
      self.out_file = params[:out_file]
    end

    # Parses the input csv file and converts to a json file
    def parse
      output = File.open out_file, 'w'
      File.open(inp_file).each do |line|
        # CSV parse returns an array of rows - we need only the first
        parsed_line = CSV.parse(line.chomp, col_sep: "\t", liberal_parsing: true).first
        json_output = csv_row_to_json(parsed_line)
        p json_output[:details]['name']
        output.puts json_output
      end
      output.close
    end

    private

    # Convert the given row values to a json object
    # @param row_values [Array] Csv row values
    # @return [Hash] Json value
    def csv_row_to_json(row_values)
      {
        type: row_values[0],
        key: row_values[1],
        revision: row_values[2],
        last_modified: row_values[3],
        details: JSON.parse(row_values[4])
      }
    end
  end
end
