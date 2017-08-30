IPADDRESS=10.10.10.74

.PHONY: all

all:
	ssh-keygen -f "/home/mohan/.ssh/known_hosts" -R $(IPADDRESS) ;\
	ssh-copy-id pi@$(IPADDRESS) ;\
	bash run.sh
