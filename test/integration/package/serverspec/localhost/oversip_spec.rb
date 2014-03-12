require 'spec_helper'

describe 'OverSIP' do
  describe group('oversip') do
    it { should exist }
  end

  describe user('oversip') do
    it { should exist }
    it { should belong_to_group 'oversip' }
  end

  describe service('oversip') do
    it { should be_enabled }
    it { should be_running }
  end

  describe command('oversip --version | head -1') do
    it { should return_stdout /OverSIP 1.4.1/ }
  end

  describe port(5060) do
    it { should be_listening.with('tcp') }
    it { should be_listening.with('udp') }
  end

  describe port(10080) do
    it { should be_listening.with('tcp') }
  end
end