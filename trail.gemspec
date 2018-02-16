# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trail/version'

Gem::Specification.new do |spec|
  spec.name          = 'trail'
  spec.version       = Trail::VERSION
  spec.authors       = ['NikitaSmall']
  spec.email         = ['nikitasosnov@yahoo.com']

  spec.summary       = 'Trail allows to save or load Testrail data dumps.'
  spec.description   = 'Trail is a tool that process Testrail project; ' \
                       'It can save or upload Testrail data dump.'
  spec.homepage      = 'https://github.com/NikitaSmall/trail'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.52.1'
end
