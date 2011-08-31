begin 
  require 'comatose/version'
rescue LoadError
  $: << File.join(File.dirname(__FILE__), '..', '..', 'lib', 'comatose')


end
require 'tasks/admin'
require 'tasks/setup'
require 'tasks/data'
