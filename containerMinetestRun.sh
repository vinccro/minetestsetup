#!/bin/bash

#Ubuntu 16.04 
apt update
apt upgrade -y
#ncurses dev lib for ubuntu
apt install -y libncurses-dev
apt install -y g++ make libc6-dev libirrlicht-dev cmake libbz2-dev libpng-dev libjpeg-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-gnutls-dev libfreetype6-dev zlib1g-dev libgmp-dev libjsoncpp-dev
apt install -y git



git clone --depth 1 https://github.com/minetest/minetest.git
cd minetest
git clone --depth 1 https://github.com/minetest/minetest_game.git games/minetest_game
cmake . -DRUN_IN_PLACE=TRUE
#cmake . -BUILD_SERVER=TRUE -ENABLE_CURSES=ON -DBUILD_CLIENT=FALSE -DIRRLICHT_SOURCE_DIR=/the/irrlicht/source
make -j$(nproc)

#make minetest.conf file  
cp minetest.conf.example minetest.conf
#configuration of minetest.conf
sed -i 's/# name =/name = admin/' minetest.conf
#sed -i 's/# ser/name = admin/' minetest.conf
#sed -i 's/# name =/name = admin/' minetest.conf

./bin/minetest --server &
sleep 8
killall -9 minetest
#mods install
cd ./mods
git clone https://github.com/minetest-mods/nether.git
#echo "load_mod_nether = true" >> ../worlds/world/world.mt

git clone https://github.com/Sokomine/travelnet.git
#echo "load_mod_travelnet = true" >> ../worlds/world/world.mt

git clone https://github.com/minetest-mods/intllib.git
#echo "load_mod_intllib = true" >> ../worlds/world/world.mt

git clone https://github.com/minetest-mods/moreblocks.git
#echo "load_mod_moreblocks = true" >> ../worlds/world/world.mt

git clone https://notabug.org/TenPlus1/lucky_block.git
#echo "load_mod_lucky_block = true" >> ../worlds/world/world.mt

git clone https://github.com/raymoo/cmi.git
#echo "load_mod_cmi = true" >> ../worlds/world/world.mt

git clone https://notabug.org/TenPlus1/invisibility.git
#echo "load_mod_invisibility = true" >> ../worlds/world/world.mt

git clone https://notabug.org/TenPlus1/mobs_redo.git
#echo "load_mod_mobs = true" >> ../worlds/world/world.mt

#git clone https://github.com/lisacvuk/minetest-toolranks.git
#echo "load_mod_minetest-toolranks = true" >> ../worlds/world/world.mt

git clone https://github.com/starninjas/xocean.git
#echo "load_mod_xocean = true" >> ../worlds/world/world.mt

git clone https://notabug.org/TenPlus1/mobs_monster.git
#echo "load_mod_mobs_monster = true" >> ../worlds/world/world.mt

git clone https://github.com/minetest-mods/zombies.git
#echo "load_mod_zombies = true" >> ../worlds/world/world.mt

git clone https://github.com/stujones11/minetest-3d_armor.git

git clone https://github.com/NPXcoot/nssm.git

cd ..
rm CPackConfig.cmake
rm -r build
rm CPackSourceConfig.cmake
rm Makefile 
rm src
rm -r cmake
rm cmake_install.cmake


#apt remove -y make
#apt remove -y cmake
#apt remove -y g++
#apt remove -y git

exit

