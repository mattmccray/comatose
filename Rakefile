require 'rake'
require 'rake/tasklib'
require 'rake/testtask'
require 'rake/rdoctask'
require 'test/behaviors'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the Comatose plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

Behaviors::ReportTask.new :specs do |t|
  t.pattern = 'test/**/*_test.rb'
end

desc 'Generate documentation for Comatose.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Comatose'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

def manifest_files
  Dir.glob("**/*").delete_if do |item|
    item.include?(".git") or item =~ /gem(?:spec)?$/ or File.directory?(item)
  end
end

desc "Generate a MANIFEST files"
task :manifest do
  File.open('MANIFEST', 'w') do |f|
    f.write manifest_files.join("\n")
  end
  puts 'Created MANIFEST'
end


desc "Update GEMSPEC"
task :gemspec=>:manifest do
  $: << 'lib'
  require 'comatose/version'
  
  gemspec_src =<<-EOGS
# Generated on #{ Time.now.to_s }
Gem::Specification.new do |s|
  s.name = "comatose"
  s.version = "#{ Comatose::VERSION }"
  s.date = "#{ Time.now.strftime('%Y-%m-%d') }" # 2008-05-20
  s.summary = "Micro CMS designed for being embedded into existing Rails applications"
  s.email = "matt@elucidata.net"
  s.rubyforge_project = 'comatose'
  s.homepage = "http://comatose.rubyforge.org"
  s.description = "Comatose is a micro CMS designed for being embedded into existing Rails applications."
  s.has_rdoc = true
  s.authors = ["M@ McCray"]
  s.bindir = 'bin'
  s.executables = ['comatose']
  s.files = ["#{ manifest_files.join('", "') }"]
  s.test_files = ["#{ manifest_files.delete_if{ |f| !f.include?('test/') }.join('", "') }"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = %w(README.rdoc CHANGELOG SPECS LICENSE)
  #s.add_dependency("mime-types", ["> 0.0.0"])
end
EOGS
  
  File.open("comatose.gemspec", 'w') do |f|
    f.write gemspec_src
  end
  
  puts "Update GEMSPEC"
end

desc "Builds the admin customizable layout, the embedded layout have the JS and CSS inlined"
task :build do
  require 'erb'

  # Javascript
  script_path = File.join('resources', 'public', 'javascripts', 'comatose_admin.js')
  script_contents = ''
  # Stylesheet
  style_path = File.join('resources', 'public', 'stylesheets', 'comatose_admin.css')
  style_contents = ''
  # Layout Template
  tmpl_path = File.join('resources', 'layouts', 'comatose_admin_template.html.erb')
  tmpl_contents = ''
  # Layout Target
  layout_path = File.join('views', 'layouts', 'comatose_admin.html.erb')
  layout_contents = ''
  # Customizable Target
  customizable_path = File.join('views', 'layouts', 'comatose_admin_customize.html.erb')
  
  # Read the file contents...
  File.open(script_path, 'r') {|f| script_contents = "<script>\n#{f.read}\n</script>" }
  File.open(style_path, 'r')  {|f| style_contents = "<style>\n#{f.read}\n</style>" }
  File.open(tmpl_path, 'r')   {|f| tmpl_contents = f.read }

  # Create the final layout...
  layout_contents = ERB.new( tmpl_contents ).result(binding)
  
  # Write it out...
  File.open(layout_path, 'w') {|f| f.write layout_contents }
  
  # Now let's create the customizable one...
  style_contents = "<%= stylesheet_link_tag 'comatose_admin' %>"
  script_contents = "<%= javascript_include_tag 'comatose_admin' %>"
  
  # Create the final layout...
  layout_contents = ERB.new( tmpl_contents ).result(binding)
  
  # Write it out...
  File.open(customizable_path, 'w') {|f| f.write layout_contents }
  
  # That's it -- we're done.
  puts "Finished."
end


desc "Creates an empty rails application for use as a test harness"
task :test_harness do
  target = ENV['TARGET']
  if target.nil?
    puts "You must specify a TARGET for the test harness"
    exit(1)
  else
    target = File.expand_path target
    if target == File.expand_path(File.dirname(__FILE__))
      puts "You must specify a folder other than this one."
      exit(1)
    end
  end
  comatose_plugin_path = target / 'vendor' / 'plugins' / 'comatose'

  puts "Creating test harness at #{ target }"
  run_sh "rails -d sqlite3 #{target}"
  run_sh "cp -r #{ File.dirname(__FILE__) }/ #{ comatose_plugin_path }"
  run_sh "ruby #{ comatose_plugin_path / 'install.rb' }"
  run_sh "ruby #{ target / 'script' / 'generate' } comatose_migration"
  run_sh "ruby #{ comatose_plugin_path / 'bin' / 'comatose' } --plugin #{ target }"
  run_sh "cd #{ target } && rake db:migrate"

  run_sh "cp #{ target / 'db' / 'development.sqlite3' } #{target / 'db' / 'test.sqlite3'}"
  run_sh "rm #{ target / 'public' / 'index.html' }"
  run_sh "cp #{ comatose_plugin_path / 'views' / 'layouts' / 'comatose_content.html.erb' } #{ target / 'app' / 'views' / 'layouts' / 'comatose_content.html.erb' }"
  
  # Remove me soon!
  run_sh "cd #{ target } && ruby #{ target / 'script' / 'plugin' } install acts_as_tree"
  run_sh "cd #{ target } && ruby #{ target / 'script' / 'plugin' } install acts_as_list"

  puts "Done."
end

class String
  def /(str)
    File.join(self, str)
  end
end

def run_sh(command)
  puts "-------------------------------------------------------------------------------"
  puts "Running `#{command}`:"
  sh command
  puts
  puts
end