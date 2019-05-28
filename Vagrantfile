
SERVER_COUNT = 1
CLIENT_COUNT = 1 
CONSUL_VERSION = '1.5.0'
CONSUL_REPLICATE = '0.4.0'
DOMAIN = 'consul'
datacenters = {
  "dc1" => { :ip_range => "192.168.56" },
  "dc2" => { :ip_range => "192.168.57" }
}

Vagrant.configure(2) do |config|
    config.vm.box = "chavo1/xenial64base"
    config.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 2
    
    end

      ################
      #    CONSUL    #
      ################
  
      datacenters.each.with_index(1) do |(dc, info), index|
    
    1.upto(SERVER_COUNT) do |n|
      config.vm.define "consul-#{dc}-server0#{n}" do |server|
        server.vm.hostname = "consul-#{dc}-server0#{n}"
        server.vm.network "private_network", ip: info[:ip_range] + ".#{50+n}"
        server.vm.provision "shell",inline: "cd /vagrant ; bash scripts/consul.sh", env: {"DOMAIN" => DOMAIN,
                                                                                          "CONSUL_VERSION" => CONSUL_VERSION, 
                                                                                          "SERVER_COUNT" => SERVER_COUNT}
        server.vm.provision "shell",inline: "cd /vagrant ; bash scripts/consul-replicate.sh", env: {"CONSUL_REPLICATE" => CONSUL_REPLICATE}

      end
    end

    1.upto(CLIENT_COUNT) do |n|
      config.vm.define "consul-#{dc}-client0#{n}" do |client|
        client.vm.hostname = "consul-#{dc}-client0#{n}"
        client.vm.network "private_network", ip: info[:ip_range] + ".#{60+n}"
        client.vm.provision "shell",inline: "cd /vagrant ; bash scripts/consul.sh", env: {"DOMAIN" => DOMAIN, 
                                                                                          "CONSUL_VERSION" => CONSUL_VERSION, 
                                                                                          "CLIENT_COUNT" => CLIENT_COUNT}

      end
    end
  end
end
