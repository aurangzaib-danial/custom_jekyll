class CustomJekyll::CommandLineController
  def generate(site_name)
    Generator.new(site_name)
  end
end
