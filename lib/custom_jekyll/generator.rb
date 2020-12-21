class CustomJekyll::Generator
  attr_reader :site_name
  
  def initialize(site_name)
   @site_name = site_name 
   generate_site
  end

  def generate_site
    site_folder
    root
  end

  def site_folder
    Dir.mkdir(site_name)
  end

  def root
    
  end
  
end
