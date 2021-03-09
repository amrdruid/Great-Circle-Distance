# frozen_string_literal: true

module Services
  class FileParser
    def self.parse_data_file(file_name: 'customers.txt')
      File.readlines("lib/data/#{file_name}").map(&:chomp)
          .map { |customer| JSON.parse(customer) }
    end

    def self.create_valid_customers_file(customers, path)
      File.open(path, 'w') do |f|
        customers.each do |customer|
          name = customer['name'] || customer[:name]
          user_id = customer['user_id'] || customer[:user_id]
          f.puts "#{name} - #{user_id}"
        end
      end
    end
  end
end
