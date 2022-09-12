### My Steamdeck Configuration

First of all, credits where it's due : huge kudos to the Emudeck developer. This is in no way a replacement for their work.
What this is, is a bunch of settings and customizations I apply on top of Emudeck, some of which could / will get erased during an Emudeck update, which is why I felt like I needed to save a backup copy somewhere. This is the backup copy: this stuff is to help me rebuild my tailored Steamdeck environment in case something catastrophic happens.

_Again, most of what is in this repository requires Emudeck to work_, at least for now.
Do yourself a favor and install it, a lot of stuff has been preconfigured to make your life easier: https://www.emudeck.com

Games go in /home/deck/Emulation/roms/ per Emudeck settings.

*I do not recommend using the Steam ROM tool Emudeck provides that creates shortcuts within Steam*. It is fine if you have only a handful of retro games per platform. If you have a bunch, your Steam interface will become messy and annoying to browse. Add these games to EmulationStation-DE and be happy. As a generic piece of advice : you should very much use EmulationStation-DE to start all your retro games as I have spent hours configuring shortcuts / launchers that work within EmulationStation-DE. The only reason to start an emulator from Desktop Mode would be to update some configuration details. Besides that, run EmulationStation-DE from Gaming Mode, enjoy the nice theme, videos and metadata, and start some games.

### Redream

Redream binary from the official website. I should probably replace this by a script that downloads and installs the latest version instead. Display artefacts on most games, unfortunate as performance is better than Flycast. Hopefully the Redream author fixes this someday. Redream is configured to look for games in `/home/deck/Emulation/roms/dreamcast`.

### SuperModel

Binary I built directly on the Deck after installing a bunch of ArchLinux libraries and packages. Will very probably fail complaining about a missing lib when run on a fresh new Steamdeck install. Eventually I will release a script that fixes everything. In the meanwhile, set a password for the deck user, disable read-only with `sudo steamos-readonly enable`, then `sudo pacman-key --init`, `ldd supermodel` to find out which libs are missing, then install them using `pacman -S <library name>`. To interact with EmulationStation, the roms should be in `/home/deck/Emulation/roms/model3/` and a symlink should be created by typing `ln -s /home/deck/Emulation/roms/model3/ /home/deck/supermodel/roms`.

I am considering generating a flatpak to alleviate these issues.

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

### Theme artworks

I am guilty of using a bunch of artworks I found on DeviantArt without giving artists proper credit, as I was planning on keeping this private before several people expressed interest. Before being rightfully called out, I apologize and will remediate this situation asap.

### Final notes

There is absolutely zero warranty that this will work for you, but it's a good backup for me in case my SD card dies. You never know when a SD card is going to die. *Always use backups, dingdongs*.
