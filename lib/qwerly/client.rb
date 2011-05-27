require 'rubygems'
require 'httparty'
require 'active_support/secure_random'

class Qwerly
  class Client
    
    attr_accessor :id, :requests, :key
    
    def initialize
      key = Qwerly.key
    end
    
    def new_request(url)
      Qwerly::Response.new QwerlyParty.get(url, :request_id => ActiveSupport::SecureRandom.hex(10))
    end
  end
end

class QwerlyParty
  include HTTParty
  
  base_uri 'api.qwerly.com/v1'
  
  default_params :api_key => Qwerly.key
  
end