require 'spec_helper'
describe 'testing' do

  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('testing') }
    it { is_expected.to contain_file('/tmp/testing')}

    it do
      is_expected.to contain_file('/tmp/testing/file.one').with(
        'ensure'  => 'file',
        'content' => "Hello World\n"
      )
    end

    it { is_expected.to contain_file('/tmp/testing/file.two').with(
      'ensure'  => 'file',
      'content' => "Hello People\n"
      )
    }
  end
end
