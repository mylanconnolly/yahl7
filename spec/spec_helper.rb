# frozen_string_literal: true

require 'yahl7'

DEFINED_MESSAGE_TYPES =
  ObjectSpace
  .each_object(Class)
  .filter { |klass| klass < YAHL7::V2::Message }
  .map { |klass| [klass.name.split('::').last, klass] }

DEFINED_SEGMENT_TYPES =
  ObjectSpace
  .each_object(Class)
  .filter { |klass| klass < YAHL7::V2::Segment }
  .map { |klass| [klass.name.split('::').last, klass] }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
