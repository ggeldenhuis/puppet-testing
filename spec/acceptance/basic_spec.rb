require 'spec_helper_acceptance'

# We setup a very basic puppet definition here.
describe 'basic testing class installation' do
  let(:manifest) do
    <<-EOS
      class {'::testing': }
    EOS
  end

  # This test applies the manifest
  it 'should run without errors' do
    result = apply_manifest(manifest, :catch_failures => true)
    expect(result.exit_code).to eq 2
  end

  # This test applies the manifest again, but this time expecting no changes.
  it 'should run a second time without errors' do
    result = apply_manifest(manifest, :catch_failures => true)
    expect(result.exit_code).to eq 0
  end

  # Very simple test to test for the existance of a file and some specific content
  it 'should create a file file.two' do
    result = shell('grep -E \'Hello People\' /tmp/testing/file.two')
    expect(result.exit_code).to eq 0
  end

  it 'should create a file file.one' do
    result = shell('grep -E \'Hello World\' /tmp/testing/file.one')
    expect(result.exit_code).to eq 0
  end

#  # Should you need to login to the VM to see why things are failing you could
#  # enable this test.
#  it 'should delay stuff so I can check it' do
#    result = shell('sleep 5000')
#    expect(result.exit_code).to eq 0
#  end

end

# TODO
# where do I find a list of functions like apply_manifest and a description of
# what they are supposed to do?
