.PHONY: build
build:
	podman build . -t epdg-tunnel

run:
	podman run --rm -it --cap-add net_raw --cap-add net_admin --device /dev/net/tun --network host epdg-tunnel -m localhost -d wo.vzwwo.com -M 311 -N 480 -a IMS
