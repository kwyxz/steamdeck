### My Steamdeck Configuration

First of all, credits where it's due : huge kudos to the Emudeck developer. This is in no way a replacement for their work.
What this is, is a bunch of settings and customizations I apply on top of Emudeck, some of which could / will get erased during an Emudeck update, which is why I felt like I needed to save a backup copy somewhere. This is the backup copy: this stuff is to help me rebuild my tailored Steamdeck environment in case something catastrophic happens.

_Again, most of what is in this repository requires Emudeck to work_, at least for now.
Do yourself a favor and install it, a lot of stuff has been preconfigured to make your life easier: https://www.emudeck.com

Games go in /home/deck/Emulation/roms/ per Emudeck settings. If need be, create a symlink to your roms folder.

*I do not recommend using the Steam ROM tool Emudeck provides that creates shortcuts within Steam*. It is fine if you have only a handful of retro games per platform. If you have a bunch, your Steam interface will become messy and annoying to browse. Add these games to EmulationStation-DE and be happy. As a generic piece of advice : you should very much use EmulationStation-DE to start all your retro games as I have spent hours configuring shortcuts / launchers that work within EmulationStation-DE. The only reason to start an emulator from Desktop Mode would be to update some configuration details. Besides that, run EmulationStation-DE from Gaming Mode, enjoy the nice theme, videos and metadata, and start some games.

### How do I use this repository?

