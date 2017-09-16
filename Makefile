IPADDRESS=$(shell grep -n ansible_host hosts|tail -1|cut -f2 -d'='|cut -f1 -d' ')


.PHONY: all clean run tags

all:
	ssh-keygen -f "/home/mohan/.ssh/known_hosts" -R $(IPADDRESS) ;\
	ssh-copy-id pi@$(IPADDRESS) ;\
	bash run.sh ;\

clean:
	ssh-keygen -f "/home/mohan/.ssh/known_hosts" -R $(IPADDRESS) ;\
	ssh-copy-id pi@$(IPADDRESS) ;\

tags:
	ansible-playbook --verbose -i hosts playbook.yml --ask-become-pass --tags=$(TAGS) 
