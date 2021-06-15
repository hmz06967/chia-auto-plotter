# chia-auto-plotter
chia madmax - hpool-plotter  auto plotter

# Config

##Bu dosyanın içerisindeki komutları kendinize göre ekleyin. auto=1 komutunu eklerseniz config dosyasını otomatik okur (public keyler haric) eklemezseniz komut ekranında size sorar.

Bir kez başlatmanız yeterli daha sonrasında pcount kadar kendi yazacaktır bu sırada disk depeolamanızı dikkat edin.

Önerilen: temp kalsörünün bir tanesini ram olarak 101Gib mount ederseniz [madmax plotter=1] 40dk da plot hızına ulaşma imkanı vardır.

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
