class CustomJekyll::Generator
  attr_reader :site_name

  class << self
    def path_to_resources
      $LOAD_PATH.detect do |dir|
        dir.include?('custom_jekyll') && dir.include?('lib')
      end
    end

    def path_to_site_template
      path_to_resources.dup << '/custom_jekyll/site_template'
    end
  end
  
  def initialize(site_name)
   @site_name = site_name 
   g_site_folder
  end

  def generate_site
    copy_templates_to_new_site
    change_directory_to_site
    run_automated_commands
  end

  def g_site_folder
    Dir.mkdir(site_name)
  end

  def copy_templates_to_new_site
    FileUtils.cp_r(site_template, site_name)
  end

  def run_automated_commands
    run_bundle_install
    make_git_repo
  end

  def add_site_name_to_site_config
    config = File.read('_config.yml')
    config.gsub!('%site_title%', humanize_site_name)
    overwrite_config(config)
  end

  def change_directory_to_site
    Dir.chdir(site_name)
  end

  private
  
  def site_template
    self.class.path_to_site_template << '/.'
  end

  def run_bundle_install
    puts "Running bundle install in #{site_name}"
    ENV["BUNDLE_GEMFILE"] = File.expand_path('Gemfile')
    system("bundle install")
  end

  def make_git_repo
    system("git init")
  end

  def humanize_site_name
    site_name.split(/-|\s/).map {|w| w.capitalize}.join("\s")
  end

  def overwrite_config(content)
    File.open '_config.yml', 'w' do |f|
      f.write content
    end
  end
  
end
