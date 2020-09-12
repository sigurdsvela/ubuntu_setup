import os
import yaml
from pathlib import Path


def slink(src, dst):
	print(f"Link {src} -> {dst}")
	Path(dst).mkdir(parent=True)
	os.system(f"ln -s {src} {dst}")

# Install packages

# - Apt
print("Installing apt packages")
aptdir = './pkg/apt.d/'
apt = os.listdir('./pkg/apt.d/')
for packyaml in apt:
	if (packyaml.startswith("_")):
		continue
	with open(aptdir + packyaml, 'r') as stream:
		apt = yaml.safe_load(stream)
		print(f"- {apt['label']}")

		if 'ckey' in apt:
			print("- - Download and add Repo key")
			if isinstance(apt['ckey'], list):
				print(f"curl -fsSL {apt['ckey'][0]} | sudo tee {apt['ckey'][1]}")
				os.system(f"curl -fsSL {apt['ckey'][0]} | sudo tee {apt['ckey'][1]}")
			else:
				print(f"curl -fsSL {apt['ckey']} | sudo apt-key add -")
				os.system(f"curl -fsSL {apt['ckey']} | sudo apt-key add -")

		if 'key' in apt:
			print("- - Add Repo key")
			os.system(f"sudo {apt['key']} | sudo apt-key add -")

		if 'repo' in apt:
			print("- - Add Repo")
			if 'ckey' in apt and isinstance(apt['ckey'], list):
				os.system(f"sudo add-apt-repository [signed-by={apt['ckey'][1]}]  {apt['repo']} -y")
			else:
				os.system(f"sudo add-apt-repository {apt['repo']} -y")

		print("- - Apt update")
		os.system("sudo apt update")

		for package in apt['packages']:
			print(f"- - Installing {package}")
			os.system(f"sudo apt install {package} -y &> ./{package}.install.log")


# - Dotfiles
print("Linking dot files")
with open('./dorfiles/map.yaml') as stream:
	fmap = yaml.safe_load(stream)
	for dst in fmap:
		src = fmap[dst]
		if (src.endswith('/*')):
			src = src[:-2] # Ends with /
			files = os.listdir('./dotfiles/' + src)
			for f in files:
				slink(f"$(pwd)/dotfiles/{src}/{f}",f"{dst}/{f}")
		else:
			slink(f"$(pwd)/dotfiles/{src}",dst)

