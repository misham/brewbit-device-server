require 'spec_helper'
require 'message_handler'

describe MessageHandler do
  let( :version_message ){ FactoryGirl.build :version_message }
  let( :temperature_message ){ FactoryGirl.build :temperature_message }
  let( :ack_message ){ FactoryGirl.build :ack_message }

  before { @handler = MessageHandler.new }

  subject { @handler }

  describe 'process' do

    describe 'version message' do
      context 'when version is not set' do
        it 'sets the version for the handler' do
          result = @handler.process version_message
          expect( @handler.version ).to eq '1'
          expect( result ).to eq ack_message
        end
      end

      context 'when version is set' do
      end
    end

    describe 'temperature message' do
      context 'when version is not set' do
      end

      context 'when version is set' do
        before { @handler.process version_message }

        it 'saves the temperature and acks the request' do
          result = @handler.process temperature_message
          expect( result ).to eq ack_message
        end
      end
    end
  end
end
