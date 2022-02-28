# searchapp
 Aplikasi pencarian berdasar url dengan kembalian berupa json

Pembuatan Aplikasi
 - Membuat Model sebagai object Post untuk menerima kembalian json dari API berupa file post.dart
 - Membuat Repository untuk melakukan get post, dan get list post di post_repo.dart
 - Membuat state yang akan ada pada halaman utama di post_state.dart
 - Membuat cubit dengan method get post dan get list post di post_cubit.dart
 - Mendaftarkan Cubit di Main
 - Pembuatan Main

Alur Aplikasi
 - Setelah didaftarkan di main, ketika aplikasi jalan, langsung menuju Widget PostPage
 - kemudian Aplikasi langsung melakukan Get seluruh post
 - ![1](https://user-images.githubusercontent.com/10303178/155956843-781f5aa3-e689-4dae-9d49-bbb4e4a42102.png)
 - lalu masukan id yang ingin di cari, lalu tekan Cari, kemudian aplikasi akan melakukan get post berdasar id tersebut
 - ![2](https://user-images.githubusercontent.com/10303178/155956874-5d8d213e-7e57-41ea-8c87-d0cd58858ebc.png)
 - Tekan reset untuk melakukan get semua List Post kembali

NB:Aplikasi di buat menggunakan flutter 2.10.2, dan di jalankan menggunakan Google Chrome (dikarenakan device saya dan emulator andorid studio mengalami kendala)
