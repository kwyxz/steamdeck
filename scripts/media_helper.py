#!/usr/bin/env python3

"""
find and merge missing media between rom duplicates
run this before purging duplicates for best results
"""

import argparse
import os
import shutil
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

ES_PATH=f"{str(Path.home())}/.emulationstation"
DL_MEDIA_PATH=f"{str(Path.home())}/Emulation/tools/downloaded_media"
ROM_PATH=f"{str(Path.home())}/Roms"
COUNTRY_LIST=['(USA','USA)','(World','World)','(Europe','Europe)','(France','France)','(Japan) (En)','(Japan) [T-En','(T-En','(Japan', 'Japan)']

def die(message):
    print(f"ERROR: {message}")
    sys.exit(1)

def find_missing(root,mediapath):
    """find missing media"""
    games = {}
    missing = {}
    for game in root.findall('game'):
        rom = Path(game.find('path').text).stem
        games[rom] = {}
        for file in os.scandir(mediapath):
            fold = file.name
            games[rom][fold] = False
            if fold == 'videos':
                media_format = ['mp4','flv','mkv']
            else:
                media_format = ['png','jpg']
            for mform in media_format:
                if os.path.exists(f"{mediapath}/{fold}/{rom}.{mform}"):
                    games[rom][fold] = True
    for game,folders in games.items():
        for missm in folders:
            if not folders[missm]:
                missing[game] = games[game]
    return missing

def list_dups(root):
    """list all duplicate roms for specific game"""
    dups = {}
    game_list = {}
    for game in root.findall('game'):
        name = game.find('name').text
        rom = game.find('path').text
        absrom =  ROM_PATH + '/' + ARGS.hardware + '/' + rom
        if ((' (Disc ' or ' (Disk ') not in rom) and (os.path.exists(absrom)):
            if name in game_list:
                if name in dups:
                    dups[name].append(rom)
                else:
                    dups[name] = [game_list[name],rom]
            else:
                game_list[name] = rom
    return dups

def find_best(roms,countries):
    """find the best potential rom for specific game"""
    for country in countries:
        for rom in roms:
            if country in rom:
                return rom
    return False

def print_dups(dups):
    """print the names of the duplicates"""
    to_delete = []
    for gamename, romnames in dups:
        print(f"=*=*= {gamename} =*=*=")
        best = find_best(romnames,COUNTRY_LIST)
        for rom in romnames:
            if best and (rom == best):
                print(f"\033[92m{best.split('/')[1]}\033[0m")
            else:
                print(f"\033[91m{rom.split('/')[1]}\033[0m")
                to_delete.append(rom.split('/')[1])
    return to_delete

def display_missing(missing):
    """display missing media per rom"""
    for game in missing:
        print(f"=*=*= {game} =*=*=")
        for miss in missing[game]:
            if not missing[game][miss]:
                print(miss)

def copy_files(rom_missing,missing_media,dups_array,mediapath):
    """actually copy missing media from duplicate"""
    for rom in dups_array:
        baserom = Path(rom).stem
        if missing_media == 'videos':
            media_format = ['mp4','flv','mkv']
        else:
            media_format = ['png','jpg']
        for mform in media_format:
            existing = f"{mediapath}/{missing_media}/{baserom}.{mform}"
            missing = f"{mediapath}/{missing_media}/{rom_missing}.{mform}"
            if os.path.exists(existing) and not os.path.exists(missing):
                print(f"Copying {existing} to {missing}")
                shutil.copyfile(existing,missing)

def copy_media(missing,dups,mediapath):
    """merge media from duplicates, if available"""
    for game in dups:
        for rom in dups[game]:
            baserom = Path(rom).stem
            for missing_media in missing:
                if baserom == missing_media:
                    for miss in missing[missing_media]:
                        if not missing[missing_media][miss]:
                            copy_files(baserom,miss,dups[game],mediapath)

def delete_roms(roms):
    """delete the duplicate files"""
    for rom in roms:
        try:
            os.remove(f"{ROM_PATH}/{ARGS.hardware}/{rom}")
        except IsADirectoryError:
            try:
                shutil.rmtree(f"{ROM_PATH}/{ARGS.hardware}/{rom}")
            except FileNotFoundError:
                die(f"unable to delete {ROM_PATH}/{ARGS.hardware}/{rom}, does the file exist?")
        else:
            print(f"SUCCESS: deleted {ROM_PATH}/{ARGS.hardware}/{rom}")

def confirm_delete():
    """confirm before deleting"""
    user_input = ''
    print("\nThe files highlighted in red above will be deleted.")
    while user_input != 'Y':
        user_input = input("Confirm? (Y/N) ")
        if user_input == 'Y':
            return True
        if user_input == 'N':
            print('Quitting. Goodbye!')
            return False
        print('Invalid answer, please choose Y or N: ')

def main():
    """main loop"""
    missing = find_missing(ROOT,MEDIA_PATH)
    duplicates = list_dups(ROOT)
    if ARGS.find:
        print_dups(sorted(duplicates.items()))
    elif ARGS.delete:
        to_delete = print_dups(sorted(duplicates.items()))
        if len(to_delete)>0:
            if confirm_delete():
                delete_roms(to_delete)
    elif ARGS.media:
        display_missing(missing)
    elif ARGS.copy:
        copy_media(missing,duplicates,MEDIA_PATH)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog='media_helper',
        description='find missing media and attempt to merge it from duplicates')
    parser.add_argument('hardware', type=str)
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument('-f', '--find', action='store_true', help='find duplicate files')
    group.add_argument('-d', '--delete', action='store_true', help='delete the duplicate files')
    group.add_argument('-m', '--media', action='store_true', help='find the missing media files')
    group.add_argument('-c', '--copy', action='store_true', help='merge the media files')

    ARGS = parser.parse_args()
    XMLFILE = f"{ES_PATH}/gamelists/{ARGS.hardware}/gamelist.xml"
    MEDIA_PATH = f"{DL_MEDIA_PATH}/{ARGS.hardware}/"
    try:
        TREE = ET.parse(XMLFILE)
    except FileNotFoundError:
        die(f"XML file {XMLFILE} not found")
    ROOT = TREE.getroot()
    main()
    sys.exit(0)
