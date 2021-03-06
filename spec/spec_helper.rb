require "bundler/setup"
require "test/tracer"
require "tracing/matchers"
require "grpc/opentracing"

require "support/helloworld"
require "support/greeter_client"
require "support/greeter_server"
require "support/test_span_decorator"

require "pry"

if ENV['verbose']
  require "logger"

  module GRPC
    def self.logger
      @logger ||= Logger.new(STDOUT)
    end
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
