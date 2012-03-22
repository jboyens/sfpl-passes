module Fixtures
  def load_fixture(name)
    File.open(File.join(File.dirname(__FILE__), '..', 'fixtures', name))
  end
end

RSpec.configure do |config|
  config.include Fixtures
end
