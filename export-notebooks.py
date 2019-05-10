#!/usr/bin/env python
# coding=utf-8

from argparse import ArgumentParser
from subprocess import run

"""
OneNote2PDF seems to fail when I call it from Python, so I'll stop development of this script for now. :(
"""

DIRECTORY = "C:/sync/physics/6_Part_iii/Courses"
TEMP = "C:/Programs/OneNote2PDF_0.3/temp"
EXE = "C:/Programs/OneNote2PDF_0.3/OneNote2PDF.exe"


def get_user_input(args, group):
    defaults = {
        "courses": ["C", "GR", "QFT", "SFT", "SFP", "AQFT", "BH", "SM", "ST", "SUSY", "CQS"],
        "sections": ["Lectures_1", "Lectures_2", "Examples_1", "Examples_2", "Examples_class", "Past_papers"]}
    groups = input(f"Which {group}?") if args[group] is None else args[group]
    group_list = [thing for thing in groups.split()]
    return defaults[group] if (not group_list or group_list == ["all"]) else group_list


def main():
    parser = ArgumentParser()
    parser.add_argument("-c", "--courses", type=str, default=None, help="Which course(s)?")
    parser.add_argument("-s", "--sections", type=str, default=None, help="Which section(s)?")
    args = vars(parser.parse_args())

    courses = [course.upper() for course in get_user_input(args, "courses")]
    sections = [section.capitalize() for section in get_user_input(args, "sections")]

    for course in courses:
        for section in sections:
            print(" ".join([EXE, "-Notebook", course, "-CacheFolder", TEMP, "-Output", f"{DIRECTORY}/{course}/Exports",
                            "-Exclude", "OneNote_RecycleBin", "-ExportSection", f"{course}_{section}"]))
            run([EXE, "-Notebook", course, "-CacheFolder", TEMP, "-Output", f"{DIRECTORY}/{course}/Exports", "-Exclude",
                 "OneNote_RecycleBin", "-ExportSection", f"{course}_{section}"], shell=True)


if __name__ == "__main__":
    main()
