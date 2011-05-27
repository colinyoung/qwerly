$LOAD_PATH.unshift ::File.expand_path(::File.dirname(__FILE__) + '/../lib')

require 'active_support'
require 'active_support/core_ext/class/attribute_accessors'

require 'qwerly/response'

class Qwerly
  
  cattr_writer :key
  attr_accessor :requests
  attr_reader :client
  
  def self.key(key=nil)
    @@key = key if key
    @@key
  end
  
  def initialize(key)
    @@key = key
  end
  
  def self.method_missing(name, *args)
    raise NoAPIKeyError if @@key.nil?
    qwerly = Qwerly.new(@@key)
    qwerly.send name, args
  end
  
  def method_missing(name, *args)
    return nil if ![:email, :twitter, :facebook].include?(name)
    id = args.first
    meth = unless id.is_a?(Numeric) and name == :facebook
      "#{name}_id_url"
    else
      "#{name}_url"
    end
    new_request self.send(meth.to_sym, id)
  end
  
  def new_request(url)
    @requests ||= {}
    @client ||= Client.new
    req = client.new_request(url)
    @requests[req.id] = req
  end
  
  def facebook_url(id)
    "/facebook/username/#{id}"
  end
  
  def facebook_id_url(id)
    "/facebook/#{username}"
  end
  
  def twitter_url(id)
    "/twitter/#{username}"
  end
  
  def email_url(id)
    "/email/#{id}"
  end
  
end

class NoAPIKeyError < RuntimeError; end

require 'qwerly/client'