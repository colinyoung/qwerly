require 'json'
require 'qwerly'

class Qwerly::ResponseDeveloperInactive; end
class Qwerly::ResponseError; end
class Qwerly::ResponseOK; end
class Qwerly::ResponseWait; end

class Qwerly
  class Response
    
    attr_accessor :status, :raw, :id, :object
    
    def initialize(http_response)
      @raw = http_response
      set_object @raw
      self
    end
    
    def set_object(probably_json)
      begin
      @object = JSON.parse(probably_json)
      rescue TypeError
        definitely_not_json = probably_json
        code = definitely_not_json['h1'].to_s.match(/\d*/)[0]
        case code
        when 403
          @status = Qwerly::ResponseDeveloperInactive
        when 202
          @status = Qwerly::ResponseWait
        when 200
          @status = Qwerly::ResponseOK
        end
      end
    end
    
  end
end