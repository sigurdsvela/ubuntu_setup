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
apt = os.listdir('./pkg/apt.d/')
for packyaml in apt:
	with open(packyaml, 'r') as stream:
		apt = yaml.safe_load(stream)
		print(f"- {apt['label']}")

		if 'ckey' in apt:
			if isinstance(apt['ckey'], list):
				os.system(f"curl -fsSL {apt['ckey'][0]} | sudo tee {apt['ckey'][1]} > /dev/null")
			else:
				os.system(f"curl -fsSL {apt['ckey']} | sudo apt-key add - > /dev/null")

		if 'key' in apt:
			os.system(f"sudo {apt['key']} | sudo apt-key add - > /dev/null")

		if 'repo' in apt:
			if 'ckey' in apt and isinstance(apt['ckey'], list):
				os.system(f"sudo add-apt-repository [signed-by={apt['ckey'][1]}]  {apt['repo']} > /dev/null")
			else
				os.system(f"sudo add-apt-repository {apt['repo']} > /dev/null")

		for package in apt['packages']:
			print(f"- - Installing {package}")
			os.system(f"sudo apt install {package} -y")


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

