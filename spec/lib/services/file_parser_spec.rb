# frozen_string_literal: true

require 'rails_helper'

describe Services::FileParser do
  describe '.parse_data_file' do
    before do
      allow(File).to receive(:readlines)
        .with('lib/data/customers.txt')
        .and_return(File.readlines('spec/samples/data/customers.txt'))
    end

    it 'returns a parsed response of customers' do
      response = Services::FileParser.parse_data_file
      expect(response.size).to eq(3)
      expect(response.first['latitude']).to eq('52.986375')
      expect(response.last['name']).to eq('Ian McArdle')
    end
  end

  describe '.create_valid_customers_file' do
    TEMP_FILE_PATH = 'spec/samples/data/customer_output_temp.txt'

    before(:all) do
      @data = [{ "latitude": '1', "user_id": 1, "name": 'Christina McArdle', "longitude": '1' },
               { "latitude": '2', "user_id": 1, "name": 'Alice Cahill', "longitude": '2' },
               { "latitude": '3', "user_id": 2, "name": 'Stephen McArdle', "longitude": '3' }]
    end

    after(:all) do
      File.delete(TEMP_FILE_PATH) if File.exist? TEMP_FILE_PATH
    end

    it 'creates an output file of customers' do
      Services::FileParser.create_valid_customers_file(@data, TEMP_FILE_PATH)
      expect(IO.read('spec/samples/data/customers_output.txt')).to eq(IO.read(TEMP_FILE_PATH))
    end
  end
end
