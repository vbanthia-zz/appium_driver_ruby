# -*- encoding : utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'appium/driver/version'

Gem::Specification.new do |spec|
  spec.name          = 'appium_driver'
  spec.version       = Appium::Driver::VERSION
  spec.authors       = ['Vishal Banthia']
  spec.email         = ['vishal.banthia.vb@gmail.com']
  spec.summary       = Appium::Driver::DESCRIPTION
  spec.description   = Appium::Driver::DESCRIPTION
  spec.homepage      = 'https://github.com/vbanthia/appium_driver_ruby'

  spec.required_ruby_version = '>= 2.4.0'
  spec.files = Dir.glob('*/lib/**/*', File::FNM_DOTMATCH)

  spec.add_runtime_dependency('selenium-webdriver', '3.4.0')
  spec.add_runtime_dependency('nokogiri')
  
  spec.add_development_dependency('pry')
end
