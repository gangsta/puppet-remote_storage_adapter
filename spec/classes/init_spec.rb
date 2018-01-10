require 'spec_helper'
describe 'remote_storage_adapter' do
  context 'with default values for all parameters' do
    it { should contain_class('remote_storage_adapter') }
  end
end
