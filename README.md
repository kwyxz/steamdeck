### My Steamdeck Configuration

First of all, credits where it's due : huge kudos to the Emudeck developer. This is in no way a replacement for their work.
What this is, is a bunch of settings and customizations I apply on top of Emudeck, some of which could / will get erased during an Emudeck update, which is why I felt like I needed to save a backup copy somewhere. This is the backup copy: this stuff is to help me rebuild my tailored Steamdeck environment in case something catastrophic happens.

_Again, most of what is in this repository requires Emudeck to work_, at least for now.
Do yourself a favor and install it, a lot of stuff has been preconfigured to make your life easier: https://www.emudeck.com

Games go in /home/deck/Emulation/roms/ per Emudeck settings.

*I do not recommend using the Steam ROM tool Emudeck provides that creates shortcuts within Steam*. It is fine if you have only a handful of retro games per platform. If you have a bunch, your Steam interface will become messy and annoying to browse. Add these games to EmulationStation-DE and be happy. As a generic piece of advice : you should very much use EmulationStation-DE to start all your retro games as I have spent hours configuring shortcuts / launchers that work within EmulationStation-DE. The only reason to start an emulator from Desktop Mode would be to update some configuration details. Besides that, run EmulationStation-DE from Gaming Mode, enjoy the nice theme, videos and metadata, and start some games.

### How do I use this repository?

Switch to Desktop mode, [download this file](https://raw.githubusercontent.com/kwyxz/steamdeck/main/kwyxz.desktop), move it to the Desktop and double-click on it (it will be called "Turbocharge Emudeck")
It will pull the whole repository, then install all the extra fancy emulators that I added because they were missing from Emudeck.

### How do I keep this repository up to date?

```
Double-click on the "Improve Emudeck" icon on the desktop again.
```

### Redream

Run `./install-redream.sh` script in `/home/deck/redream` to download and install the latest version of the standalone Dreamcast emulator. If you own a paid version, copy redream.key in the same folder. Currently it displays artefacts on most games, which is unfortunate as performance is better than Flycast. Hopefully the Redream author fixes this someday. Redream is configured to look for games in `/home/deck/Emulation/roms/dreamcast`.

### SuperModel

Run `./install-supermodel.sh` script in `/home/deck/supermodel` to download, build and install the latest version of the standalone Model3 emulator. *This requires sudo access, so make sure you configured a password for your user*. EmulationStation is preconfigured to use the supermodel.sh script to run games in `/home/deck/Emulation/roms/model3`

### Duckstation

The included Flatpak was giving me trouble (just the opposite of Yuzu...) so I added a script to download the latest AppImage. The AppImage is the only binary that is supported by the author, nonetheless. So to install Duckstation and / or keep it updated, run the `./install-duckstation.sh` script in `/home/deck/duckstation`.

### PCSX2

The AppImage gets updated more regularly than the Flatpak : a good reason to use it. Same as Duckstation, a script is included to download and install it. To install PCSX2 and / or keep it updated, run the `./install-pcsx2.sh` script in `/home/deck/pcsx2`.

### Cemu

There is now a Linux build of Cemu ! To avoid having to use Proton and enjoy your native Linux version, same as Duckstation or PCSX2, a script is included to download and install the AppImage. To install Cemu and / or keep it updated, run the `./install-cemu.sh` script in `/home/deck/cemu`.

### MAME

A simple MAME configuration is present, roms should be in `/home/deck/Emulation/roms/arcade/` and a nice shader is configured.

### RetroArch

The RetroArch configuration folder is moved from the flatpak original location so it can be updated with the new shaders and the new configuration. It is now in `/home/deck/.config/retroarch`, with submodules for the shaders. You're welcome to replace the shaders with other ones if you don't like the ones I have set.

Several folders in `/home/deck/.config/retroarch` are symlinks to their original locations. We want these updated by Emudeck when updates are available. In order to get RetroAchievements working, you need to enter your username in `/home/deck/.config/retroarch/retroarch.cfg` on the `cheevos_username` line and update the `cheevos_token` line (or `cheevos_password` if appropriate)

As the HyperSpaceMadness and Duimon shaders / artworks are in submodules, this repository needs to be cloned using the `--recursive` option (or you can install the HSM/Duimon repos manually if you prefer)

### Yuzu

I don't like AppImages so I installed the flatpak. More seriously I was having issues with command-line options with the AppImage, while the flatpack just worked. So run `flatpak install yuzu` if you plan on using Yuzu on your SteamDeck.

### EmulationStation-DE

Set the theme to "steamdeck" to enjoy my settings. My theme is based heavily on the ES-EpicNoir theme that comes with Emudeck but you don't need to have it installed for the "steamdeck" theme to work. Almost all systems have been reconfigured from the defaults and are now set in `/home/deck/.emulationstation/custom_systems/es_systems.xml`. Several systems were added to the default settings:
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

### Shell scripts

Most shell scripts are helpers for ES-DE, some based off scripts coming with Emudeck, some other originals.
The `fix-shaders-vertical.sh` script heavily uses MAME to find out what arcade games (cps1/cps2/naomi) use a vertical monitor in order to set FBNeo / Flycast and shader options appropriately. MAME doesn't need it as MAME automatically rotates the screen (and does not use the HyperSpaceMadness shaders).

### Theme artworks

I am guilty of using a bunch of artworks I found on DeviantArt without giving artists proper credit, as I was planning on keeping this private before several people expressed interest. Before being rightfully called out, I apologize and will remediate this situation asap.

### Final notes

There is absolutely zero warranty that this will work for you, but it's a good backup for me in case my SD card dies. You never know when a SD card is going to die. *Always use backups, dingdongs*.
