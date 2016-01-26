require "spec_helper"

describe BandName do
  describe '::get_random' do
    it 'gets a random wikipedia title' do
      client = instance_double(MediawikiApi::Client)
      allow(MediawikiApi::Client).to receive(:new).and_return(client)
      expect(client).to receive(:query).
        with(a_hash_including(generator:'random', grnnamespace:0)).
        and_return(response = instance_double(MediawikiApi::Response))
      expect(response).to receive(:data).and_return({
        pages: {
          some_id: {
            title: 'some random article',
            foo: 'bar'
          }
        }
      }.as_json)

      result = described_class.get_random
      expect(result).to eq 'some random article'
      expect(result).to be_a described_class
    end
  end
end
