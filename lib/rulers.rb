# frozen_string_literal: true

require_relative "rulers/version"
require_relative "rulers/array"
require_relative "routing"

module Rulers
  class Application
    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [404,
                { "Content-Type" => "text/html" }, []]
      elsif env["PATH_INFO"] == "/"
        return [301, { "Location" => "http://localhost:3001/quotes/a_quote" },
                []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, { "Content-Type" => "text/html" },
       [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    attr_reader :env
  end
end
