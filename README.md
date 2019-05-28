## This repo contains an example of consul-replicate in multi-dc. 


#### The usage is pretty simple

- At least 3GB ram
- Vagrant should be [installed](https://www.vagrantup.com/)
- Git should be [installed](https://git-scm.com/)

### Now we are ready to start, just follow the steps:

- Clone the repo
```
git clone https://github.com/chavo1/consul-replicate-example.git
cd consul-replicate-example
```
- Start the lab
```
vagrant up
```
#### Consul UI is available as follow:
##### DC1
- Server: https://192.168.56.51:8500 etc.
- Client: https://192.168.56.61:8500 etc.
##### DC2
- Server: https://192.168.57.51:8500 etc.
- Client: https://192.168.57.61:8500 etc.

#### Create an entry in your KV store on a Second DC "https://192.168.57.51:8500" - for example "test" with value "1":

<img src=“https://github.com/chavo1/consul-replicate-example/blob/master/pict/kv_test.png” />

#### From the command line - ssh to the DC1
```
$ vagrant ssh consul-dc1-server01
$ sudo su -
$ consul-replicate -log-level trace -prefix "test@dc2"
```
- The last command will replicate "test" entry from DC2 to DC1 
#### Do not forget to destroy the environment.
```
vagrant destroy
```
