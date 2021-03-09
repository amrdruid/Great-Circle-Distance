# frozen_string_literal: true

module Services
  # This class gets the distance between two points
  # and checks if distance is valid
  class GreatCircleDistance
    OFFICE_LATITUDE = 53.339428
    OFFICE_LONGITUDE = -6.257664
    EARTH_MEAN_RADIUS_IN_KMS = 6371.009
    MAX_DISTANCE_FROM_OFFICE = 100

    attr_reader :all_customers, :valid_customers

    def initialize(customers_list)
      @all_customers = customers_list
    end

    def generate_customers_to_invite
      @valid_customers = @all_customers.select do |customer|
        customer_distance = distance_in_km(customer['latitude'].to_f,
                                           customer['longitude'].to_f)

        customer_in_valid_distance?(customer_distance)
      end
    end

    def generate_valid_customers_output_file(path = 'lib/data/output.txt')
      sorted_customers = sort_customers_by_user_id
      Services::FileParser.create_valid_customers_file(sorted_customers, path)
    end

    private

    def distance_in_km(customer_lat, customer_lng)
      Math.acos(
        Math.sin(convert_to_radians(customer_lat)) * Math.sin(convert_to_radians(OFFICE_LATITUDE)) +
        Math.cos(convert_to_radians(customer_lat)) * Math.cos(convert_to_radians(OFFICE_LATITUDE)) *
        Math.cos(convert_to_radians(OFFICE_LONGITUDE - customer_lng))
      ) * EARTH_MEAN_RADIUS_IN_KMS
    end

    def customer_in_valid_distance?(distance)
      distance <= MAX_DISTANCE_FROM_OFFICE
    end

    def convert_to_radians(position)
      position * Math::PI / 180.0
    end

    def sort_customers_by_user_id
      valid_customers.sort_by { |customer| customer['user_id'] }
    end
  end
end
