require_relative 'models/TimeMachineDial'
require_relative 'models/IntegerParser'

def parse_numbers()
  parser = IntegerParser.new()
  parser.parse('data/input.txt') 
end
def perform_adjustments(dial, adjustments)
  adjustments.each do |frequency|
    dial.adjust(frequency)
  end
end
adjustments = parse_numbers
dial = TimeMachineDial.new(0)
perform_adjustments(dial, adjustments)
last_frequency = dial.frequency
until !dial.first_revisited.nil?
  perform_adjustments(dial,adjustments)
end
p "First revisited: #{dial.first_revisited}, Final Frequency: #{last_frequency}"
