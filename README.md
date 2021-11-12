## Dorayaki Factory Server (REST)
*Sebuah server untuk manajemen pabrik dorayaki DORAEMONANGIS*

# Skema Basis Data
1. resep = (id_resep, nama_resep) primary key (id_resep)
2. bahan_resep = (id_resep, bahan_baku, jumlah) primary key (id_resep,bahan_baku)
3. bahan_baku = (nama_bahan, stok) primary key (nama_bahan)
4. admin = (username, password, email, refresh_token) primary key (username)
5. request_toko = () --belum dibuat
6. log_request_toko = () --belum dibuat
Foreign key :
bahan_resep (id_resep) -> resep (id_resep)
bahan_resep (bahan_baku) -> bahan_baku (nama_bahan)

# Endpoints, payload, responseAPI
*apa sih ini*
POST body:{username, password} -> '/login' -> {accessToken}, cookie httponly / {msg: "Username atau password salah"}
GET header:authorization bearer; body:accessToken -> '/admins' -> {username, email}
POST body:{username, email, password, confPassword} -> '/admins' -> {msg: "Register Berhasil"} / {msg: "Password dan Confirm Password tidak cocok"}
DELETE -> '/logout' -> clear cookie & clear refresh_token
GET -> '/token' -> {accessToken}

# Pembagian Tugas
1. Basisdata
2. Authentification & Authorization
3. Request add stock manager
4. Recipe manager
5. Material manager
6. E-mail notification