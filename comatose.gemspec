# Generated on Tue May 20 20:13:12 -0500 2008
Gem::Specification.new do |s|
  s.name = "comatose"
  s.version = "2.0.5"
  s.date = "2008-10-31" # 2008-05-20
  s.summary = "Micro CMS designed for being embedded into existing Rails applications"
  s.email = "matt@elucidata.net"
  s.rubyforge_project = 'comatose'
  s.homepage = "http://comatose.rubyforge.org"
  s.description = "Comatose is a micro CMS designed for being embedded into existing Rails applications."
  s.has_rdoc = true
  s.authors = ["M@ McCray"]
  s.bindir = 'bin'
  s.executables = ['comatose']
  
  s.files = ["CHANGELOG",
             "INSTALL",
             "LICENSE",
             "MANIFEST",
             "README.markdown",
             "Rakefile",
             "SPECS",
             "about.yml",
             "bin/comatose",
             "comatose.gemspec",
             "generators/comatose_migration/comatose_migration_generator.rb",
             "generators/comatose_migration/templates/migration.rb",
             "generators/comatose_migration/templates/v4_upgrade.rb",
             "generators/comatose_migration/templates/v6_upgrade.rb",
             "generators/comatose_migration/templates/v7_upgrade.rb",
             "generators/comatose_migration/USAGE",
             "init.rb",
             "install.rb",
             "lib/acts_as_versioned.rb",
             "lib/comatose/comatose_drop.rb",
             "lib/comatose/configuration.rb",
             "lib/comatose/page_wrapper.rb",
             "lib/comatose/processing_context.rb",
             "lib/comatose/tasks/admin.rb",
             "lib/comatose/tasks/data.rb",
             "lib/comatose/tasks/setup.rb",
             "lib/comatose/version.rb",
             "lib/comatose.rb",
             "lib/comatose_admin_controller.rb",
             "lib/comatose_admin_helper.rb",
             "lib/comatose_controller.rb",
             "lib/comatose_helper.rb",
             "lib/comatose_page.rb",
             "lib/liquid/block.rb",
             "lib/liquid/context.rb",
             "lib/liquid/document.rb",
             "lib/liquid/drop.rb",
             "lib/liquid/errors.rb",
             "lib/liquid/extensions.rb",
             "lib/liquid/file_system.rb",
             "lib/liquid/htmltags.rb",
             "lib/liquid/standardfilters.rb",
             "lib/liquid/standardtags.rb",
             "lib/liquid/strainer.rb",
             "lib/liquid/tag.rb",
             "lib/liquid/template.rb",
             "lib/liquid/variable.rb",
             "lib/liquid.rb",
             "lib/redcloth.rb",
             "lib/support/class_options.rb",
             "lib/support/inline_rendering.rb",
             "lib/support/route_mapper.rb",
             "lib/text_filters/markdown.rb",
             "lib/text_filters/markdown_smartypants.rb",
             "lib/text_filters/none.rb",
             "lib/text_filters/rdoc.rb",
             "lib/text_filters/simple.rb",
             "lib/text_filters/textile.rb",
             "lib/text_filters.rb",
             "rails/init.rb",
             "resources/layouts/comatose_admin_template.html.erb",
             "resources/public/images/collapsed.gif",
             "resources/public/images/expanded.gif",
             "resources/public/images/no-children.gif",
             "resources/public/images/page.gif",
             "resources/public/images/spinner.gif",
             "resources/public/images/title-hover-bg.gif",
             "resources/public/javascripts/comatose_admin.js",
             "resources/public/stylesheets/comatose_admin.css",
             "tasks/comatose.rake",
             "views/comatose_admin/_form.html.erb",
             "views/comatose_admin/_page_list_item.html.erb",
             "views/comatose_admin/delete.html.erb",
             "views/comatose_admin/edit.html.erb",
             "views/comatose_admin/index.html.erb",
             "views/comatose_admin/new.html.erb",
             "views/comatose_admin/reorder.html.erb",
             "views/comatose_admin/versions.html.erb",
             "views/layouts/comatose_admin.html.erb",
             "views/layouts/comatose_admin_customize.html.erb",
             "views/layouts/comatose_content.html.erb"]
  
  s.test_files = ["test/behaviors.rb",
                  "test/fixtures/comatose_pages.yml",
                  "test/functional/comatose_admin_controller_test.rb",
                  "test/functional/comatose_controller_test.rb",
                  "test/javascripts/test.html",
                  "test/javascripts/test_runner.js",
                  "test/test_helper.rb",
                  "test/unit/class_options_test.rb",
                  "test/unit/comatose_page_test.rb",
                  "test/unit/processing_context_test.rb",
                  "test/unit/text_filters_test.rb"]
  
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = %w(README.markdown CHANGELOG SPECS LICENSE)
  #s.add_dependency("mime-types", ["> 0.0.0"])
end
