Dir.mkdir('tmp') unless File.exists?('tmp')
TMP_DIR = File.expand_path('tmp')

RSpec.describe CustomJekyll::Generator do
  
  before(:each) do
    Dir.chdir(TMP_DIR)
    system("rm -rf ./*")
  end

  subject { described_class.new('test-site') }

  it 'creates site folder from the name passed during initialization' do
    expect(File).to exist(subject.site_name)
  end

  it '.path_to_resources returns an absolute path that points to the lib folder inside the gem' do
    expect(described_class.path_to_resources).to include('custom_jekyll/lib')
    expect(File).to exist(described_class.path_to_resources)
  end

  it '.path_to_site_template uses path_to_resources and returns the path to site_template' do
    expect(described_class.path_to_site_template).to include('lib/custom_jekyll/site_template')
    expect(File).to exist(described_class.path_to_site_template)
  end

  it "#copy_templates_to_new_site copies all the files in site_template of gem's lib folder to the new site directory" do
    subject.copy_templates_to_new_site
    # two expectations are enough for checking if the files were copied.
    expect(File).to exist('test-site/.gitignore') # simple
    expect(File).to exist('test-site/assets/css/styles.scss') # deep
  end

  xit '#run_automated_commands at least runs bundle install' do
    subject.copy_templates_to_new_site
    subject.change_directory_to_site
    subject.run_automated_commands
    expect(File).to exist('Gemfile.lock')
  end

  it '#add_site_name_to_site_config' do
    subject.copy_templates_to_new_site
    subject.change_directory_to_site
    subject.add_site_name_to_site_config
    expect(File.read('_config.yml')).to include('Test Site')
  end
  
end
