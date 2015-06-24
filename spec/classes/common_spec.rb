# for rspec-puppet documentation - see http://rspec-puppet.com/tutorial/
require_relative '../spec_helper'

describe 'common', :type => :module do
  context 'Checking for /var/rsi directory existance' do	
      it { should contain_file('/var/rsi').with(
        :ensure => 'directory',
        :owner  => 'centos',
        :group  => 'centos',
        :mode   => '0750',
         )
}
end
end
