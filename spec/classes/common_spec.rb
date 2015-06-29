# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'
require 'digest/sha1'

describe 'common', :type => :module do

  context 'The catalog should at the very least compile' do
    it { 
         should compile
    }
  end

  context 'Checking for centos user existance' do
      it { should contain_user('centos').with(
        :ensure  => 'present',
        :comment => 'centos user',
        :gid     => '501',
        :home    => '/home/centos',
        :shell   => '/bin/bash',
        :uid     => '501',
         )
}
end

  context 'Checking for /var/rsi directory existance' do	
      it { should contain_file('/var/rsi').with(
        :ensure => 'directory',
        :owner  => 'centos',
        :group  => 'centos',
        :mode   => '0750',
         )
}
end
  context 'The main class should be present in the catalog' do
    it { 
         should contain_class('common') 
    }

end
end
