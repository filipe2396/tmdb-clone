RSpec.configure do |config|
  config.before(:each, type: :system) do |example|
    if example.metadata[:js]
      driven_by :selenium, using: :headless_chrome
    else
      driven_by :rack_test
    end
  end
end