Switch to Desktop mode, [download this file](https://raw.githubusercontent.com/kwyxz/steamdeck/main/scripts/kwyxz.desktop), move it to the Desktop and double-click on it (it will be called "Turbocharge Emudeck")
It will pull the whole repository, then install all the extra fancy emulators that I added because they were missing from Emudeck.

### How do I keep this repository up to date?

Double-click on the "Turbocharge Emudeck" icon on the desktop again, or manually run "update-all.sh" in the scripts directory.

### Redream

Run `./install-redream.sh` script in `/home/deck/Applications/redream` to download and install the latest version of the standalone Dreamcast emulator. If you own a paid version, copy redream.key in the same folder. Redream is much more accurate and fast than RetroArch+Flycast, however it also lacks shaders. Redream is configured to look for games in `/home/deck/Emulation/roms/dreamcast`.

### SuperModel

EmuDeck now installs a flatpak build of SuperModel, there is no need to build it from source any more.

### Duckstation

The included Flatpak was giving me trouble (just the opposite of Yuzu...) so I added a script to download the latest AppImage. The AppImage is the only binary that is supported by the author, nonetheless. So to install Duckstation and / or keep it updated, run the `./install-duckstation.sh` script in `/home/deck/Applications/duckstation`.

I updated the settings to add a 6x scaling + box downsampling which gives video a very, very nice and smooth effect, especially coupled with the CRT lottes2 shader. If you don't like it, feel free to disable all that.

### PCSX2

The AppImage gets updated more regularly than the Flatpak : a good reason to use it. Same as Duckstation, a script is included to download and install it. To install PCSX2 and / or keep it updated, run the `./install-pcsx2.sh` script in `/home/deck/Applications/pcsx2`.

### Cemu

There is now a Linux build of Cemu ! To avoid having to use Proton and enjoy your native Linux version, same as Duckstation or PCSX2, a script is included to download and install the AppImage. To install Cemu and / or keep it updated, run the `./install-cemu.sh` script in `/home/deck/Applications/cemu`.

### MAME

A simple MAME configuration is present, roms should be in `/home/deck/Emulation/roms/arcade/` and a nice shader is configured.

### RetroArch

The RetroArch configuration folder is moved from the flatpak original location so it can be updated with the new shaders and the new configuration. It is now in `/home/deck/.config/retroarch`, with submodules for the shaders. You're welcome to replace the shaders with other ones if you don't like the ones I have set.

Several folders in `/home/deck/.config/retroarch` are symlinks to their original locations. We want these updated by Emudeck when updates are available. In order to get RetroAchievements working, you need to enter your username in `/home/deck/.config/retroarch/retroarch.cfg` on the `cheevos_username` line and update the `cheevos_token` line (or `cheevos_password` if appropriate)

As the HyperSpaceMadness and Duimon shaders / artworks are in submodules, this repository needs to be cloned using the `--recursive` option (or you can install the HSM/Duimon repos manually if you prefer)

### Yuzu

Alas, Yuzu is gone. The script will pull the final version of the AppImage.

### Citra

See Yuzu above.

### EmulationStation-DE

Set the theme to "Epic Noir (kw)" to enjoy my settings. My theme is based heavily on the ES-EpicNoir theme that comes with Emudeck but you don't need to have it installed for the "Epic Noir (kw)" theme to work. Almost all systems have been reconfigured from the defaults and are now set in `/home/deck/.emulationstation/custom_systems/es_systems.xml`. Several systems were added to the default settings:
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

### Helper Scripts

In the scripts/ folder you will find some helper scripts that will assist dealing with EmulationStation and roms / media files.

The `fix-shaders-vertical.sh` script heavily uses MAME to find out what arcade games (cps1/cps2/naomi) use a vertical monitor in order to set FBNeo / Flycast and shader options appropriately. MAME doesn't need it as MAME automatically rotates the screen (and does not use the HyperSpaceMadness shaders). NOTE: newer versions of FBNeo / HSM attempt to do this rotation automatically and may cause issues.

The `probe_media.sh` script will check for corrupted media in your downloaded_media folder and log the failing ones in `probe_media.sh.log` so you know which ones you need to re-scrape.

The `make_m3u.py` script takes a folder with games as an argument and will attempt to create .m3u folders/files in order to handle multiple files as described in the [multiple game files installation manual](https://gitlab.com/es-de/emulationstation-de/-/blob/master/USERGUIDE.md#multiple-game-files-installation)

The `media_helper.py` script has several features. It can read gamelists ES-DE generates _after the scraper has been run_. It will list the games that are duplicates, allowing you to perform some cleanup and save some precious drive space. It will attempt to show you the best possible version among all available roms, from a list that is configurable by removing or reordering the countries in COUNTRY_LIST on line 14. 

If you are a french speaker and would like the french language roms to have priority above all others, replace the line with:
```
COUNTRY_LIST=['(France)','(USA)','(World)','(Europe)','(Japan) (En)','(Japan) [T-En', '(Japan)']
```

If you are an english speaker and do not want the french roms, you can remove `'(France)',` from the list and leave it as:
```
COUNTRY_LIST=['(USA)','(World)','(Europe)','(Japan) (En)','(Japan) [T-En', '(Japan)']
```

To find duplicates, run the script with the `-f` or `--find` option then the name of the hardware you are searching.
For example, to list all duplicates in Emulation/roms/snes, type:
```
scripts/media_helper.py -f snes
```

The script has the ability to delete duplicates, using the same heuristic to find the best possible rom. Run it with `-d` or `--delete` then confirm:
```
scripts/media_helper.py -d snes
```

Sometimes, the scraper fails at downloading media. To find the list of all missing media, use the `-m` or `--media` option, like this:
```
scripts/media_helper.py -m snes
```

And finally, if the scraper found duplicate roms, those might have the missing media downloaded. The script can copy over the media from the duplicate, to the rom where it's missing. In order to run the media copy, use the `-c` or `--copy` option:
```
scripts/media_helper.py -c snes
```

### Final notes

There is absolutely zero warranty that this will work for you, but it's a good backup for me in case my SD card dies. You never know when a SD card is going to die. *Always use backups, dingdongs*.

I WILL NOT PROVIDE ANY SUPPORT IF THIS REPOSITORY DOES NOT WORK FOR YOU OR WORSE, BRICKS YOUR STEAMDECK (though there is virtually no chance it would).
USE THE CONTENTS OF THIS REPOSITORY AT YOUR OWN RISKS.
But I hope it works for you though.
