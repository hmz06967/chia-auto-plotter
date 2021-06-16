# chia-auto-plotter
chia madmax - hpool-plotter sıfırdan kurulum ve otomatik plotlama yapar.
açtığınız makineye config dosyasını ayarlayarak başlatın paket yoksa yükler ve devam eder.

# Auto

Plotlama yaparken Ctrl-C ile çıkış yapın ilerlemeyi göremek için tail -f $plot_file
    
    tail -f plot.log

# Config

Bu dosyanın içerisindeki komutları kendinize göre ekleyin. auto=1 komutunu eklerseniz config dosyasını otomatik okur  eklemezseniz komut ekranında size sorar (public keyler haric).

    nano otochia-plotter.cfg

Bir kez başlatmanız yeterli daha sonrasında pcount kadar kendi yazacaktır bu sırada disk depeolamanızı dikkat edin.

Önerilen: temp kalsörünün bir tanesini ram olarak 101Gib mount ederseniz [madmax plotter=1] 40dk da plot hızına ulaşma imkanı vardır.

    Fpk=""  # farming public key
    Ppk="" # pool public key
    cpu=4
    ram=3995
    disk="/disk" # temp ve plot klasörü ana yolu 
    pcount=10 # sıralı plot sayısı 
    plotter=1  #1: madmax-chia-plotter, 0: hpool-chia-plotter

    # log and path
    madmax=/root/madmax # madmax kurulacağı yer
    plot_file=$madmax/chia-plotter/build/plot.log
    up_file="/root/upload.log"

    Plot=$disk/plots/
    Temp=$disk/tempc/


# Install 

Aşağıdan linux ubuntu için yükleme adımlarını gerçekleştirin.

# Lİnux/Ubuntu

    git clone https://github.com/hmz06967/chia-auto-plotter/ && bash chia-auto-plotter/rrauto_chia.sh
    
    
