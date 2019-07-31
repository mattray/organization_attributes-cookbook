# InSpec test for recipe organization-attributes::chef-server

describe directory('/tmp/kitchen/nodes') do
  it { should exist }
end

describe json('/tmp/kitchen/nodes/client-centos-7.json') do
  its(['override','ntp', 'servers', 0]) { should eq '0.au.pool.ntp.org' }
  its(['override','ntp', 'servers', 1]) { should eq '1.au.pool.ntp.org' }
  its(['override','ntp', 'servers', 2]) { should eq '2.au.pool.ntp.org' }
  its(['override','ntp', 'servers', 3]) { should eq '3.au.pool.ntp.org' }
  its(['override','audit', 'profiles', 'linux-patch-baseline', 'url']) { should eq 'https://github.com/dev-sec/linux-patch-baseline' }
  its(['override','audit', 'profiles', 'uptime', 'url']) { should eq 'https://github.com/mattray/uptime-profile' }
end