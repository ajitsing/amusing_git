# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/amusing_git/version.rb'

Gem::Specification.new do |s|
  s.name                        =   'amusing_git'
  s.version                     =   AmusingGit::VERSION
  s.summary                     =   'Brings fun to the git workflow!'
  s.description                 =   s.summary
  s.authors                     =   ['Ajit Singh']
  s.email                       =   'jeetsingh.ajit@gamil.com'
  s.license                     =   'MIT'
  s.homepage                    =   'https://github.com/ajitsing/amusing_git.git'

  s.files                       =   `git ls-files -z`.split("\x0")
  s.executables                 =   s.files.grep(%r{^bin/}) { |f| File.basename(f)  }
  s.test_files                  =   s.files.grep(%r{^(test|spec|features)/})
  s.require_paths               =   ["lib"]

  s.add_dependency                  'thor', '~> 0.20.0'
  s.add_development_dependency      "bundler", "~> 1.5"
end
