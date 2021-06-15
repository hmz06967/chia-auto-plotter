# chia-auto-plotter
chia madmax - hpool-plotter  auto plotter

# Config

####Bu dosyanın içerisindeki komutları kendinize göre ekleyin. auto=1 komutunu eklerseniz config dosyasını otomatik okur (public keyler haric) eklemezseniz komut ekranında size sorar.

    Fpk=""  
    Ppk=""
    cpu=4
    disk="/disk" # temp ve plot klasörü ana yolu 
    ram=3995
    pcount=10 # sıralı plot sayısı 
    plot_file="/root/plot.log"
    up_file="/root/upload.log"
    plotter=1  #1: madmax-chia-plotter, 0: hpool-chia-plotter


# Install 

Aşağıdan linux ubuntu için yükleme adımlarını gerçekleştirin.

# Lİnux/Ubuntu

git clone https://github.com/hmz06967/chia-auto-plotter/ | bash rrauto_chia.sh
