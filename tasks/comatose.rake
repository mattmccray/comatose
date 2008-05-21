begin 
  require 'comatose'
rescue LoadError
  $: << File.join(File.dirname(__FILE__), '..', 'lib')
end

require 'comatose/tasks/admin'
require 'comatose/tasks/setup'
require 'comatose/tasks/data'