require 'test_helper'
require 'generators/scaffold_bootstrap/scaffold_bootstrap_generator'

class ScaffoldBootstrapGeneratorTest < Rails::Generators::TestCase
  tests ScaffoldBootstrapGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
