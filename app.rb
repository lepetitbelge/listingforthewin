require_relative 'list_repository'

csv_input = File.join(__dir__, 'input.csv')
csv_output = File.join(__dir__, 'output.csv')

repository = ListRepository.new(csv_input, csv_output)

repository.create_lists
repository.save_lists
