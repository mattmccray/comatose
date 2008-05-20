
module Comatose

  VERSION = "2.0 (uber-alpha)"

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

require 'dispatcher' unless defined?(::Dispatcher)
::Dispatcher.to_prepare :comatose do
    # base = File.dirname(__FILE__)
    # load "#{base}/comatose_page.rb"
    # load "#{base}/comatose_admin_controller.rb"
    # load "#{base}/comatose_admin_helper.rb"
    # load "#{base}/comatose_controller.rb"
    # load "#{base}/comatose_helper.rb"

    # Are these just 'found' now?
    # require "comatose_page"
    # require "comatose_admin_controller"
    # require "comatose_admin_helper"
    # require "comatose_controller"
    # require "comatose_helper"

    # These will only be loaded once (in any mode)
    # require 'support/inline_rendering'
    # require 'comatose_processing_context'
    # require 'comatose_page_wrapper'
    # Define the base classes
    Comatose.config.after_setup.call
end
