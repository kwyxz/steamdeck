#!/usr/bin/env python3

"""
find multi-disc games and create appropriate m3u folder
"""

import argparse
import os
import pathlib
import sys

def find_multi_disc(folder):
    game_list = []
    for game in os.listdir(folder):
        if (' (Disc ' or ' (Disk ') in game:
            game_list.append(game)
    return game_list

def find_separator(game):
    for separator in [' (Disc ', ' (Disk ']:
        if separator in game:
            return separator

def group_by_game(gamelist):
    game_hash = {}
    for game in gamelist:
        separator = find_separator(game)
        game_name = game.split(separator)[0]
        try:
            game_hash[game_name]
        except KeyError:
            game_hash[game_name] = [game]
        else:
            game_hash[game_name].append(game)
    return game_hash

def confirm_changes(groups):
    user_input = ''
    for k in groups:
        print(f"\nNew dir  : {ARGS.folder}/{k}.m3u")
        print(f"New file : {ARGS.folder}/{k}.m3u/{k}.m3u")
        for g in groups[k]:
            print(f"{g} => {k}.m3u/{g}")
    if groups:
        while user_input != 'Y':
            user_input = input("\nConfirm? (Y/N) ")
            if user_input == 'Y':
                return True
            elif user_input == 'N':
                print('Quitting. Goodbye!')
                return False
            else:
                print('Invalid answer, please choose Y or N: ')
    else:
        print('Nothing to do.')

def create_folders(folder):
    try:
        os.mkdir(folder)
    except FileExistsError:
        if DEBUG:
            print(f"DEBUG: folder {folder} already exists")
        else:
            return False

def move_files(game, gamefiles):
    folder = f"{ARGS.folder}/{game}.m3u"
    for file in gamefiles:
        try:
            src = f"{ARGS.folder}/{file}"
            dst = f"{ARGS.folder}/{game}.m3u/{file}"
            os.rename(src,dst)
        except FileNotFoundError:
            print(f"ERROR: folder {ARGS.folder}/{game}.m3u does not exist")

def create_m3u(m3u,listfiles):
    try:
        folder = f"{ARGS.folder}/{m3u}"
        with open(f"{folder}/{m3u}", 'w') as m3ufile:
            for gamefile in listfiles:
                m3ufile.write(f"{gamefile}\n")
    except FileNotFoundError:
        print(f"ERROR: folder {folder} does not exist")

def do_changes(groups):
    for game in groups:
        create_folders(f"{ARGS.folder}/{game}.m3u")
        move_files(game,groups[game])
        create_m3u(f"{game}.m3u",groups[game])

def main():
    game_groups = group_by_game(find_multi_disc(ARGS.folder))
    if ((DEBUG and confirm_changes(game_groups)) or (not DEBUG)):
        do_changes(game_groups)
    sys.exit(0)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        prog='make_m3u',
        description='find multi-disc games and create appropriate m3u folder')
    parser.add_argument('-d', '--debug', action='store_true')
    parser.add_argument('folder', help='path to games folder', type=pathlib.Path)
    ARGS = parser.parse_args()
    DEBUG = ARGS.debug
    main()
