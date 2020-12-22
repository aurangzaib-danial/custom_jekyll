class CustomJekyll::CommandLineController
  def generate(site_name)
    CustomJekyll::Generator.new(site_name).generate_site
  end
end
