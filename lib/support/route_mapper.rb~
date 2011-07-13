require 'action_dispatch/routing/mapper'
require 'action_dispatch/routing/deprecated_mapper'
require 'rails'
# For use with 'Edge Rails'
ActionDispatch::Routing::Mapper.class_eval do

  # For mounting a page to a path
  def comatose_root( path, options={} )
    opts = {
      :index      => '',
      :layout     => 'comatose_content.html.erb',
      :use_cache  => 'true',
      :cache_path => nil,
      :named_route=> nil
    }.merge(options)

    # Ensure the controller is aware of the mount point...
    Comatose.add_mount_point(path, opts)
    # Add the route...
    opts[:controller] = 'comatose'
    opts[:action] ='show'
    opts[:as] = opts.delete(:named_route)
		opts[:cache] = "true"
		opts[:request_method] = "get"
    if opts[:index] == '' # if it maps to the root site URI, name it comatose_root
      #named_route( 'comatose_root', "#{path}/*page", opts )
      opts[:as] = "comatose_root"
      #match( "#{path}/*page", opts, "compatose_rout" )
      match( "/(*page)", opts )
    else
      match( "#{path}/*page", opts )
    end
   end

  # For mounting the admin
  def comatose_admin( path='comatose_admin', options={} )
    opts = {
      :controller  => 'comatose_admin',
      :named_route => 'comatose_admin'
    }.merge(options)
    opts[:as] = opts.delete(:named_route)
		opts[:request_method] = :get
    match(":controller(/:action(/:id))", opts )


  end

    
#  def method_missing( name, *args, &proc )

    #if name.to_s.starts_with?( 'comatose_' )
#		if args[-1][:controller].starts_with?('comatose')
#      opts = (args.last.is_a?(Hash)) ? args.pop : {}
#      opts[:named_route] = name.to_s #[9..-1]
#      comatose_root( *(args << opt)  )
#    else
#      super unless args.length >= 1 && proc.nil?
#      @set.add_named_route(name, *args)
#    end
#  end



end


