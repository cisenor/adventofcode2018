class TimeMachineDial
	attr_reader :frequency
  attr_reader :first_revisited
	def initialize(starting_value = 0)
		@frequency = starting_value
    @already_visited = [@frequency]
	end
	def adjust(adjustment)
    @frequency += adjustment

    if @first_revisited.nil? && @already_visited.include?(@frequency)
      @first_revisited = @frequency
    end
    @already_visited.push(@frequency)
	end
end
