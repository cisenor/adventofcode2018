require_relative '../../models/TimeMachineDial'

RSpec.describe TimeMachineDial do
	describe 'Initialization' do
		context 'When initialized with no value' do
			it 'automatically initializes with zero' do
				dial = TimeMachineDial.new
				expect(dial.frequency).to eq 0
			end
		end
		context 'when provided with a starting value' do
			it 'initializes the dial\'s frequency with provided frequency' do
				dial = TimeMachineDial.new(12)
				expect(dial.frequency).to eq 12
			end
		end
	end
	describe 'adjust' do
    let(:dial) { TimeMachineDial.new() }
    subject { dial.frequency }
		context 'when provided with a zero' do
			it 'keeps the frequency at zero' do
        dial.adjust(0)
        expect(subject).to eq 0
			end
		end
    context 'when provided with a positive number' do
      it 'adds to the frequency' do
        dial.adjust(3)
        expect(subject).to eq 3
      end
    end
    context 'when provided with a negative number' do
      it 'subtracts from the frequency' do
        dial = TimeMachineDial.new(32)
        dial.adjust(-45)
        expect(dial.frequency).to eq -13
        dial.adjust(-45)
        expect(dial.frequency).to eq -58
      end
    end
    context 'first provided example' do
      it 'returns the proper values' do
        dial = TimeMachineDial.new(0)
        dial.adjust 1
        dial.adjust 1
        dial.adjust 1
        expect(dial.frequency).to eq 3
      end
    end
    context 'second provided example' do
      it 'returns the proper values' do
        dial.adjust 1
        dial.adjust 1
        dial.adjust -2
        expect(dial.frequency).to eq 0
      end
    end
    context 'third provided example' do
      it 'returns the proper value' do
        dial.adjust -1
        dial.adjust -2
        dial.adjust -3
        expect(subject).to eq -6
      end
    end
    context 'given a list of inputs' do
      subject do
        until !dial.first_revisited.nil?
          input.each do |adjustment|
            dial.adjust adjustment
          end
        end
        dial.first_revisited
      end
      context 'example 1' do
        let(:input) { [+1, -1] }
        it { is_expected.to eq 0 }
      end
      context 'example 2' do
        let(:input) { [+3, +3, +4, -2, -4]}
        it { is_expected.to eq 10 }
      end
      context 'example 3' , focus: true do
        let(:input) { [+7, +7, -2, -7, -4] }
        it { is_expected.to eq 14 }
      end
    end
	end
end
