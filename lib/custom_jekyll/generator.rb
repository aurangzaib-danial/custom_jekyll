class CustomJekyll::Generator
  attr_reader :site_name

  class << self
    def path_to_resources
      $LOAD_PATH.detect do |dir|
        dir.include?('custom_jekyll/lib')
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

  # def generate_site
  #   copy_templates_to_new_site
  # end

  def g_site_folder
    Dir.mkdir(site_name)
  end

  def copy_templates_to_new_site
    FileUtils.cp_r(site_template, site_name)
  end

  def run_automated_commands
    change_directory_to_site
    run_bundle_install
    make_git_repo
  end

  private
  
  def site_template
    self.class.path_to_site_template << '/.'
  end

  def change_directory_to_site
    Dir.chdir(site_name)
  end

  def run_bundle_install
    puts "Running bundle install in #{site_name}"
    ENV["BUNDLE_GEMFILE"] = File.expand_path('Gemfile')
    system("bundle install")
  end

  def make_git_repo
    system("git init")
  end
  
end
