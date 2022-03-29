# Escoring
Aplikasi penilaian paskib v2 <br>
Digunakan untuk penilaian lomba paskibra di SMAN 3 Jombang. <br>

<hr>

## Requirment
- PHP 7.3 or latest
- Composer
- MySql

## How To Run
insede folder imlucky
- Create database imlucky then import `database_contoh.sql` or `database_kosong.sql`
- Copy `.env.example` into `.env`
- Open cmd / terminal and run `php arisan serve`
- Open `http://127.0.0.1:8000` or another port you are using

## Words to know
- `Kategori` : Category competition <br> 
  it's have one or many Sub Kategori.
- `Sub Kategori` : Sub Category competition <br>
  it's have one or many Sub2 Kategori and it's has scores where are Juri can rate.
- `Sub2 Kategori` : Sub2 Category <br>
   it's the point judged by the jury
- `Juri` : Jury / Scorer in the competition <br>
  it's can assigned to Group Kategori <br>
- `Group Kategori` : it's grouping Kategori and Juri where are admin can generate List Form Penilaian
- `List Form Penilaian` : rating list
- `Peleton` : Contestants
- `Pinalti` : Deduction due to Peleton error
- `Ballot` : Extra scores
- `Sortasi` : list of competition winners

## Access Role
- Admin
    - CRUD Kategori, Sub Kategori, Sub2 Kategori
    - CRUD Juri
    - CRUD Group Juri
    - CRUD Peleton (its can import from excel)
    - CRUD Generate List Form Penilaian
    - Change jury rating
    - Give Pinalti into Peleton 
    - Print out Peleton scores
    - Print out Sortasi
- Juri
    - Give rates / scores into Peleton

## Attachment
- <a href="./Database.jpg">Database Schema</a>
- <a href="./network.vsdx">Network Setup (Ms Visio)</a>
- <a href="./lrs diagram.vsdx">ERD (Ms Visio)</a>

## Screenshots
- Admin Dashboard
  ![image](https://user-images.githubusercontent.com/39044004/160555032-dd3047d6-aee6-4d70-bd7b-a6508978f8d8.png)
- Kategori Page
  ![image](https://user-images.githubusercontent.com/39044004/160567188-ee789280-da66-46b8-bee3-a019d4fc4b71.png)
- Sortasi Page
  ![image](https://user-images.githubusercontent.com/39044004/160567334-ee3c8819-bba3-4b44-8f93-0c287634f96b.png)
- Juri judging page
  ![image](https://user-images.githubusercontent.com/39044004/160555196-8a418b57-950a-4076-8504-8906d6c1d668.png)
