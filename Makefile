PS := ps
GREP := grep
MITMPROXY := mitmproxy
MITMDUMP := mitmdump
PIP := pip
LESS := less
CURL := curl


mitmcmd = $(MITMDUMP)
ifeq ($(INTERACTIVE), true)
  mitmcmd = $(MITMPROXY)
endif

.PHONY: test

install:
	$(PIP) install -r requirements.txt

test: docker-test

raw-test:
	nosetests -s


include tasks/*.mk

ps:
	@$(PS) -ef | $(GREP) $(mitmcmd) | $(LESS)

help:
	@$(mitmcmd) --help | $(LESS)

system-install:
	pip install --no-cache-dir -v "/Users/arnau/kitchen/ustwo/proxyswitch"
