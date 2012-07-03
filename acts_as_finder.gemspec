# -*- encoding: utf-8 -*-
require File.expand_path('../lib/acts_as_finder/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tomasz Gieniusz"]
  gem.email         = ["tomasz.gieniusz@gmail.com"]
  gem.description   = %q{This "acts_as" extension provides the capabilities for beautiful record finding by specified column(s).}
  gem.summary       = %q{A gem allowing beautiful record finding by specified column.}
  gem.homepage      = "http://github.com/tomgi/acts_as_finder"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "acts_as_finder"
  gem.require_paths = ["lib"]
  gem.version       = ActiveRecord::Acts::Finder::VERSION
  
  gem.add_dependency "bundler"
  gem.add_dependency "rake"
  gem.add_dependency "activerecord"

  gem.add_development_dependency "bundler"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "rspec"
end
