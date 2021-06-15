#!/bin/bash
echo "Author: @ehmzkan by hpool plotter tool v1.1.0" 

#sudo sudo apt install rpm -y &&
#sudo apt-get install openssh-client -y &&  
# sudo apt-get install unzip -y &&

cfg_fpath='otochia-plotter.cfg'

# [CONFIG]
if ! [ -f $cfg_fpath ]; then
	echo "[error] $cfg_fpath config dosyası yok.."
	exit
fi

source $cfg_fpath
Plot="${disk}/plots/"
Temp="${disk}/tempc/" 
	
# [FUNCTION]
	# install
install(){
	sudo apt-get update &&
	echo 'Klasörler oluşturuluyor.' 
	sudo mkdir $Temp $Plot &&
	sudo chmod +rwx $Temp &&
	sudo chmod +rwx $Plot 
}

hpool_plotter_install(){
	echo 'Hpool chia-plotter indiriliyor..\n' &&
    wget https://github.com/hpool-dev/chia-plotter/releases/download/v0.11/chia-plotter-v0.11-x86_64-linux-gnu.zip && 
	unzip chia-plotter-v0.11-x86_64-linux-gnu.zip &&
	rm "chia-plotter-v0.11-x86_64-linux-gnu"* &&
	echo 'hpool plotter kuruldu.'	
}

madmax_plotter_install(){
	mkdir /root/madmax &&
	cd madmax &&

	sudo apt install -y libsodium-dev cmake g++ git &&
	# Checkout the source and install
	git clone https://github.com/madMAx43v3r/chia-plotter.git  &&
	cd chia-plotter &&

	git submodule update --init &&
	./make_devel.sh &&
	echo 'madmax plotter kuruldu.'
}

start_config(){

	if [ -z "$auto" ];
	  then
		echo -n "Disk yolu($disk): ";
		read diskk
		if ! [ -z "$diskk" ]; then
			disk=$diskk
		fi
		
		echo -n "Cpu($cpu): ";
		read cpuu
		if ! [ -z "$cpuu" ]; then
			cpu=$cpuu
		fi
		
		echo -n "Ram($ram): ";
		read rams
		if ! [ -z "$rams" ]; then
			ram=$rams
		fi
		
		echo -n "Pcount($pcount): ";
		read pcounts 
		if ! [ -z "$pcounts" ]; then 
			pcount=$pcounts 
		fi

		echo -n "Kazıcı: (0:hpool, 1:madmax)";
		read plotters
		if ! [ -z "$plotters" ]; then
			plotter=$plotters
		fi	
	fi
		

	echo "Dik yolu: $Plot"
	echo "Dik yolu: $Temp"
	echo "Ram: $ram"
	echo "Cpu: $cpu"
	echo "Ppu: $pcount"

}

start_madmax(){
	start_config
	echo "[madmax kazıcı] start"
	nohup $mplotter -n $pcount -r $cpu -u 7 -t $Temp -2 $Temp -d $Plot -p $Ppk -f $Fpk &> /root/plot.log &
}

start_hpool(){
	start_config
	echo "[hpool kazıcı] start"
	sudo nohup $hplotter -action plotting -plotting-fpk $Fpk -plotting-ppk $Ppk -b $ram -r $cpu -d $Plot -t $Temp -plotting-n $pcount -p > $plot_file &
}
 
start_plot(){
	echo 'Program başlıyor..' 
	hplotter="/root/chia-plotter/chia-plotter-linux-amd64"
	mplotter="/root/madmax/chia-plotter/build/chia_plot"
	if [ $plotter = 0 ]; then #hpool kazıcı
		echo "[hpool kazıcı] start"
		if  [ -f $hplotter ]; then
			start_hpool
		else
			echo "[hpool kazıcı] yükleniyor" 
			install 
			hpool_plotter_install
			start_hpool
		fi
	fi
	if [ $plotter = 1 ]; then #madmax kazıcı 
		if  [ -f $mplotter ]; then
			start_madmax
		else
			echo "[madmax kazıcı] yükleniyor" 
			install 
			madmax_plotter_install
			start_madmax
		fi
	fi
	
}


# [PROGRAM]

start_plot 
tail -f plot.log 
