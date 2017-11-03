@echo off
dism /online /get-features > feature_list.txt
dism /online /get-package > package_list.txt
