#!/usr/bin/env python3

"""
find duplicates in gamelist XML files
"""

import argparse
import os
import xml.etree.ElementTree as ET
from pathlib import Path

ES_PATH=f"{str(Path.home())}/.emulationstation"
ROM_PATH=f"{str(Path.home())}/Emulation/Roms"
COUNTRY_LIST=['(USA)','(World)','(Europe)','(France)','(Japan) (En)','(Japan) [T-En', '(Japan)']

def list_dups(root):
    """list all duplicate roms for specific game"""
    dups = {}
    game_list = {}
    for game in root.findall('game'):
        name = game.find('name').text
        rom = game.find('path').text
        if (' (Disc ' or ' (Disk ') not in rom:
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

def delete_roms(roms):
    """delete the duplicate files"""
    for rom in roms:
        try:
            os.remove(f"{ROM_PATH}/{ARGS.hardware}/{rom}")
        except FileNotFoundError:
            print(f"ERROR: unable to delete {ROM_PATH}/{ARGS.hardware}/{rom}, does the file exist?")
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
    duplicates = sorted(list_dups(ROOT).items())
    delete = print_dups(duplicates)
    if ARGS.delete and len(delete) > 0:
        if confirm_delete():
            delete_roms(delete)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog='find_dup',
        description='find duplicates in emulationstation XML files')
    parser.add_argument('hardware', type=str)
    parser.add_argument('-d', '--delete', action='store_true', help='delete the duplicate files')

    ARGS = parser.parse_args()
    xmlfile = f"{ES_PATH}/gamelists/{ARGS.hardware}/gamelist.xml"
    TREE = ET.parse(xmlfile)
    ROOT = TREE.getroot()
    main()
