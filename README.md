# dot
一、分区及安装基本系统

1、Cfdisk  

  mkfs.ext4 /dev/sda9    boot    100m

  mkfs.ext4 /dev/sda10   /

  mkfs.ext4 /dev/sda11   home   

  mkswap /dev/sda12    

  swapon /dev/sda12    

2、mount /dev/sda10 /mnt    

  mkdir /mnt/boot && mount /dev/sda9 /mnt/boot

  mkdir /mnt/home && mount /dev/sda11 /mnt/home   

3、vi /etc/pacman.d/mirrorlist

4、dhcpcd   

5、pacstrap /mnt base base-devel
也可以pacstrap /mnt bash coreutils file filesystem grub2 linux pacman procps-ng syslog-ng glibc systemd-sysvcompat shawd dhcpcd vi

6、  genfstab -p /mnt >>/mnt/etc/fstab

7、  arch-chroot /mnt

二、对新的基本系统进行设置
1、  vi /etc/hostname
     echo aaa >/etc/hostname  

2、  vi /etc/timezone
     写入时区：Asia/Shanghai    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

3、  vi /etc/locale.conf
        LANG=en_US.UTF-8

4、vi /etc/locale.gen

5、locale-gen

6、 hwclock --systohc --utc

7、双系统
  
  pacman -S grub-bios　　
  
  grub-install --recheck  /dev/sda　　
  
  pacman -S os-prober ：检测其他操作系统，这里是win7　　
  
  grub-mkconfig -o /boot/grub/grub.cfg
   
 单系统      
   pacman -S grub-bios
   
   grub-install /dev/sda
   
   grub-mkconfig -o /boot/grub/grub.cfg

8、 mkinitcpio -p linux

9、  passwd

10、 systemctl enable dhcpcd@.service

11、exit

12、umount /mnt/{boot,home,}   

13、reboot        

14、pacman -Syu

15、pacman -S  xorg-server xorg-xinit lightdm i3 lxterminal wqy-zenhei xf86-video-intel   mesa   gvfs gvfs-mtp  vim git zsh alsamixer volumeicon xorg-xrandr

16、  useradd -m 新用户
      passwd 新用户
      usermod –a –G video,audio,lp,log,wheel,optical,scanner,games,users,storage,power 新用户

17、 一些必备的软件 firefox firefox-i18n-zh-cn flashplugin pcmanfm pulseaudio-alsa gpicview wqy-microhei ttf-arphic-ukai ttf-arphic-uming file-roller unrar zip unzip p7zip  feh lxappearance  ntfs-3g fcitx termite  yaourt

18、  ttf-font-awesome ttf-font-icons (i3-gaps 状态栏显示图标）
19、　la-capitaine-icon-theme arc-gtk-theme
