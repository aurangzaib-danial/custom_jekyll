Dir.chdir('tmp')

RSpec.describe CustomJekyll::Generator do
  subject { described_class.new('test-site') }

  it 'creates site folder from the name passed during initialization' do
    expect(File).to exist(subject.site_name)
  end

  it '#root for root files' do
    
  end
end
