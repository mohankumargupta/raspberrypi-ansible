IPADDRESS=$(shell grep -n ansible_host hosts|tail -1|cut -f2 -d'='|cut -f1 -d' ')
ifdef TAGS
APPENDSTRING=--tags=$(TAGS)
endif
ifdef SKIPTAGS
APPENDSTRING:=$(APPENDSTRING) --skip-tags=$(SKIPTAGS)
endif

.PHONY: all clean tags test

all:
	ssh-keygen -f "/home/mohan/.ssh/known_hosts" -R $(IPADDRESS) ;\
	sshpass -p raspberry ssh-copy-id -o StrictHostKeyChecking=no pi@$(IPADDRESS) ;\
	bash run.sh ;\

clean:
	ssh-keygen -f "/home/mohan/.ssh/known_hosts" -R $(IPADDRESS) ;\
	ssh-copy-id pi@$(IPADDRESS) ;\

tags:
	ansible-playbook --verbose -i hosts playbook.yml --ask-become-pass $(APPENDSTRING)


