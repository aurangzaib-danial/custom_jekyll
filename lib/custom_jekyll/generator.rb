class CustomJekyll::Generator
  attr_reader :site_name
  
  def initialize(site_name)
   @site_name = site_name 
   g_site_folder
  end

  def generate_site
    root
  end

  def g_site_folder
    Dir.mkdir(site_name)
  end

  def g_root
    
  end
  
end
