require 'spec_helper'
describe 'testing', :include_testing => true do

  context 'with defaults for all parameters' do
    it { should contain_class('testing') }
  end
end
