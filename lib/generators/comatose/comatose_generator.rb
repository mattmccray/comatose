 # lib/generators/authr/comatose/comatose_generator.rb
 require 'rails/generators'
 require 'rails/generators/migration'     

class ComatoseGenerator < Rails::Generators::Base
	include Rails::Generators::Migration

	def self.source_root
		@source_root ||= File.join(File.dirname(__FILE__), 'templates')
	end
  def self.next_migration_number(dirname)
  	if ActiveRecord::Base.timestamped_migrations
    	Time.now.utc.strftime("%Y%m%d%H%M%S")
  	else
    	"%.3d" % (current_migration_number(dirname) + 1)
  	end
  end

	def create_migration_file
  	migration_template 'migration.rb', 'db/migrate/comatose_migration.rb'
	end
	def create_routes
		route("comatose_admin")
		route("#comatose_root '', :layout => comatose_content , :use_cache => false")
	end
	def create_gems_required
		gem("acts_as_list")
		gem("acts_as_tree")
		gem("dynamic_form")
		gem("acts_as_versioned")
	end
end

class ComatosePage < ActiveRecord::Base
  set_table_name 'comatose_pages'
  acts_as_versioned :table_name=>'comatose_page_versions', :if_changed => [:title, :slug, :keywords, :body]
end



