require_relative 'ol_dump_parser/parser'

# Serves as the namespace for the whole gem
module OlDumpParser
  class << self
    # Creates a new parser
    # @param params [Hash{Symbol => String}] Input parameters to parser
    def new(params)
      Parser.new params
    end
  end
end

