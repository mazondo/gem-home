require "cgi" unless defined? CGI
require_relative "../lib/rubygems/home/browser"
require_relative "../lib/rubygems/home/spec_loader"
require "minitest/autorun"
require 'webmock/minitest'
