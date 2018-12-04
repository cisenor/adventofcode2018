require_relative '../../models/IntegerParser'

describe IntegerParser do
  let(:parser){ IntegerParser.new }
  context 'when given a text file of entries' do
    let(:path){"../fixtures/input-data1.txt"}
    it 'will parse each entry as an integer' do
      parsed = parser.parse(
    end
  end
  context 'when given a non-text file' do
    it 'will throw an error' do
    end
  end
  context 'when faced with a non-number' do
    it 'will throw an error' do
    end
  end
end
