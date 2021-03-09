# frozen_string_literal: true

namespace :customers do
  desc 'Auto generation for valid customers'
  task generate: :environment do
    all_customers = Services::FileParser.parse_data_file
    obj = Services::GreatCircleDistance.new(all_customers)
    obj.generate_customers_to_invite
    obj.generate_valid_customers_output_file
  end
end
