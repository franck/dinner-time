RSpec.configure do |config|
  config.before(:suite) do
    cleaner.clean_with(:truncation)
  end

  config.before do
    cleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    cleaner.strategy = :truncation
  end

  config.before(:each, use_truncation: true) do
    cleaner.strategy = :truncation
  end

  config.before do
    cleaner.start
  end

  config.append_after do
    cleaner.clean
  end

  private

    def cleaner
      DatabaseCleaner
    end
end
