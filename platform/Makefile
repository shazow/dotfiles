OS := $(shell cat /etc/*-release | grep -m1 ID= | cut -d '=' -f2)

# Default endpoint
update:

clean-docker:
	docker system prune -a --volumes

%:
ifeq ("$(OS)", "nixos")
	make -f Linux-NixOS.make $@
else ifeq ("$(OS)", "arch")
	make -f Linux-Arch.make $@
else
	@echo "Unsupported OS: $(OS)"
endif
