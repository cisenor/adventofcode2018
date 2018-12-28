class IntegerParser
	class InvalidFileTypeError < ArgumentError;end
	def parse(filename)
		return [] if filename.empty?
		raise InvalidFileTypeError unless File.extname(filename).downcase == '.txt'
		parsed_output = []
		File.open(filename).each do |line|
			begin
				parsed_output.push(Integer(line))
			rescue ArgumentError
			end
		end
		parsed_output
	end
end
