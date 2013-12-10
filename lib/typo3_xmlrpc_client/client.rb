require 'yaml'
require 'erb'

XMLRPC::Config.module_eval {
  remove_const(:ENABLE_NIL_PARSER)     # so that we're not warned about reassigning to a constant
  const_set(:ENABLE_NIL_PARSER, true)  # so that we don't get "RuntimeError: wrong/unknown XML-RPC type 'nil'"
}

module Typo3_XMLRPC_Client

  class Client

    attr_reader :connection
    attr_accessor :port, :host, :path, :username, :password, :use_ssl, :default_post_fields, :debug

    attr_accessor :token

    def initialize(options = {})
      {
        :port => 80,
        :use_ssl => false,
        :host => nil,
        :path => '/xmlrpc.php',
        :username => nil,
        :password => nil,
        :debug => false
      }.merge(options).each{ |opt| self.send("#{opt[0]}=", opt[1]) }

      self.connect
      self.authenticate

      self
    end

    def connect
     @connection = XMLRPC::Client.new(self.host, self.path, self.port,nil,nil,nil,nil,self.use_ssl,nil)
     @connection.http_header_extra = {'accept-encoding' => 'identity'}
    end

    def authenticate
     @token = @connection.call('login', self.username, self.password);
    end

    def execute(*args)
      self.connection.call("call", @token, *args)
    end

  end

end
