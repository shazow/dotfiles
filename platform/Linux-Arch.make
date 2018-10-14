update:
	sudo pacman -Syu
	pacaur -Syu

clean:
	sudo pacman -Rns $(pacman -Qtdq)

battery-max:
	sudo tlp fullcharge

battery-normal:
	sudo tlp chargeonce

NETDEVICES := ip link show | grep -v '^   ' | cut -d ':' -f2 | grep -v 'lo'
net-online:
	$(NETDEVICES) | while read d; do sudo ip link set "$$d" up; done

net-offline:
	$(NETDEVICES) | while read d; do sudo ip link set "$$d" down; done

timezone:
	@echo "Updating time: $(shell date +"%r %Z")"
	timedatectl set-timezone "$(shell curl -s https://ipapi.co/timezone/)"
	#curl -s https://timezoneapi.io/api/ip/ | jq -r .data.timezone.id | xargs timedatectl set-timezone
	@echo "New time: $(shell date +"%r %Z")"

bluetooth:
	# This is mostly handled by bluemon
	echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/bluetooth_enable
	sudo rfkill unblock bluetooth
	systemctl start bluetooth
	pacmd set-card-profile $(pacmd list-sinks | sed -n "s/card: \\([0-9]*\\) <bluez.*/\\1/p" | xargs) a2dp_sink
