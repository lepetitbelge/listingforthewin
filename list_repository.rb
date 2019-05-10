require 'csv'
require_relative 'list'

class ListRepository
  def initialize(csv_input, csv_output)
    @csv_input = csv_input
    @csv_output = csv_output
    @emails = []
    @lists = []
    read_csv
  end

  def create_lists
    @lists = @emails.map do |email|
      email = email.downcase
      full_name = email.split('@').first
      first_name, last_name = full_name.split('.')
      first_name.capitalize!
      last_name.capitalize!
      List.new(first_name, last_name, email, 14)
    end
  end

  def save_lists
    write_csv
  end

  def all
    @lists
  end

  private

  def read_csv
    CSV.foreach(@csv_input, headers: true) do |row|
      @emails << row[0]
    end
  end

  def write_csv
    CSV.open(@csv_output, 'w+') do |csv_row|
      csv_row << %w[first_name last_name email scope_id]
      @lists.each { |list| csv_row << [list.first_name, list.last_name, list.email, list.scope_id] }
    end
  end
end
