# frozen_string_literal: true

require_relative "rulers/version"
require_relative "rulers/array"

module Rulers
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'},
       ["Hello from Ruby on Rulers!"]]
    end
  end
end 
