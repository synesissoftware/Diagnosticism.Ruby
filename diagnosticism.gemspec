# ######################################################################## #
# File:     diagnosticism.gemspec
#
# Purpose:  Gemspec for Diagnosticism.Ruby library
#
# Created:  3rd January 2025
# Updated:  20th August 2026
#
# ######################################################################## #


$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'diagnosticism/version'


Gem::Specification.new do |spec|

  spec.name         = 'diagnosticism'
  spec.summary      = 'Basic diagnostic facilities, for Ruby'
  spec.version      = Diagnosticism::VERSION
  spec.description  = <<END_DESC
Basic diagnostic facilities, for Ruby. Diagnosticism.Ruby provides
low-level diagnostics components, including a decimal order-of-magnitude
histogram (DOOMGram) for recording event durations.
END_DESC

  spec.authors      = [
    'Matt Wilson',
  ]
  spec.email        = [
    'matthew@synesis.com.au',
  ]
  spec.homepage     = 'https://github.com/synesissoftware/Diagnosticism.Ruby'
  spec.license      = 'BSD-3-Clause'

  spec.required_ruby_version = [ '>= 2.0' ]

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/synesissoftware/Diagnosticism.Ruby/issues',
    'changelog_uri' => 'https://github.com/synesissoftware/Diagnosticism.Ruby/blob/master/CHANGES.md',
    'homepage_uri' => 'https://github.com/synesissoftware/Diagnosticism.Ruby',
    'source_code_uri' => 'https://github.com/synesissoftware/Diagnosticism.Ruby',
  }

  spec.files = Dir[
    'Rakefile',
    '{bin,examples,lib,man,spec,test}/**/*',
    'AUTHORS*',
    'CHANGES*',
    'CONTRIBUTING*',
    'EXAMPLES*',
    'FAQ*',
    'INSTALL*',
    'LICENSE*',
    'NEWS*',
    'README*',
    'SECURITY*',
    'TODO*',
  ] & `git ls-files -z`.split("\0")
  spec.files -= [
    '.ruby-version',
    'Gemfile.lock',
  ]

  spec.add_development_dependency "xqsr3", [ '>= 0.39.5', '< 1.0' ]
end


# ############################## end of file ############################# #
