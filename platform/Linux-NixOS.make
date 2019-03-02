update: sync
	sudo nixos-rebuild switch --upgrade
	home-manager switch
	flatpak update --appstream && flatpak update

outdated: sync
	sudo nixos-rebuild dry-build --upgrade

sync:
	sudo nix-channel --update
	nix-channel --update

clean:
	sudo nix-collect-garbage --delete-older-than 7d
	home-manager expire-generations "-7 days"

battery:
	sudo powertop --auto-tune
	pulseaudio -k
