# ######################################################################## #
# File:     Diagnosticism.Ruby.gemspec
#
# Purpose:  Gemspec for Diagnosticism.Ruby library
#
# Created:  3rd January 2025
# Updated:  15th August 2026
#
# ######################################################################## #


$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'diagnosticism/version'


Gem::Specification.new do |spec|

  spec.name         = 'diagnosticism'
  spec.version      = Diagnosticism::VERSION
  spec.summary      = 'diagnosticism'
  spec.description  = <<END_DESC
Diagnostic facilities, for Ruby
END_DESC

  spec.authors      = [
    'Matt Wilson',
  ]
  spec.email        = [
    'matthew@synesis.com.au',
  ]
  spec.homepage     = 'https://github.com/synesissoftware/Diagnosticism.Ruby'
  spec.license      = 'BSD-3-Clause'

  spec.required_ruby_version = [ '>= 2.0', '< 4' ]

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/synesissoftware/Diagnosticism.Ruby/issues',
    'changelog_uri' => 'https://github.com/synesissoftware/Diagnosticism.Ruby/blob/master/CHANGES.md',
    'homepage_uri' => 'https://github.com/synesissoftware/Diagnosticism.Ruby',
    'source_code_uri' => 'https://github.com/synesissoftware/Diagnosticism.Ruby',
  }

  spec.files        = Dir[ 'Rakefile', '{bin,examples,lib,man,spec,test}/**/*', 'README*', 'LICENSE*' ] & `git ls-files -z`.split("\0")

  spec.add_development_dependency "xqsr3", [ '>= 0.39.5', '< 1.0' ]
end


# ############################## end of file ############################# #
