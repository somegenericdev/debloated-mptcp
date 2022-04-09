A collection of resources to setup a multi WAN aggregator, in a similiar fashion to OpenMPTCPRouter, but without all the unnecessary stuff.
# Why

OpenMPTCPRouter is heavily bloated, officially supported only by a handful of devices and its size makes it impossible to install it on some devices with a small flash.

# How

## VPS
1. Download the script
```console
wget https://raw.githubusercontent.com/somegenericdev/debloated-mptcp/main/vps/script.sh`
```
2. Set the password
```console 
nano script.sh`
```
3. Make it executable
```console
chmod +x script.sh`
```
4. Run it
```console
./script.sh`
```
## Gateway
1. Compile OpenWrt with MPTCP kernel for your device ([follow arinc9's guide](https://forum.openwrt.org/t/tutorial-build-openwrt-with-multipath-tcp/84325))

2. Install v2ray (at compile time or later)

3. Download the script
```console
wget https://raw.githubusercontent.com/somegenericdev/debloated-mptcp/main/gateway/script.sh
```
4. Set the variables (make sure that the executable's path is correct!)
```console
nano script.sh
```
5. Make it executable
```console
chmod +x script.sh
```
6. Run it
```console
./script.sh
```
7. Reboot, then add all the routes in the routing table with 'route add'