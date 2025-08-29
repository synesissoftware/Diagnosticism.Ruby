# gemspec for Diagnosticism.Ruby

$:.unshift File.join(File.dirname(__FILE__), 'lib')


require 'diagnosticism/version'

require 'date'


Gem::Specification.new do |spec|

  spec.name         = 'diagnosticism'
  spec.version      = Diagnosticism::VERSION
  spec.date         = Date.today.to_s
  spec.summary      = 'diagnosticism'
  spec.description  = <<END_DESC
Diagnostic facilities, for Ruby
END_DESC
  spec.authors      = [ 'Matt Wilson' ]
  spec.email        = 'matthew@synesis.com.au'
  spec.homepage     = 'http://github.com/synesissoftware/Diagnosticism.Ruby'
  spec.license      = 'BSD-3-Clause'

  spec.required_ruby_version = [ '>= 2.0', '< 4' ]

  spec.files = Dir[ 'Rakefile', '{bin,examples,lib,man,spec,test}/**/*', 'README*', 'LICENSE*' ] & `git ls-files -z`.split("\0")

  spec.add_development_dependency 'xqsr3', [ '~> 0.39', '>= 0.39.4' ]
end


# ############################## end of file ############################# #

