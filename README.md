### My Steamdeck Configuration

This stuff is to help me rebuild my Steamdeck environment in case something catastrophic happens.
I also don't trust Emudeck at all to leave my settings untouched, so this can be used to revert unexepected changes.

_This install however requires Emudeck_, at least for now even though several things are customized. 
Do yourself a favor and install it, a lot of stuff has been preconfigured to make your life easier.
Games go in /home/deck/Emulation/roms/ per Emudeck settings.

*I recommend not using the Emudeck ROM tool that creates shortcuts within Steam*. If you have over 50 retro games, your Steam interface will become a horrible mess and the benefit will be moot as this interface gets slow. Add these games to EmulationStation-DE and be happy. As a generic piece of advice : you should very much use EmulationStation-DE to start all your retro games as I have spent hours configuring shortcuts / launchers that work within EmulationStation-DE. The only reason to start an emulator from Desktop Mode would be to update some configuration details. Besides that, run EmulationStation-DE from Gaming Mode, enjoy the nice theme, videos and metadata, and start some games.

### Redream

Redream binary from the official website. Display artefacts on most games, unfortunate as performance is better than Flycast. Hopefully the Redream author fixes this someday. Redream is configured to look for games in `/home/deck/Emulation/roms/dreamcast`.

### SuperModel

Binary I built directly on the Deck after installing a bunch of ArchLinux libraries and packages. Will very probably fail complaining about a missing lib when run on a fresh new Steamdeck install. Eventually I will release a script that fixes everything. In the meanwhile, set a password for the deck user, disable read-only with `sudo steamos-readonly enable`, then `sudo pacman-key --init`, `ldd supermodel` to find out which libs are missing, then install them using `pacman -S <library name>`. To interact with EmulationStation, the roms should be in `/home/deck/Emulation/roms/model3/` and a symlink should be created by typing `ln -s /home/deck/Emulation/roms/model3/ /home/deck/supermodel/roms`.

### MAME

A simple MAME configuration is present, roms should be in `/home/deck/Emulation/roms/arcade/` and a nice shader is configured.

### RetroArch

The RetroArch configuration folder is moved from the flatpak original location so it can be updated with the new shaders and the new configuration. It is now in `/home/deck/.config/retroarch`, with submodules for the shaders. You're welcome to replace the shaders with other ones if you don't like the ones I have set.

Several folders in `/home/deck/.config/retroarch` are symlinks to their original locations. We want these updated by Emudeck when updates are available. In order to get RetroAchievements working, you need to replace "kwyxz" by your username in `/home/deck/.config/retroarch/` on the `cheevos_username` line and update the `cheevos_token` line (or `cheevos_password` if appropriate)

### Yuzu

I don't like AppImages so I installed the flatpak. More seriously I was having issues with command-line options with the AppImage, while the flatpack just worked. So run `flatpak install yuzu` if you plan on using Yuzu on your SteamDeck.

### EmulationStation-DE

Set the theme to "kwyxz" to enjoy my settings. My theme is based heavily on the ES-EpicNoir theme that comes with Emudeck but you don't need to have it installed for the "kwyxz" theme to work. Almost all systems have been reconfigured from the defaults and are now set in `/home/deck/.emulationstation/custom_systems/es_systems.xml`. Several systems were added to the default settings:
 - Nintendo 64DD (games in `/home/deck/Emulation/roms/64dd/`)
 - Sammy Atomiswave (games in `/home/deck/Emulation/roms/atomiswave`)
 - Capcom CPS-1 (games in `/home/deck/Emulation/roms/cps1`)
 - Capcom CPS-2 (games in `/home/deck/Emulation/roms/cps2`)
 - Capcom CPS-3 (games in `/home/deck/Emulation/roms/cps3`)
 - Sega Model 1 (games in `/home/deck/Emulation/roms/model1`)
 - Sega Model 2 (games in `/home/deck/Emulation/roms/model2`)
 - Sega Model 3 (games in `/home/deck/Emulation/roms/model3`)
 - Sega Naomi (games in `/home/deck/Emulation/roms/naomi`)

I did remove various templates I was not interested in from the original theme. So if too many things are missing for your setup, you can go back to ES-EpicNoir, no hard feelings.
The gamelists are full of pre-fetched Metadata, but you'll need to scrape the rest of the Media (boxarts, videos, etc).

### Final notes

There is absolutely zero warranty that this will work for you, but it's a good backup for me in case my SD card dies. You never know when a SD card is going to die. *Always use backups, dingdongs*.
