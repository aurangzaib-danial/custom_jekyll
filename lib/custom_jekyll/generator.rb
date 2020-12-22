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

  def generate_site
    copy_templates_to_new_site
  end

  def g_site_folder
    Dir.mkdir(site_name)
  end

  def copy_templates_to_new_site
    FileUtils.cp_r(site_template, site_name)
  end


  private
  
  def site_template
    self.class.path_to_site_template << '/.'
  end
  
end
