source "https://rubygems.org"

# gem "rails"
group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "selenium-webdriver"
  gem "webdriver"
  gem "site_prism"
  gem "rspec"
  gem "vcr"
  gem "webpack"
  gem "webmock"
  gem "webdrivers"
  gem "poltergeist"
  gem "cucumber"
  gem "minitest"
  gem "rails"
  gem "simplecov", require: false
  gem "watir"
  gem "watir-webdriver"
  gem "parallel"
  gem "pry"
end

group :development, :test do
  gem "rspec-rails"
end

group :test do
  gem "cucumber-rails", require: false
  # database_cleaner is not mandatory, but highly recommended
  gem "database_cleaner"
end
