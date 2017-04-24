source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 4.8']
# Gems required for basic testing
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper', '>= 0.8.2'
gem 'puppet-lint', '>= 1.0.0'

# Gems required for beaker
gem 'beaker-rspec'

# JSON must be 1.x on Ruby 1.9
if RUBY_VERSION < '2.0'
  gem 'json', '~> 1.8'
  gem 'json_pure', '~> 1.8'
end
