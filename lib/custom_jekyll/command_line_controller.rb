class CustomJekyll::CommandLineController
  def generate(site_name)
    Generator.new(site_name).generate_site
  end
end
