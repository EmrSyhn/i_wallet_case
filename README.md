# I Wallet Case

Bu proje, bir iş mülakatı sonucunda oluşturulan bir uygulama örneğidir.

## Proje Amacı ve Kapsamı

Bu proje, kullanıcıların çevrimiçi kullanıcıları aramalarına ve ayrıntılı bilgilerini görüntülemelerine olanak tanır. Temel amacı, HTTP istekleriyle veri alışverişi yapmayı öğrenmek ve Flutter kullanarak kullanıcı arayüzü geliştirmektir.

## Özellikler

1. **Kullanıcı Listesi Çekme**: Kullanıcılar [JSONPlaceholder](https://jsonplaceholder.typicode.com/users) adresinden HTTP isteği ile çekilir.

2. **Kullanıcı Ara**: "Kullanıcı Ara" alanına girilen karakterlere göre kullanıcılar, kullanıcı adlarına göre filtrelenir ve gösterilir.

3. **Kullanıcı Bulunamadı**: Eğer arama sonucunda hiçbir kullanıcı bulunmazsa, ekrana "Kullanıcı Bulunamadı!" mesajı görüntülenir.

4. **Tüm Kullanıcıları Gösterme**: "Kullanıcı Ara" alanındaki karakterler tamamen silindiğinde veya kullanıcı tarafından sağlanan bir butona basıldığında, tüm kullanıcılar tekrar listelenir.

5. **Kullanıcı Resimleri**: Kullanıcıların resimleri, her kullanıcının "id" alanına göre [picsum.photos/id/{id}/info](https://picsum.photos/id/{id}/info) adresinden çekilir.

6. **Kullanıcı Detayları**: Kullanıcı listesindeki herhangi bir kullanıcıya tıkladığınızda, o kullanıcıya ait detaylar içeren bir popup penceresi açılır.

## Kurulum

Proje yerel ortamınıza kurulum yapmak için aşağıdaki adımları takip edin:

1. Bu projeyi klonlayın: `git clone https://github.com/EmrSyhn/i_wallet_case.git`
2. Proje dizinine gidin: `cd i_wallet_case`
3. Gerekli paketleri yükleyin: `flutter pub get`
4. Uygulamayı çalıştırın: `flutter run`

## Kullanım

Proje çalıştırıldığında, kullanıcılar otomatik olarak JSONPlaceholder API'sinden alınır. "Kullanıcı Ara" alanına karakterler girdiğinizde, sonuçlar anlık olarak güncellenir. Kullanıcılar üzerine tıkladığınızda, ayrıntılı bilgileri içeren bir popup penceresi görüntülenir. Arama sonuçları boşsa veya tüm kullanıcıları göstermek istiyorsanız, "Kullanıcı Ara" alanını temizleyen bir buton bulunur.



## Ek Bilgiler

* Uygulama, Flutter ile Dart programlama dilinde yazılmıştır.
* Uygulama, Android ve iOS platformlarında çalışmaktadır.
* Uygulama, Material Design tasarım dilini kullanmaktadır.

## Geliştirici

Emir Seyhan
