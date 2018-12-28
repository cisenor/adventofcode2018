require_relative '../../models/IntegerParser'

describe IntegerParser do
	let(:parser){ IntegerParser.new }
	context 'when given a text file of entries' do
		let(:test_data){[1,2,3,4,5,-1,-2,-3,-4,-5,0]}
		let(:path){ File.join(File.dirname(__FILE__), "../fixtures/input-list1.txt") }
		it 'will parse each entry as an integer' do
			parsed = parser.parse(path)
			expect(parsed).to eq test_data
		end
	end
	context 'when given a non-text file' do
		let(:path){ File.join(File.dirname(__FILE__), "../fixtures/non-text.jpg") }
		it 'will throw an error' do
			expect { parser.parse(path) }.to raise_error(IntegerParser::InvalidFileTypeError)
		end
	end
	context 'when given with a non-number' do
		let(:path){ File.join(File.dirname(__FILE__), "../fixtures/non-number.txt") }
		it 'will throw an error' do
			expect(parser.parse(path)).to eq [1,2,3]
		end
	end
end
