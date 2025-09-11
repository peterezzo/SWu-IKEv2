.PHONY: build run runns
build:
	podman build . -t epdg-tunnel

NAME = epdg
NS = epdg
SIM = localhost:8443
EPDG = wo.vzwwo.com
APN = ims

run:
	podman run --rm -it --cap-add net_raw --cap-add net_admin --device /dev/net/tun --network host --name $(NAME) epdg-tunnel -m $(SIM) -d $(EPDG) -M 311 -N 480 -a $(APN) 

runns:
	podman run --rm -it --privileged --device /dev/net/tun --network host -v /run/netns:/run/netns:shared --name $(NAME) epdg-tunnel -m $(SIM) -d $(EPDG) -M 311 -N 480 -a $(APN) -n $(NS)
