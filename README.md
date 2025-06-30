# Pomodoro Timer — Terminal Tabanlı Verimlilik Aracı

Bu proje, **terminalde çalışan basit ve etkili bir Pomodoro timer** sağlar.  
İşlerinize odaklanmak ve düzenli molalarla verimliliğinizi artırmak için geliştirilmiştir.  

---

## Özellikler

- **25 dakika odaklanma, 5 dakika mola** şeklinde klasik Pomodoro yöntemi  
- ASCII sanatlarıyla görsel olarak süslenmiş terminal arayüzü  
- Terminalde gerçek zamanlı geri sayım  
- Her seans sonunda toplam odaklanma süresi ve tamamlanan seans sayısı gösterimi  
- Kurulum kolaylığı için otomatik alias oluşturma scripti  
- Bash ve Zsh destekli  

---

## Kurulum

1. Depoyu klonlayın ya da dosyaları indirin:

```bash
git clone https://github.com/ahmethsnl/pomodoro-timer.git
cd pomodoro-timer
```

2. Kurulum scriptini çalıştırın:

```bash
chmod +x install_pomodoro.sh
./install_pomodoro.sh
```

> Bu işlem, `pomodoro.sh` dosyasını ev dizininize taşıyacak, gereksiz dosyaları temizleyecek ve `wpom` adında kolay çalıştırılabilir bir alias oluşturacaktır.

3. Terminali kapatıp açın ya da aşağıdaki komutu çalıştırarak alias'ı etkinleştirin:

```bash
source ~/.bashrc   # veya zsh kullanıyorsanız source ~/.zshrc
```

---

## Kullanım

Terminalde sadece şu komutu yazın:

```bash
wpom
```

Program 25 dakika odaklanma sürecini başlatacak, ardından 5 dakikalık molaya geçecek.  
Mola sonunda devam etmek isteyip istemediğiniz sorulacak.  

---

## Özelleştirme ve Geliştirme

- `pomodoro.sh` dosyasını kendi ihtiyaçlarınıza göre kolayca düzenleyebilirsiniz.  
- Süreleri değiştirebilir, bildirimleri artırabilir veya farklı ASCII sanatları ekleyebilirsiniz.  
- İsterseniz istatistikleri dosyaya kaydeden özellikler ekleyebilirsiniz.  

---

## İletişim & Destek

Proje hakkında soru, öneri veya katkı için:

- GitHub: [ahmethsnl](https://github.com/ahmethsnl)  
- 42 Slack: `ahmsanli`  

---

## Lisans

Bu proje MIT lisansı ile lisanslanmıştır. İstediğiniz gibi kullanabilir, değiştirebilir ve paylaşabilirsiniz.

---

> "Disiplin, motivasyondan daha güçlüdür."  
