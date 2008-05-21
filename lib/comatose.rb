
module Comatose

  # DEPRECATED
  # Loads extensions from RAILS_ROOT/lib/comatose/*.rb
  def self.load_extensions
    Dir[File.join(RAILS_ROOT, 'lib', 'comatose', '*.rb')].each do |path|
      require "comatose/#{File.basename(path)}"
    end
  end

end

require 'comatose/configuration'
require 'comatose/comatose_drop'
require 'comatose/processing_context'
require 'comatose/page_wrapper'
require 'comatose/version'

require 'dispatcher' unless defined?(::Dispatcher)
::Dispatcher.to_prepare :comatose do
    Comatose.config.after_setup.call
end
