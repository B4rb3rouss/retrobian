# Retrobian (fr)
Retrobian est une debian permettant de transformer son ordinateur en
station d'émulation pour les anciennes consoles (playstation 1,
megadrive, nes, snes...).

C'est un système "live" ([live-build](http://live.debian.net/)), qui
peut toutefois être ensuite installé. 

Vous pouvez fabriquer vous-même votre système afin de le préparer pour
l'architecture désirée.

Afin de ne pas avoir besoin de clavier mais seulement d'une manette,
sont utilisés : 

- [EmulationStation](http://emulationstation.org)
- [RetroArch](https://github.com/Themaister/RetroArch)

## Utiliser retrobian
Gravez binary.hybrid.iso sur un cd ou mettez-le sur une clé usb : 

    dd if=retrobian.iso of=/dev/sdX

Remplacez /dev/sdX par votre clé usb (`fdsik -l` vous indiquera à quoi
correspond votre clé)

## Fabriquer sa version de retrobian
Afin de l'adapter à l'architecture souhaitée, ou simplement modifier
retrobian, vous pouvez télécharger les sources.

    git clone https://github.com/Ikse/retrobian.git
    cd retrobian

Vous aurez besoin des paquets live-build et live-tools : 

    apt-get install live-build live-tools

Dans le répertoire des sources, lancez : 

        $ lb config
        # lb build

Cela créera le fichier binary.hybrid.iso à utiliser ensuite.

## Important
Retrobian va chercher vos roms dans le dossier ~/roms. Il suppose que
ces roms sont classées par noms de console, par exemple ~/roms/gb,
~/roms/snes, ~/roms/megadrive...
Cela est prévu pour coller avec la configuration d'emulationstation qui
peut être modifiée dans le fichier ~/.emulationstation/es_systems.cfg.
Un script est lancé au démarrage pour vous aider à monter un éventuel
disque/clé usb contenant les roms et faire les liens appropriés.

## FAQ

- Pourquoi recontruire retrobian? Pour pouvoir l'installer sur n'importe
  quelle architecture supportée par debian.
- Comment ajouter les roms des jeux? Placez-les dans le dossier `roms`
  situé dans le dossier de l'utilisateur (home). Vouspouvez aussi
  utiliser des liens relatifs si ces roms sont placée sur un support
  externe.
- Où mettre les fichiers bios? Dans le dossier `roms` aussi. Vous pouvez
  les mettre ailleurs, mais il faudra dans ce cas adapter la ligne
  `system_directory` dans la configuration de retroarch (fichier
  `~/.config/retroarch/retroarch.cfg`)
- Comment configurer retroarch par console? Pour modifier les boutons ou
  autres options pour une console à la fois, modifier le fichier situé
  dans `~/.config/retroarch/$CONSOLE_NAME/retroarch.cfg`.
- Comment quitter un jeu sans le clavier? : Appuyez en même temps sur Select + Start (voir `input_enable_hotkey_btn` dans le retroarch.cfg)
- Comment charger/sauver? : appuyez sur Select + R1 ou Select + L1


## Aperçus : 
![boot menu](/Images/boot_menu.png)

# Retrobian (en)
Just a debian-based distro to turn your computer into an emulation station. you can install it on any architecture thanks to [live-build](http://live.debian.net/).

For now, it comes with : 

- [EmulationStation](http://emulationstation.org)
- [RetroArch](https://github.com/Themaister/RetroArch)

## Use retrobian
Burn retrobian.iso on a cd, or copy it on a usb drive : 

    dd if=retrobian.iso of=/dev/sdX

where sdX is yous usb stick.

## Build your own distro

Download the sources.

    git clone https://github.com/Ikse/retrobian.git
    cd retrobian

Install the package live-build and live-tools : 

    apt-get install live-build live-tools

In the source directory, run : 

        $ lb config
        # lb build

It will create binary.hybrid.iso to burn then.

Then, you have an iso to burn or copy on a usb drive. So, you can test
the distro, but you can also install the system if you choose the
installer instead of the live system.

## Important
retrobian is configured to look for your roms in ~/roms/CONSOLE_NAME
where CONSOLE_NAME can be snes, nes, psx, gb... CONSOLE_NAME is a
directory containing roms.
These path are configured for emulationstation, that you can change in
~/.emulationstation/es_systems.cfg.

## FAQ

- Why do I have to build retrobian? Because this way, you can install it
  on any architecture supported by debian.
- How to add roms : just put them in the `roms` folder in home. You can also use symlinks if you prefer.
- I need bios files : pour bios files in the `roms` folder. Note that you can put bios files somewhere else, but you have to change `system_directory` in the file retroarch.cfg.
- How can I configure retroarch for one console only? You can change retroarch config if you create a new `retroarch.cfg` file in `~/.config/retroarch/$CONSOLE_NAME/retroarch.cfg`.
- How can I exit a game without keyboard : Simply press Select + Start
- How to load/save state? : press Select + R1 of Select + L1

## Screenshot : 
![boot menu](/Images/boot_menu.png)
