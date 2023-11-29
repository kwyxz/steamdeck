#!/usr/bin/env python3

"""
find duplicates in gamelist XML files
"""

import argparse
import xml.etree.ElementTree as ET

COUNTRY_LIST=['(USA)','(World)','(Europe)','(France)','(Japan) (En)','(Japan) [T-En']

def list_dups(root):
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
    for country in countries:
        for rom in roms:
            if country in rom:
                return rom
    return False

def print_dups(dups):
    for gamename, romnames in dups:
        print(f"=== GAME : {gamename}")
        best = find_best(romnames,COUNTRY_LIST)
        for rom in romnames:
            if best and (rom == best):
                print(f"\033[92m{best.split('/')[1]}\033[0m")
            else:
                print(rom.split('/')[1])

def main():
    duplicates = sorted(list_dups(ROOT).items())
    print_dups(duplicates)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog='find_dup',
        description='find duplicates in emulationstation XML files')
    parser.add_argument('xmlfile', type=argparse.FileType('r'))

    ARGS = parser.parse_args()
    TREE = ET.parse(ARGS.xmlfile)
    ROOT = TREE.getroot()
    main()
