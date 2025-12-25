# Flutter REST API Integration

## Deskripsi
Aplikasi ini merupakan aplikasi Flutter sederhana yang menerapkan operasi
**CRUD (Create, Read, Update, Delete)** dengan integrasi **RESTful API**
menggunakan **Node.js (Express)** sebagai backend.

Aplikasi ini dibuat untuk memenuhi tugas mata kuliah **Integrasi RESTful API dengan Flutter**.

---

## Teknologi yang Digunakan
- Flutter
- Dart
- Node.js
- Express.js
- HTTP Package (Flutter)

---

## Arsitektur Sistem
- **Frontend**: Flutter
- **Backend**: REST API (Node.js + Express)
- **Komunikasi Data**: HTTP (JSON)

---

## Konfigurasi API (Penting)

Karena backend dijalankan secara lokal, maka:
- `localhost` **tidak dapat digunakan** pada perangkat Android fisik
- Harus menggunakan **IP Address laptop/PC**

### Contoh Konfigurasi
File:
# Flutter REST API Integration

## Deskripsi
Aplikasi ini merupakan aplikasi Flutter sederhana yang menerapkan operasi
**CRUD (Create, Read, Update, Delete)** dengan integrasi **RESTful API**
menggunakan **Node.js (Express)** sebagai backend.

Aplikasi ini dibuat untuk memenuhi tugas mata kuliah **Integrasi RESTful API dengan Flutter**.

---

## Teknologi yang Digunakan
- Flutter
- Dart
- Node.js
- Express.js
- HTTP Package (Flutter)

---

## Arsitektur Sistem
- **Frontend**: Flutter
- **Backend**: REST API (Node.js + Express)
- **Komunikasi Data**: HTTP (JSON)

---

## Konfigurasi API (Penting)

Karena backend dijalankan secara lokal, maka:
- `localhost` **tidak dapat digunakan** pada perangkat Android fisik
- Harus menggunakan **IP Address laptop/PC**

### Contoh Konfigurasi
File:
lib/services/api_service.dart
static const String baseUrl = 'http://<IP_LAPTOP>:3000/users';


1. Menjalankan Backend

    node index.js

Server akan berjalan pada: http://localhost:3000

2. Menjalankan Aplikasi Flutter
    flutter pub get
    flutter run