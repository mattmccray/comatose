# Init for gem version of Comatose

require 'support/class_options'
require 'acts_as_versioned'
require 'redcloth' unless defined?(RedCloth)
require 'liquid' unless defined?(Liquid)

require 'comatose'
require 'text_filters'

require 'support/inline_rendering'
require 'support/route_mapper'
