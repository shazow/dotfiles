update:
	sudo pacman -Syu
	pacaur -Syu

clean:
	sudo pacman -Rns $(pacman -Qtdq)
