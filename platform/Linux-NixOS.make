update:
	sudo nixos-rebuild switch --upgrade
	flatpak update --appstream && flatpak update

clean:
	#nix-collect-garbage
	nix-env --delete-generations +5
