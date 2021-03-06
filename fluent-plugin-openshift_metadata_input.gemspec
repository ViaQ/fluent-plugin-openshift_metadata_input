# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-openshift_metadata_input"
  gem.version       = "0.1.1"
  gem.authors       = ["Anton Sherkhonov"]
  gem.email         = ["sherkhonov@gmail.com"]
  gem.description   = %q{Input plugin to collect Openshift metadata}
  gem.summary       = %q{Input plugin to collect Openshift metadata}
  gem.homepage      = "https://github.com/viaq/fluent-plugin-openshift_metadata_input"
  gem.license       = "ASL2"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.has_rdoc      = false

  gem.required_ruby_version = '>= 2.0.0'

  gem.add_runtime_dependency "fluentd", "~> 0.12.0"
  gem.add_runtime_dependency "lru_redux"
  gem.add_runtime_dependency "openshift_client"

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest", "~> 4.0"
  gem.add_development_dependency "test-unit", "~> 3.0.2"
  gem.add_development_dependency "test-unit-rr", "~> 1.0.3"
  gem.add_development_dependency "copyright-header"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "bump"
  gem.add_development_dependency "yajl-ruby"
end
