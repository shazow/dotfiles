update:
	sudo pacman -Syu
	pacaur -Syu

clean:
	sudo pacman -Rns $(pacman -Qtdq)

battery-max:
	sudo tlp fullcharge

battery-normal:
	sudo tlp chargeonce

NETDEVICES := ip link show | grep -v '^   ' | cut -d ':' -f2 | ip link show | grep -v '^   ' | cut -d ':' -f2
net-online:
	$(NETDEVICES) | while read d; do sudo ip link set "$$d" up; done

timezone:
    timedatectl set-timezone "$(curl -s https://timezoneapi.io/api/ip/ | jq -r .data.timezone.id)"
