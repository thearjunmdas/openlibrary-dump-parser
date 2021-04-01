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
        line = csv_safe line
        parsed_line = CSV.parse line, liberal_parsing: true
        output.write csv_row_to_json(parsed_line)
      end
      output.close
    end

    private
    
    # Make the input string csv parsable
    # Currently method just replaces 3 spaces with a coma
    # Need to add new rules in the future
    # @param line [String] Input string to be made csv_safe
    # @return [String] A csv safe string is returned
    def csv_safe(line)
      line.gsub(/\s{3,}/, ',')
    end

    # Convert the given row values to a json object
    # @param row_values [Array] Csv row values
    # @return [Hash] Json value
    def csv_row_to_json(row_values)
      {
        type: row_values[0],
        key: row_values[1],
        revision: row_values[2],
        last_modified: row_values[3],
        details: blob_from_csv(row_values)
      }
    end

    # OL Dump always has first 4 columns as meta information
    # 5th column is the blob with all details. This method will use this insight to parse the csv
    # @param row_values [Array] Csv row values
    # @return [String] Blob
    def blob_from_csv(row_values)
      blob = row_values[4..]
      blob.join ','
    end
  end
end
