-- phpMyAdmin SQL Dump
-- version 5.2.1deb1+deb12u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 23, 2025 at 04:12 AM
-- Server version: 10.11.11-MariaDB-0+deb12u1
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `berkas`
--

CREATE TABLE `berkas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `element_id` bigint(20) NOT NULL DEFAULT 0,
  `prodi_id` bigint(20) DEFAULT 0,
  `l1_id` int(11) NOT NULL DEFAULT 0,
  `l2_id` int(11) DEFAULT 0,
  `l3_id` int(11) DEFAULT 0,
  `l4_id` int(11) DEFAULT 0,
  `file_name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `dec` text DEFAULT NULL,
  `score` decimal(3,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prodi_id` bigint(20) NOT NULL DEFAULT 0,
  `l1_id` int(11) NOT NULL DEFAULT 0,
  `l2_id` int(11) DEFAULT 0,
  `l3_id` int(11) DEFAULT 0,
  `l4_id` int(11) DEFAULT 0,
  `bobot` decimal(3,2) UNSIGNED ZEROFILL DEFAULT NULL,
  `indikator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `score_berkas` decimal(3,2) UNSIGNED ZEROFILL DEFAULT NULL,
  `score_hitung` decimal(4,2) UNSIGNED ZEROFILL DEFAULT NULL,
  `count_berkas` bigint(20) DEFAULT NULL,
  `min_akreditasi` decimal(3,2) UNSIGNED ZEROFILL DEFAULT 0.00,
  `status_akreditasi` enum('F','Y','N') DEFAULT 'F',
  `min_unggul` decimal(3,2) UNSIGNED DEFAULT 0.00,
  `status_unggul` enum('F','Y','N') DEFAULT 'F',
  `min_baik` decimal(3,2) UNSIGNED DEFAULT 0.00,
  `status_baik` enum('F','Y','N') DEFAULT 'F'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indikators`
--

CREATE TABLE `indikators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dec` text NOT NULL,
  `jenjang_id` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indikators`
--

INSERT INTO `indikators` (`id`, `dec`, `jenjang_id`) VALUES
(1, '<p>Konsistensi dengan hasil analisis SWOT dan/atau analisis lain serta rencana pengembangan ke depan.</p>', 2),
(2, '<p>Keserbacakupan informasi dalam profil dan konsistensi antara profil dengan data dan informasi yang disampaikan pada masing-masing kriteria, serta menunjukkan iklim yang kondusif untuk pengembangan dan reputasi sebagai rujukan di bidang keilmuannya.</p>', 2),
(3, '<p>Kesesuaian Visi, Misi, Tujuan dan Strategi (VMTS) Unit Pengelola Program Studi (UPPS) terhadap VMTS Perguruan Tinggi (PT) dan visi keilmuan Program Studi (PS) yang dikelolanya.</p>', 2),
(4, '<p>Mekanisme dan keterlibatan pemangku kepentingan dalam penyusunan VMTS UPPS.</p>', 2),
(5, '<p>Strategi pencapaian tujuan disusun berdasarkan analisis yang sistematis, serta pada pelaksanaannya dilakukan pemantauan dan evaluasi yang ditindak lanjuti.&nbsp;</p>', 2),
(6, '<p>A. Kelengkapan struktur organisasi dan keefektifan penyelenggaraan organisasi.</p>\r\n<p>B. Perwujudan good governance dan pemenuhan lima pilar sistem tata pamong, yang mencakup:</p>\r\n\r\n<ol>\r\n	<li>Kredibel,</li>\r\n	<li>Transparan,</li>\r\n	<li>Akuntabel,</li>\r\n	<li>Bertanggung jawab,</li>\r\n	<li>Adil.</li>\r\n</ol>\r\n<p>Skor = (A + (2 x B)) / 3</p>', 2),
(7, '<p>A. Komitmen pimpinan UPPS.</p>\r\n<p>B. Kapabilitas pimpinan UPPS, mencakup aspek:</p>\r\n\r\n<ol>\r\n	<li>perencanaan,</li>\r\n	<li>pengorganisasian,</li>\r\n	<li>penempatan personel,</li>\r\n	<li>pelaksanaan,</li>\r\n	<li>pengendalian dan pengawasan, dan</li>\r\n	<li>pelaporan yang menjadi dasar tindak lanjut.&nbsp;</li>\r\n</ol>\r\n<p>Skor = (A + (2 x B)) / 3</p>', 2),
(8, '<p>Mutu, manfaat, kepuasan dan keberlanjutan kerjasama pendidikan, penelitian dan PkM yang relevan dengan program studi. UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi 3 aspek berikut:</p>\r\n\r\n<ol>\r\n	<li>memberikan manfaat bagi program studi dalam pemenuhan proses pembelajaran, penelitian, PkM.</li>\r\n	<li>memberikan peningkatan kinerja tridharma dan fasilitas pendukung program studi.</li>\r\n	<li>memberikan kepuasan kepada mitra industri dan mitra kerjasama lainnya, serta menjamin keberlanjutan kerjasama dan hasilnya.</li>\r\n</ol>', 2),
(9, '<p>A. Kerjasama perguruan tinggi di bidang pendidikan, penelitian dan PkM dalam 3 tahun terakhir.</p>\r\n<p>B. Kerjasama tingkat internasional, nasional, wilayah/lokal yang relevan dengan program studi dan dikelola oleh UPPS dalam 3 tahun terakhir.\r\nTabel 1 LKPS</p>', 2),
(10, '<p>Pelampauan SN-DIKTI (indikator kinerja tambahan) yang ditetapkan oleh UPPS pada tiap kriteria.</p>', 2),
(11, '<p>Analisis keberhasilan dan/atau ketidakberhasilan pencapaian kinerja yang telah ditetapkan institusi yang memenuhi 2 aspek sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>capaian kinerja harus diukur dengan metoda yang tepat, dan hasilnya dianalisis serta dievaluasi, dan</li>\r\n	<li>analisis terhadap capaian kinerja mencakup identifikasi akar masalah, faktor pendukung keberhasilan dan faktor penghambat ketercapaian standar, dan deskripsi singkat tindak lanjut yang akan dilakukan.</li>\r\n</ol>', 2),
(12, '<p>Keterlaksanaan Sistem Penjaminan Mutu Internal (akademik dan nonakademik) yang dibuktikan dengan keberadaan 5 aspek:</p>\r\n\r\n<ol>\r\n	<li>dokumen legal pembentukan unsur pelaksana penjaminan mutu.</li>\r\n	<li>ketersediaan dokumen mutu: kebijakan SPMI, manual SPMI, standar SPMI, dan formulir SPMI.</li>\r\n	<li>terlaksananya siklus penjaminan mutu (siklus PPEPP).</li>\r\n	<li>bukti sahih efektivitas pelaksanaan penjaminan mutu.</li>\r\n	<li>memiliki external benchmarking dalam peningkatan mutu.</li>\r\n</ol>', 2),
(13, '<p>Pengukuran kepuasan layanan manajemen terhadap para pemangku kepentingan: mahasiswa, dosen, tenaga kependidikan, lulusan, pengguna dan mitra yang memenuhi aspek-aspek berikut:</p>\r\n\r\n<ol>\r\n	<li>menggunakan instrumen kepuasan yang sahih, andal, mudah digunakan,</li>\r\n	<li>dilaksanakan secara berkala, serta datanya terekam secara komprehensif,&nbsp;</li>\r\n	<li>dianalisis dengan metode yang tepat serta bermanfaat untuk pengambilan keputusan,</li>\r\n	<li>tingkat kepuasan dan umpan balik ditindaklanjuti untuk perbaikan dan peningkatan mutu luaran secara berkala dan tersistem,</li>\r\n	<li>dilakukan review terhadap pelaksanaan pengukuran kepuasan dosen dan mahasiswa, serta</li>\r\n	<li>hasilnya dipublikasikan dan mudah diakses oleh dosen dan mahasiswa.</li>\r\n</ol>', 2),
(14, '<p>Metoda rekrutmen dan keketatan seleksi.<br />\r\nTabel 2.a LKPS</p>', 2),
(15, '<p>A. Peningkatan animo calon mahasiswa.<br />\r\nTabel 2.a LKPS</p>', 2),
(16, '<p>A. Ketersediaan layanan kemahasiswaan di bidang:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>penalaran, minat dan bakat,</li>\r\n	<li>kesejahteraan (bimbingan dan konseling, layanan beasiswa, dan layanan kesehatan), dan</li>\r\n	<li>bimbingan karir dan kewirausahaan.</li>\r\n</ol>\r\n\r\n<p>B. Akses dan mutu layanan kemahasiswaan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 2),
(17, '<p>Kecukupan jumlah DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>', 2),
(18, '<p>Kualifikasi akademik DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDS3 = Jumlah DTPS yang berpendidikan tertinggi Doktor/Doktor Terapan/Subspesialis.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>PDS3 = (NDS3 / NDTPS) x 100%</p>', 2),
(19, '<p>Jabatan akademik DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDGB = Jumlah DTPS yang memiliki jabatan akademik Guru Besar.</p>\r\n\r\n<p>NDLK = Jumlah DTPS yang memiliki jabatan akademik Lektor Kepala.</p>\r\n\r\n<p>PGBLKL = ((NDGB + NDLK + NDL) / NDTPS) x 100%</p>', 2),
(20, '<p>Rasio jumlah mahasiswa program studi terhadap jumlah DTPS.<br />\r\nTabel 2.a LKPS dan Tabel 3.a.1) LKPS</p>\r\n\r\n<p>NM = Jumlah mahasiswa pada saat TS.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RMD = NM / NDTPS</p>', 2),
(21, '<p>Penugasan DTPS sebagai pembimbing utama tugas akhir mahasiswa.<br />\r\nTabel 3.a.2) LKPS&nbsp;</p>\r\n\r\n<p>RDPUPS = Rata-rata jumlah mahasiswa yang dibimbing pada PS yang diakreditasi</p>\r\n\r\n<p>RDPUL = Rata-rata jumlah mahasiswa yang dibimbing pada PS lain di PT</p>\r\n\r\n<p>RDPU = (RDUPS + RDPUL) / 2</p>', 2),
(22, '<p>Ekuivalensi Waktu Mengajar Penuh DTPS.<br />\r\nTabel 3.a.3) LKPS</p>\r\n\r\n<p>EWMPDT = Rata-rata EWMP DT per semester pada saat TS.</p>\r\n\r\n<p>EWMPDTPS = Rata-rata EWMP DTPS per semester pada saat TS.</p>\r\n\r\n<p>EWMP = EWMPDTPS</p>', 2),
(23, '<p>Dosen tidak tetap.<br />\r\nTabel 3.a.4) LKPS</p>\r\n\r\n<p>NDTT = Jumlah dosen tidak tetap yang ditugaskan sebagai pengampu mata kuliah di program studi yang diakreditasi.</p>\r\n\r\n<p>NDT = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah di program studi yang diakreditasi.</p>\r\n\r\n<p>PDTT = (NDTT / (NDTT + NDT)) x 100%</p>', 2),
(24, '<p>Pengakuan/rekognisi atas kepakaran/prestasi/kinerja DTPS.<br />\r\nPengakuan/rekognisi atas kepakaran/prestasi/kinerja DTPS dapat berupa:</p>\r\n\r\n<ol>\r\n	<li>menjadi staf ahli/tenaga ahli/narasumber di lembaga tingkat wilayah/nasional/ internasional pada bidang yang sesuai dengan bidang program studi.</li>\r\n	<li>menjadi visiting lecturer atau visiting scholar di program studi/perguruan tinggi terakreditasi A/Unggul atau program studi/perguruan tinggi internasional bereputasi.</li>\r\n	<li>menjadi invited speaker pada pertemuan ilmiah tingkat wilayah/nasional/ internasional.</li>\r\n	<li>menjadi editor atau mitra bestari pada jurnal nasional terakreditasi/jurnal internasional bereputasi di bidang yang sesuai dengan bidang program studi.</li>\r\n</ol>\r\n\r\n<p>Tabel 3.b.1) LKPS</p>\r\n\r\n<p>NRD = Jumlah pengakuan atas prestasi/kinerja DTPS yang relevan dengan bidang keahlian dalam 3 tahun terakhir.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RRD = NRD / NDTPS&nbsp;</p>', 2),
(25, '<p>Kegiatan penelitian DTPS yang relevan dengan bidang program studi dalam 3 tahun terakhir.<br />\r\nTabel 3.b.2) LKPS</p>\r\n\r\n<p>NI = Jumlah penelitian dengan sumber pembiayaan luar negeri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NN = Jumlah penelitian dengan sumber pembiayaan dalam negeri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NL = Jumlah penelitian dengan sumber pembiayaan PT/mandiri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RI = NI / 3 / NDTPS</p>\r\n\r\n<p>RN = NN / 3 / NDTPS</p>\r\n\r\n<p>RL = NL / 3 / NDTPS</p>', 2),
(26, '<p>Kegiatan PkM DTPS yang relevan dengan bidang program studi dalam 3 tahun terakhir.</p>', 2),
(27, '<p>Publikasi ilmiah dengan tema yang relevan dengan bidang program studi yang dihasilkan DTPS dalam 3 tahun terakhir.<br />\r\nTabel 3.b.4) LKPS</p>', 2),
(28, '<p>Artikel karya ilmiah DTPS yang disitasi dalam 3 tahun terakhir.<br />\r\nTabel 3.b.5) LKPS</p>\r\n\r\n<p>NAS = Jumlah judul artikel yang disitasi.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RS = NAS / NDTPS</p>', 2),
(29, '<p>Luaran penelitian dan PkM yang dihasilkan DTPS dalam 3 tahun terakhir.<br />\r\nTabel 3.b.7) LKPS</p>', 2),
(30, '<p>Upaya pengembangan dosen.<br />\r\nCatatan: Jika Skor rata-rata butir Profil Dosen &ge; 3,5 , maka Skor = 4.</p>', 2),
(31, '<p>A. Kualifikasi dan kecukupan tenaga kependidikan berdasarkan jenis pekerjaannya (administrasi, pustakawan, teknisi, dll.)<br />\r\nCatatan: Penilaian kecukupan tidak hanya ditentukan oleh jumlah tenaga kependidikan, namun keberadaan dan pemanfaatan teknologi informasi dan komputer dalam proses administrasi dapat dijadikan pertimbangan untuk menilai efektifitas pekerjaan dan kebutuhan akan tenaga kependidikan.</p>\r\n\r\n<p>B. Akses dan mutu layanan kemahasiswaan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 2),
(32, '<p>Biaya operasional pendidikan.<br />\r\nTabel 4 LKPS</p>\r\n\r\n<p>BOP = Biaya operasional pendidikan dalam 3 tahun terakhir.</p>\r\n\r\n<p>NM = Jumlah mahasiswa aktif pada saat TS.</p>\r\n\r\n<p>DOP = Rata-rata dana operasional pendidikan/mahasiswa/ tahun dalam 3 tahun terakhir = BOP / 3 / NM</p>', 2),
(33, '<p>Dana penelitian DTPS.<br />\r\nTabel 4 LKPS</p>', 2),
(34, '<p>Dana pengabdian kepada masyarakat DTPS.<br />\r\nTabel 4 LKPS</p>', 2),
(35, '<p>Realisasi investasi (SDM, sarana dan prasarana) yang mendukung penyelenggaraan tridharma.<br />\r\nCatatan: Jika Skor rata-rata butir tentang Profil Dosen, Sarana, dan Prasarana &ge; 3,5 , maka Skor butir ini = 4.</p>', 2),
(36, '<p>Kecukupan dana untuk menjamin pencapaian capaian pembelajaran.</p>', 2),
(37, '<p>Kecukupan, aksesibilitas dan mutu sarana dan prasarana untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 2),
(38, '<p>A. Keterlibatan pemangku kepentingan dalam proses evaluasi dan pemutakhiran kurikulum.</p>\r\n\r\n<p>B. Kesesuaian capaian pembelajaran dengan profil lulusan dan jenjang KKNI/SKKNI.</p>\r\n\r\n<p>C. Ketepatan struktur kurikulum dalam pembentukan capaian pembelajaran.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C)) / 5</p>', 2),
(39, '<p>Pemenuhan karakteristik proses pembelajaran, yang terdiri atas sifat:</p>\r\n\r\n<ol>\r\n	<li>interaktif,</li>\r\n	<li>holistik,</li>\r\n	<li>integratif,</li>\r\n	<li>saintifik,</li>\r\n	<li>kontekstual,</li>\r\n	<li>tematik,</li>\r\n	<li>efektif,</li>\r\n	<li>kolaboratif, dan</li>\r\n	<li>berpusat pada mahasiswa.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', 2),
(40, '<p>A. Ketersediaan dan kelengkapan dokumen rencana pembelajaran semester (RPS)&nbsp;</p>\r\n\r\n<p>B. Kedalaman dan keluasan RPS sesuai dengan capaian pembelajaran lulusan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 2),
(41, '<p>A. Bentuk interaksi antara dosen, mahasiswa dan sumber belajar</p>\r\n\r\n<p>B. Pemantauan kesesuaian proses terhadap rencana pembelajaran</p>\r\n\r\n<p>C. Proses pembelajaran yang terkait dengan penelitian harus mengacu SN Dikti Penelitian: 1) hasil penelitian: harus memenuhi pengembangan IPTEKS, meningkatkan kesejahteraan masyarakat, dan daya saing bangsa. 2) isi penelitian: memenuhi kedalaman dan keluasan materi penelitian sesuai capaian pembelajaran. 3) proses penelitian: mencakup perencanaan, pelaksanaan, dan pelaporan. 4) penilaian penelitian memenuhi unsur edukatif, obyektif, akuntabel, dan transparan.</p>\r\n\r\n<p>D. Proses pembelajaran yang terkait dengan PkM harus mengacu SN Dikti PkM: 1) hasil PkM: harus memenuhi pengembangan IPTEKS, meningkatkan kesejahteraan masyarakat, dan daya saing bangsa. 2) isi PkM: memenuhi kedalaman dan keluasan materi PkM sesuai capaian pembelajaran. 3) proses PkM: &nbsp;mencakup perencanaan, pelaksanaan, dan pelaporan. 4) penilaian PkM memenuhi unsur edukatif, obyektif, akuntabel, dan transparan.</p>\r\n\r\n<p>E. Kesesuaian metode pembelajaran dengan capaian pembelajaran. Contoh: RBE (research based education), IBE (industry based education), teaching factory/teaching industry, dll.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C) + (2 x D) + (2 x E)) / 9</p>', 2),
(42, '<p>Pembelajaran yang dilaksanakan dalam bentuk praktikum, praktik studio, praktik bengkel, atau praktik lapangan.<br />\r\nTabel 5.a LKPS</p>\r\n\r\n<p>JP = Jam pembelajaran praktikum, praktik studio, praktik bengkel, atau praktik lapangan (termasuk KKN)</p>\r\n\r\n<p>JB = Jam pembelajaran total selama masa pendidikan.</p>\r\n\r\n<p>PJP = (JP / JB) x 100%</p>', 2),
(43, '<p>Monitoring dan evaluasi pelaksanaan proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa untuk memperoleh capaian pembelajaran lulusan.</p>', 2),
(44, '<p>A. Mutu pelaksanaan penilaian pembelajaran (proses dan hasil belajar mahasiswa) untuk mengukur ketercapaian capaian pembelajaran berdasarkan prinsip penilaian yang mencakup: 1) edukatif, 2) otentik, 3) objektif, 4) akuntabel, dan 5) transparan, yang dilakukan secara terintegrasi.</p>\r\n\r\n<p>B. Pelaksanaan penilaian terdiri atas teknik dan instrumen penilaian.&nbsp;<br />\r\nTeknik penilaian terdiri dari: 1) observasi, 2) partisipasi, 3) unjuk kerja, 4) test tertulis, 5) test lisan, dan 6) angket.<br />\r\nInstrumen penilaian terdiri dari: 1) penilaian proses dalam bentuk rubrik, dan/ atau; 2) penilaian hasil dalam bentuk portofolio, atau 3) karya disain.</p>\r\n\r\n<p>C. Pelaksanaan penilaian memuat unsur-unsur sebagai berikut: 1) mempunyai kontrak rencana penilaian, 2) melaksanakan penilaian sesuai kontrak atau kesepakatan, 3) memberikan umpan balik dan memberi kesempatan untuk mempertanyakan hasil kepada mahasiswa, 4) mempunyai dokumentasi penilaian proses dan hasil belajar mahasiswa, 5) mempunyai prosedur yang mencakup tahap perencanaan, kegiatan pemberian tugas atau soal, observasi kinerja, pengembalian hasil observasi, dan pemberian nilai akhir, 6) pelaporan penilaian berupa kualifikasi keberhasilan mahasiswa dalam menempuh suatu mata kuliah dalam bentuk huruf dan angka, 7) mempunyai bukti-bukti rencana dan telah melakukan proses perbaikan berdasar hasil monev penilaian.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C)) / 5</p>', 2),
(45, '<p>Integrasi kegiatan penelitian dan PkM dalam pembelajaran oleh DTPS dalam 3 tahun terakhir.<br />\r\nTabel 5.b LKPS</p>\r\n\r\n<p>MK = Jumlah mata kuliah yang dikembangkan berdasarkan hasil penelitian/PkM DTPS dalam 3 tahun terakhir.</p>', 2),
(46, '<p>Keterlaksanaan dan keberkalaan program dan kegiatan diluar kegiatan pembelajaran terstruktur untuk meningkatkan suasana akademik.<br />\r\nContoh: kegiatan himpunan mahasiswa, kuliah umum/studium generale, seminar ilmiah, bedah buku.</p>', 2),
(47, '<p>A. Tingkat kepuasan mahasiswa terhadap proses pendidikan.<br />\r\nTabel 5.c LKPS<br />\r\nAspek yang diukur: 1) Keandalan (reliability): kemampuan dosen, tenaga kependidikan, dan pengelola dalam memberikan pelayanan; 2) Daya tanggap (responsiveness): kemauan dari dosen, tenaga kependidikan, dan pengelola dalam membantu mahasiswa dan memberikan jasa dengan cepat; 3) Kepastian (assurance): kemampuan dosen, tenaga kependidikan, dan pengelola untuk memberi keyakinan kepada mahasiswa bahwa pelayanan yang diberikan telah sesuai dengan ketentuan; 4) Empati (empathy): kesediaan/kepedulian dosen, tenaga kependidikan, dan pengelola untuk memberi perhatian kepada mahasiswa; dan 5) Tangible: penilaian mahasiswa terhadap kecukupan, aksesibitas, kualitas sarana dan prasarana.</p>\r\n\r\n<p>B. Analisis dan tindak lanjut dari hasil pengukuran kepuasan mahasiswa.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 2),
(48, '<p>Relevansi penelitian pada UPPS mencakup unsur-unsur sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>memiliki peta jalan yang memayungi tema penelitian dosen dan mahasiswa,</li>\r\n	<li>dosen dan mahasiswa melaksanakan penelitian sesuai dengan agenda penelitian dosen yang merujuk kepada peta jalan penelitian.&nbsp;</li>\r\n	<li>melakukan evaluasi kesesuaian penelitian dosen dan mahasiswa dengan peta jalan, dan&nbsp;</li>\r\n	<li>menggunakan hasil evaluasi untuk perbaikan relevansi penelitian dan pengembangan keilmuan program studi.</li>\r\n</ol>', 2),
(49, '<p>Penelitian DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.<br />\r\nTabel 6.a LKPS</p>\r\n\r\n<p>NPM = Jumlah judul penelitian DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.</p>\r\n\r\n<p>NPD = Jumlah judul penelitian DTPS dalam 3 tahun terakhir.&nbsp;</p>\r\n\r\n<p>PPDM = (NPM / NPkMD) x 100%&nbsp;</p>', 2),
(50, '<p>Relevansi PkM pada UPPS mencakup unsur-unsur sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>memiliki peta jalan yang memayungi tema PkM dosen dan mahasiswa serta hilirisasi/penerapan keilmuan program studi,&nbsp;</li>\r\n	<li>dosen dan mahasiswa melaksanakan PkM sesuai dengan peta jalan PkM.&nbsp;</li>\r\n	<li>melakukan evaluasi kesesuaian PkM dosen dan mahasiswa dengan peta jalan, dan&nbsp;</li>\r\n	<li>menggunakan hasil evaluasi untuk perbaikan relevansi PkM dan pengembangan keilmuan program studi.</li>\r\n</ol>', 2),
(51, '<p>PkM DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.<br />\r\nTabel 7 LKPS</p>\r\n\r\n<p>NPkMM = Jumlah judul PkM DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.</p>\r\n\r\n<p>NPkMD = Jumlah judul PkM DTPS dalam 3 tahun terakhir.&nbsp;</p>\r\n\r\n<p>PPkMDM = (NPkMM / NPkMD) x 100%&nbsp;</p>', 2),
(52, '<p>Analisis pemenuhan capaian pembelajaran lulusan (CPL) yang diukur dengan metoda yang sahih dan relevan, mencakup aspek:</p>\r\n\r\n<ol>\r\n	<li>keserbacakupan,&nbsp;</li>\r\n	<li>kedalaman, dan&nbsp;</li>\r\n	<li>kebermanfaatan analisis yang ditunjukkan dengan peningkatan CPL dari waktu ke waktu dalam 3 tahun terakhir.</li>\r\n</ol>', 2),
(53, '<p>IPK lulusan.<br />\r\nTabel 8.a LKPS</p>\r\n\r\n<p>RIPK = Rata-rata IPK lulusan dalam 3 tahun terakhir.</p>', 2),
(54, '<p>Prestasi mahasiswa di bidang akademik dalam 3 tahun terakhir.<br />\r\nTabel 8.b.1) LKP</p>\r\n\r\n<p>RW = NW / NM</p>', 2),
(55, '<p>Prestasi mahasiswa di bidang nonakademik dalam 3 tahun terakhir.<br />\r\nTabel 8.b.2) LKPS</p>\r\n\r\n<p>RW = NW / NM</p>', 2),
(56, '<p>Masa studi.<br />\r\nTabel 8.c LKPS</p>', 2),
(57, '<p>Kelulusan tepat waktu.<br />\r\nTabel 8.c LKPS</p>', 2),
(58, '<p>Keberhasilan studi.<br />\r\nTabel 8.c LKPS</p>', 2),
(59, '<p>Pelaksanaan tracer study yang mencakup 5 aspek sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>pelaksanaan tracer study terkoordinasi di tingkat PT,</li>\r\n	<li>kegiatan tracer study dilakukan secara reguler setiap tahun dan terdokumentasi,</li>\r\n	<li>isi kuesioner mencakup seluruh pertanyaan inti tracer study DIKTI.</li>\r\n	<li>ditargetkan pada seluruh populasi (lulusan TS-4 s.d. TS-2),</li>\r\n	<li>hasilnya disosialisasikan dan digunakan untuk pengembangan kurikulum dan pembelajaran.&nbsp;</li>\r\n</ol>', 2),
(60, '<p>Waktu tunggu.<br />\r\nTabel 8.d.1) LKPS</p>', 2),
(61, '<p>Kesesuaian bidang kerja.&nbsp;<br />\r\nTabel 8.d.2) LKPS</p>', 2),
(62, '<p>Tingkat dan ukuran tempat kerja lulusan.<br />\r\nTabel 8.e.1) LKPS</p>', 2),
(63, '<p>Tingkat kepuasan pengguna lulusan.<br />\r\nTabel 8.e.2) LKPS</p>', 2),
(64, '<p>Publikasi ilmiah mahasiswa, yang dihasilkan secara mandiri atau bersama DTPS, dengan judul yang relevan dengan bidang program studi dalam 3 tahun terakhir.<br />\r\nTabel 8.f.1) LKPS</p>', 2),
(65, '<p>Luaran penelitian dan PkM yang dihasilkan mahasiswa, baik secara mandiri atau bersama DTPS dalam 3 tahun terakhir.<br />\r\nTabel 8.f.4) LKPS</p>', 2),
(66, '<p>Keserbacakupan (kelengkapan, keluasan, dan kedalaman), ketepatan, ketajaman, dan kesesuaian analisis capaian kinerja serta konsistensi dengan setiap kriteria.</p>', 2),
(67, '<p>Ketepatan analisis SWOT atau analisis yang relevan di dalam mengembangkan strategi.</p>', 2),
(68, '<p>Ketepatan di dalam menetapkan prioritas program pengembangan.</p>', 2),
(69, '<p>UPPS memiliki kebijakan, ketersediaan sumberdaya, kemampuan melaksanakan, dan kerealistikan program.</p>', 2),
(71, '<p>Konsistensi dengan hasil analisis SWOT dan/atau analisis lain serta rencana pengembangan ke depan.</p>', 1),
(72, '<p>Keserbacakupan informasi dalam profil dan konsistensi antara profil dengan data dan informasi yang disampaikan pada masing-masing kriteria, serta menunjukkan iklim yang kondusif untuk pengembangan dan reputasi sebagai rujukan di bidang keilmuannya.</p>', 1),
(73, '<p>Kesesuaian Visi, Misi, Tujuan dan Strategi (VMTS) Unit Pengelola Program Studi (UPPS) terhadap VMTS Perguruan Tinggi (PT) dan visi keilmuan Program Studi (PS) yang dikelolanya.</p>', 1),
(74, '<p>Mekanisme dan keterlibatan pemangku kepentingan dalam penyusunan VMTS UPPS.</p>', 1),
(75, '<p>Strategi pencapaian tujuan disusun berdasarkan analisis yang sistematis, serta pada pelaksanaannya dilakukan pemantauan dan evaluasi yang ditindak lanjuti.&nbsp;</p>', 1),
(76, '<p>A. Kelengkapan struktur organisasi dan keefektifan penyelenggaraan organisasi.</p>\r\n<p>B. Perwujudan good governance dan pemenuhan lima pilar sistem tata pamong, yang mencakup:</p>\r\n\r\n<ol>\r\n	<li>Kredibel,</li>\r\n	<li>Transparan,</li>\r\n	<li>Akuntabel,</li>\r\n	<li>Bertanggung jawab,</li>\r\n	<li>Adil.</li>\r\n</ol>\r\n<p>Skor = (A + (2 x B)) / 3</p>', 1),
(77, '<p>A. Komitmen pimpinan UPPS.</p>\r\n<p>B. Kapabilitas pimpinan UPPS, mencakup aspek:</p>\r\n\r\n<ol>\r\n	<li>perencanaan,</li>\r\n	<li>pengorganisasian,</li>\r\n	<li>penempatan personel,</li>\r\n	<li>pelaksanaan,</li>\r\n	<li>pengendalian dan pengawasan, dan</li>\r\n	<li>pelaporan yang menjadi dasar tindak lanjut.&nbsp;</li>\r\n</ol>\r\n<p>Skor = (A + (2 x B)) / 3</p>', 1),
(78, '<p>Mutu, manfaat, kepuasan dan keberlanjutan kerjasama pendidikan, penelitian dan PkM yang relevan dengan program studi. UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi 3 aspek berikut:</p>\r\n\r\n<ol>\r\n	<li>memberikan manfaat bagi program studi dalam pemenuhan proses pembelajaran, penelitian, PkM.</li>\r\n	<li>memberikan peningkatan kinerja tridharma dan fasilitas pendukung program studi.</li>\r\n	<li>memberikan kepuasan kepada mitra industri dan mitra kerjasama lainnya, serta menjamin keberlanjutan kerjasama dan hasilnya.</li>\r\n</ol>', 1),
(79, '<p>A. Kerjasama perguruan tinggi di bidang pendidikan, penelitian dan PkM dalam 3 tahun terakhir.</p>\r\n<p>B. Kerjasama tingkat internasional, nasional, wilayah/lokal yang relevan dengan program studi dan dikelola oleh UPPS dalam 3 tahun terakhir.\r\nTabel 1 LKPS</p>', 1),
(80, '<p>Pelampauan SN-DIKTI (indikator kinerja tambahan) yang ditetapkan oleh UPPS pada tiap kriteria.</p>', 1),
(81, '<p>Analisis keberhasilan dan/atau ketidakberhasilan pencapaian kinerja yang telah ditetapkan institusi yang memenuhi 2 aspek sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>capaian kinerja harus diukur dengan metoda yang tepat, dan hasilnya dianalisis serta dievaluasi, dan</li>\r\n	<li>analisis terhadap capaian kinerja mencakup identifikasi akar masalah, faktor pendukung keberhasilan dan faktor penghambat ketercapaian standar, dan deskripsi singkat tindak lanjut yang akan dilakukan.</li>\r\n</ol>', 1),
(82, '<p>Keterlaksanaan Sistem Penjaminan Mutu Internal (akademik dan nonakademik) yang dibuktikan dengan keberadaan 5 aspek:</p>\r\n\r\n<ol>\r\n	<li>dokumen legal pembentukan unsur pelaksana penjaminan mutu.</li>\r\n	<li>ketersediaan dokumen mutu: kebijakan SPMI, manual SPMI, standar SPMI, dan formulir SPMI.</li>\r\n	<li>terlaksananya siklus penjaminan mutu (siklus PPEPP).</li>\r\n	<li>bukti sahih efektivitas pelaksanaan penjaminan mutu.</li>\r\n	<li>memiliki external benchmarking dalam peningkatan mutu.</li>\r\n</ol>', 1),
(83, '<p>Pengukuran kepuasan layanan manajemen terhadap para pemangku kepentingan: mahasiswa, dosen, tenaga kependidikan, lulusan, pengguna dan mitra yang memenuhi aspek-aspek berikut:</p>\r\n\r\n<ol>\r\n	<li>menggunakan instrumen kepuasan yang sahih, andal, mudah digunakan,</li>\r\n	<li>dilaksanakan secara berkala, serta datanya terekam secara komprehensif,&nbsp;</li>\r\n	<li>dianalisis dengan metode yang tepat serta bermanfaat untuk pengambilan keputusan,</li>\r\n	<li>tingkat kepuasan dan umpan balik ditindaklanjuti untuk perbaikan dan peningkatan mutu luaran secara berkala dan tersistem,</li>\r\n	<li>dilakukan review terhadap pelaksanaan pengukuran kepuasan dosen dan mahasiswa, serta</li>\r\n	<li>hasilnya dipublikasikan dan mudah diakses oleh dosen dan mahasiswa.</li>\r\n</ol>', 1),
(84, '<p>Metoda rekrutmen dan keketatan seleksi.<br />\r\nTabel 2.a LKPS</p>', 1),
(85, '<p>A. Peningkatan animo calon mahasiswa.<br />\r\nTabel 2.a LKPS</p>', 1),
(86, '<p>A. Ketersediaan layanan kemahasiswaan di bidang:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>penalaran, minat dan bakat,</li>\r\n	<li>kesejahteraan (bimbingan dan konseling, layanan beasiswa, dan layanan kesehatan), dan</li>\r\n	<li>bimbingan karir dan kewirausahaan.</li>\r\n</ol>\r\n\r\n<p>B. Akses dan mutu layanan kemahasiswaan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 1),
(87, '<p>Kecukupan jumlah DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>', 1),
(88, '<p>Kualifikasi akademik DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDS3 = Jumlah DTPS yang berpendidikan tertinggi Doktor/Doktor Terapan/Subspesialis.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>PDS3 = (NDS3 / NDTPS) x 100%</p>', 1),
(89, '<p>Jabatan akademik DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDGB = Jumlah DTPS yang memiliki jabatan akademik Guru Besar.</p>\r\n\r\n<p>NDLK = Jumlah DTPS yang memiliki jabatan akademik Lektor Kepala.</p>\r\n\r\n<p>PGBLKL = ((NDGB + NDLK + NDL) / NDTPS) x 100%</p>', 1),
(90, '<p>Rasio jumlah mahasiswa program studi terhadap jumlah DTPS.<br />\r\nTabel 2.a LKPS dan Tabel 3.a.1) LKPS</p>\r\n\r\n<p>NM = Jumlah mahasiswa pada saat TS.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RMD = NM / NDTPS</p>', 1),
(91, '<p>Penugasan DTPS sebagai pembimbing utama tugas akhir mahasiswa.<br />\r\nTabel 3.a.2) LKPS&nbsp;</p>\r\n\r\n<p>RDPUPS = Rata-rata jumlah mahasiswa yang dibimbing pada PS yang diakreditasi</p>\r\n\r\n<p>RDPUL = Rata-rata jumlah mahasiswa yang dibimbing pada PS lain di PT</p>\r\n\r\n<p>RDPU = (RDUPS + RDPUL) / 2</p>', 1),
(92, '<p>Ekuivalensi Waktu Mengajar Penuh DTPS.<br />\r\nTabel 3.a.3) LKPS</p>\r\n\r\n<p>EWMPDT = Rata-rata EWMP DT per semester pada saat TS.</p>\r\n\r\n<p>EWMPDTPS = Rata-rata EWMP DTPS per semester pada saat TS.</p>\r\n\r\n<p>EWMP = EWMPDTPS</p>', 1),
(93, '<p>Dosen tidak tetap.<br />\r\nTabel 3.a.4) LKPS</p>\r\n\r\n<p>NDTT = Jumlah dosen tidak tetap yang ditugaskan sebagai pengampu mata kuliah di program studi yang diakreditasi.</p>\r\n\r\n<p>NDT = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah di program studi yang diakreditasi.</p>\r\n\r\n<p>PDTT = (NDTT / (NDTT + NDT)) x 100%</p>', 1),
(94, '<p>Pengakuan/rekognisi atas kepakaran/prestasi/kinerja DTPS.<br />\r\nPengakuan/rekognisi atas kepakaran/prestasi/kinerja DTPS dapat berupa:</p>\r\n\r\n<ol>\r\n	<li>menjadi staf ahli/tenaga ahli/narasumber di lembaga tingkat wilayah/nasional/ internasional pada bidang yang sesuai dengan bidang program studi.</li>\r\n	<li>menjadi visiting lecturer atau visiting scholar di program studi/perguruan tinggi terakreditasi A/Unggul atau program studi/perguruan tinggi internasional bereputasi.</li>\r\n	<li>menjadi invited speaker pada pertemuan ilmiah tingkat wilayah/nasional/ internasional.</li>\r\n	<li>menjadi editor atau mitra bestari pada jurnal nasional terakreditasi/jurnal internasional bereputasi di bidang yang sesuai dengan bidang program studi.</li>\r\n</ol>\r\n\r\n<p>Tabel 3.b.1) LKPS</p>\r\n\r\n<p>NRD = Jumlah pengakuan atas prestasi/kinerja DTPS yang relevan dengan bidang keahlian dalam 3 tahun terakhir.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RRD = NRD / NDTPS&nbsp;</p>', 1),
(95, '<p>Kegiatan penelitian DTPS yang relevan dengan bidang program studi dalam 3 tahun terakhir.<br />\r\nTabel 3.b.2) LKPS</p>\r\n\r\n<p>NI = Jumlah penelitian dengan sumber pembiayaan luar negeri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NN = Jumlah penelitian dengan sumber pembiayaan dalam negeri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NL = Jumlah penelitian dengan sumber pembiayaan PT/mandiri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RI = NI / 3 / NDTPS</p>\r\n\r\n<p>RN = NN / 3 / NDTPS</p>\r\n\r\n<p>RL = NL / 3 / NDTPS</p>', 1),
(96, '<p>Kegiatan PkM DTPS yang relevan dengan bidang program studi dalam 3 tahun terakhir.</p>', 1),
(97, '<p>Publikasi ilmiah dengan tema yang relevan dengan bidang program studi yang dihasilkan DTPS dalam 3 tahun terakhir.<br />\r\nTabel 3.b.4) LKPS</p>', 1),
(98, '<p>Artikel karya ilmiah DTPS yang disitasi dalam 3 tahun terakhir.<br />\r\nTabel 3.b.5) LKPS</p>\r\n\r\n<p>NAS = Jumlah judul artikel yang disitasi.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RS = NAS / NDTPS</p>', 1),
(99, '<p>Luaran penelitian dan PkM yang dihasilkan DTPS dalam 3 tahun terakhir.<br />\r\nTabel 3.b.7) LKPS</p>', 1),
(100, '<p>Upaya pengembangan dosen.<br />\r\nCatatan: Jika Skor rata-rata butir Profil Dosen &ge; 3,5 , maka Skor = 4.</p>', 1),
(101, '<p>A. Kualifikasi dan kecukupan tenaga kependidikan berdasarkan jenis pekerjaannya (administrasi, pustakawan, teknisi, dll.)<br />\r\nCatatan: Penilaian kecukupan tidak hanya ditentukan oleh jumlah tenaga kependidikan, namun keberadaan dan pemanfaatan teknologi informasi dan komputer dalam proses administrasi dapat dijadikan pertimbangan untuk menilai efektifitas pekerjaan dan kebutuhan akan tenaga kependidikan.</p>\r\n\r\n<p>B. Akses dan mutu layanan kemahasiswaan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 1),
(102, '<p>Biaya operasional pendidikan.<br />\r\nTabel 4 LKPS</p>\r\n\r\n<p>BOP = Biaya operasional pendidikan dalam 3 tahun terakhir.</p>\r\n\r\n<p>NM = Jumlah mahasiswa aktif pada saat TS.</p>\r\n\r\n<p>DOP = Rata-rata dana operasional pendidikan/mahasiswa/ tahun dalam 3 tahun terakhir = BOP / 3 / NM</p>', 1),
(103, '<p>Dana penelitian DTPS.<br />\r\nTabel 4 LKPS</p>', 1),
(104, '<p>Dana pengabdian kepada masyarakat DTPS.<br />\r\nTabel 4 LKPS</p>', 1),
(105, '<p>Realisasi investasi (SDM, sarana dan prasarana) yang mendukung penyelenggaraan tridharma.<br />\r\nCatatan: Jika Skor rata-rata butir tentang Profil Dosen, Sarana, dan Prasarana &ge; 3,5 , maka Skor butir ini = 4.</p>', 1),
(106, '<p>Kecukupan dana untuk menjamin pencapaian capaian pembelajaran.</p>', 1),
(107, '<p>Kecukupan, aksesibilitas dan mutu sarana dan prasarana untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 1),
(108, '<p>A. Keterlibatan pemangku kepentingan dalam proses evaluasi dan pemutakhiran kurikulum.</p>\r\n\r\n<p>B. Kesesuaian capaian pembelajaran dengan profil lulusan dan jenjang KKNI/SKKNI.</p>\r\n\r\n<p>C. Ketepatan struktur kurikulum dalam pembentukan capaian pembelajaran.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C)) / 5</p>', 1),
(109, '<p>Pemenuhan karakteristik proses pembelajaran, yang terdiri atas sifat:</p>\r\n\r\n<ol>\r\n	<li>interaktif,</li>\r\n	<li>holistik,</li>\r\n	<li>integratif,</li>\r\n	<li>saintifik,</li>\r\n	<li>kontekstual,</li>\r\n	<li>tematik,</li>\r\n	<li>efektif,</li>\r\n	<li>kolaboratif, dan</li>\r\n	<li>berpusat pada mahasiswa.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', 1),
(110, '<p>A. Ketersediaan dan kelengkapan dokumen rencana pembelajaran semester (RPS)&nbsp;</p>\r\n\r\n<p>B. Kedalaman dan keluasan RPS sesuai dengan capaian pembelajaran lulusan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 1),
(111, '<p>A. Bentuk interaksi antara dosen, mahasiswa dan sumber belajar</p>\r\n\r\n<p>B. Pemantauan kesesuaian proses terhadap rencana pembelajaran</p>\r\n\r\n<p>C. Proses pembelajaran yang terkait dengan penelitian harus mengacu SN Dikti Penelitian: 1) hasil penelitian: harus memenuhi pengembangan IPTEKS, meningkatkan kesejahteraan masyarakat, dan daya saing bangsa. 2) isi penelitian: memenuhi kedalaman dan keluasan materi penelitian sesuai capaian pembelajaran. 3) proses penelitian: mencakup perencanaan, pelaksanaan, dan pelaporan. 4) penilaian penelitian memenuhi unsur edukatif, obyektif, akuntabel, dan transparan.</p>\r\n\r\n<p>D. Proses pembelajaran yang terkait dengan PkM harus mengacu SN Dikti PkM: 1) hasil PkM: harus memenuhi pengembangan IPTEKS, meningkatkan kesejahteraan masyarakat, dan daya saing bangsa. 2) isi PkM: memenuhi kedalaman dan keluasan materi PkM sesuai capaian pembelajaran. 3) proses PkM: &nbsp;mencakup perencanaan, pelaksanaan, dan pelaporan. 4) penilaian PkM memenuhi unsur edukatif, obyektif, akuntabel, dan transparan.</p>\r\n\r\n<p>E. Kesesuaian metode pembelajaran dengan capaian pembelajaran. Contoh: RBE (research based education), IBE (industry based education), teaching factory/teaching industry, dll.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C) + (2 x D) + (2 x E)) / 9</p>', 1),
(112, '<p>Pembelajaran yang dilaksanakan dalam bentuk praktikum, praktik studio, praktik bengkel, atau praktik lapangan.<br />\r\nTabel 5.a LKPS</p>\r\n\r\n<p>JP = Jam pembelajaran praktikum, praktik studio, praktik bengkel, atau praktik lapangan (termasuk KKN)</p>\r\n\r\n<p>JB = Jam pembelajaran total selama masa pendidikan.</p>\r\n\r\n<p>PJP = (JP / JB) x 100%</p>', 1),
(113, '<p>Monitoring dan evaluasi pelaksanaan proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa untuk memperoleh capaian pembelajaran lulusan.</p>', 1),
(114, '<p>A. Mutu pelaksanaan penilaian pembelajaran (proses dan hasil belajar mahasiswa) untuk mengukur ketercapaian capaian pembelajaran berdasarkan prinsip penilaian yang mencakup: 1) edukatif, 2) otentik, 3) objektif, 4) akuntabel, dan 5) transparan, yang dilakukan secara terintegrasi.</p>\r\n\r\n<p>B. Pelaksanaan penilaian terdiri atas teknik dan instrumen penilaian.&nbsp;<br />\r\nTeknik penilaian terdiri dari: 1) observasi, 2) partisipasi, 3) unjuk kerja, 4) test tertulis, 5) test lisan, dan 6) angket.<br />\r\nInstrumen penilaian terdiri dari: 1) penilaian proses dalam bentuk rubrik, dan/ atau; 2) penilaian hasil dalam bentuk portofolio, atau 3) karya disain.</p>\r\n\r\n<p>C. Pelaksanaan penilaian memuat unsur-unsur sebagai berikut: 1) mempunyai kontrak rencana penilaian, 2) melaksanakan penilaian sesuai kontrak atau kesepakatan, 3) memberikan umpan balik dan memberi kesempatan untuk mempertanyakan hasil kepada mahasiswa, 4) mempunyai dokumentasi penilaian proses dan hasil belajar mahasiswa, 5) mempunyai prosedur yang mencakup tahap perencanaan, kegiatan pemberian tugas atau soal, observasi kinerja, pengembalian hasil observasi, dan pemberian nilai akhir, 6) pelaporan penilaian berupa kualifikasi keberhasilan mahasiswa dalam menempuh suatu mata kuliah dalam bentuk huruf dan angka, 7) mempunyai bukti-bukti rencana dan telah melakukan proses perbaikan berdasar hasil monev penilaian.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C)) / 5</p>', 1),
(115, '<p>Integrasi kegiatan penelitian dan PkM dalam pembelajaran oleh DTPS dalam 3 tahun terakhir.<br />\r\nTabel 5.b LKPS</p>\r\n\r\n<p>MK = Jumlah mata kuliah yang dikembangkan berdasarkan hasil penelitian/PkM DTPS dalam 3 tahun terakhir.</p>', 1),
(116, '<p>Keterlaksanaan dan keberkalaan program dan kegiatan diluar kegiatan pembelajaran terstruktur untuk meningkatkan suasana akademik.<br />\r\nContoh: kegiatan himpunan mahasiswa, kuliah umum/studium generale, seminar ilmiah, bedah buku.</p>', 1),
(117, '<p>A. Tingkat kepuasan mahasiswa terhadap proses pendidikan.<br />\r\nTabel 5.c LKPS<br />\r\nAspek yang diukur: 1) Keandalan (reliability): kemampuan dosen, tenaga kependidikan, dan pengelola dalam memberikan pelayanan; 2) Daya tanggap (responsiveness): kemauan dari dosen, tenaga kependidikan, dan pengelola dalam membantu mahasiswa dan memberikan jasa dengan cepat; 3) Kepastian (assurance): kemampuan dosen, tenaga kependidikan, dan pengelola untuk memberi keyakinan kepada mahasiswa bahwa pelayanan yang diberikan telah sesuai dengan ketentuan; 4) Empati (empathy): kesediaan/kepedulian dosen, tenaga kependidikan, dan pengelola untuk memberi perhatian kepada mahasiswa; dan 5) Tangible: penilaian mahasiswa terhadap kecukupan, aksesibitas, kualitas sarana dan prasarana.</p>\r\n\r\n<p>B. Analisis dan tindak lanjut dari hasil pengukuran kepuasan mahasiswa.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 1),
(118, '<p>Relevansi penelitian pada UPPS mencakup unsur-unsur sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>memiliki peta jalan yang memayungi tema penelitian dosen dan mahasiswa,</li>\r\n	<li>dosen dan mahasiswa melaksanakan penelitian sesuai dengan agenda penelitian dosen yang merujuk kepada peta jalan penelitian.&nbsp;</li>\r\n	<li>melakukan evaluasi kesesuaian penelitian dosen dan mahasiswa dengan peta jalan, dan&nbsp;</li>\r\n	<li>menggunakan hasil evaluasi untuk perbaikan relevansi penelitian dan pengembangan keilmuan program studi.</li>\r\n</ol>', 1),
(119, '<p>Penelitian DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.<br />\r\nTabel 6.a LKPS</p>\r\n\r\n<p>NPM = Jumlah judul penelitian DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.</p>\r\n\r\n<p>NPD = Jumlah judul penelitian DTPS dalam 3 tahun terakhir.&nbsp;</p>\r\n\r\n<p>PPDM = (NPM / NPkMD) x 100%&nbsp;</p>', 1),
(120, '<p>Relevansi PkM pada UPPS mencakup unsur-unsur sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>memiliki peta jalan yang memayungi tema PkM dosen dan mahasiswa serta hilirisasi/penerapan keilmuan program studi,&nbsp;</li>\r\n	<li>dosen dan mahasiswa melaksanakan PkM sesuai dengan peta jalan PkM.&nbsp;</li>\r\n	<li>melakukan evaluasi kesesuaian PkM dosen dan mahasiswa dengan peta jalan, dan&nbsp;</li>\r\n	<li>menggunakan hasil evaluasi untuk perbaikan relevansi PkM dan pengembangan keilmuan program studi.</li>\r\n</ol>', 1),
(121, '<p>PkM DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.<br />\r\nTabel 7 LKPS</p>\r\n\r\n<p>NPkMM = Jumlah judul PkM DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.</p>\r\n\r\n<p>NPkMD = Jumlah judul PkM DTPS dalam 3 tahun terakhir.&nbsp;</p>\r\n\r\n<p>PPkMDM = (NPkMM / NPkMD) x 100%&nbsp;</p>', 1),
(122, '<p>Analisis pemenuhan capaian pembelajaran lulusan (CPL) yang diukur dengan metoda yang sahih dan relevan, mencakup aspek:</p>\r\n\r\n<ol>\r\n	<li>keserbacakupan,&nbsp;</li>\r\n	<li>kedalaman, dan&nbsp;</li>\r\n	<li>kebermanfaatan analisis yang ditunjukkan dengan peningkatan CPL dari waktu ke waktu dalam 3 tahun terakhir.</li>\r\n</ol>', 1),
(123, '<p>IPK lulusan.<br />\r\nTabel 8.a LKPS</p>\r\n\r\n<p>RIPK = Rata-rata IPK lulusan dalam 3 tahun terakhir.</p>', 1),
(124, '<p>Prestasi mahasiswa di bidang akademik dalam 3 tahun terakhir.<br />\r\nTabel 8.b.1) LKP</p>\r\n\r\n<p>RW = NW / NM</p>', 1),
(125, '<p>Prestasi mahasiswa di bidang nonakademik dalam 3 tahun terakhir.<br />\r\nTabel 8.b.2) LKPS</p>\r\n\r\n<p>RW = NW / NM</p>', 1),
(126, '<p>Masa studi.<br />\r\nTabel 8.c LKPS</p>', 1),
(127, '<p>Kelulusan tepat waktu.<br />\r\nTabel 8.c LKPS</p>', 1),
(128, '<p>Keberhasilan studi.<br />\r\nTabel 8.c LKPS</p>', 1),
(129, '<p>Pelaksanaan tracer study yang mencakup 5 aspek sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>pelaksanaan tracer study terkoordinasi di tingkat PT,</li>\r\n	<li>kegiatan tracer study dilakukan secara reguler setiap tahun dan terdokumentasi,</li>\r\n	<li>isi kuesioner mencakup seluruh pertanyaan inti tracer study DIKTI.</li>\r\n	<li>ditargetkan pada seluruh populasi (lulusan TS-4 s.d. TS-2),</li>\r\n	<li>hasilnya disosialisasikan dan digunakan untuk pengembangan kurikulum dan pembelajaran.&nbsp;</li>\r\n</ol>', 1),
(130, '<p>Waktu tunggu.<br />\r\nTabel 8.d.1) LKPS</p>', 1),
(131, '<p>Kesesuaian bidang kerja.&nbsp;<br />\r\nTabel 8.d.2) LKPS</p>', 1),
(132, '<p>Tingkat dan ukuran tempat kerja lulusan.<br />\r\nTabel 8.e.1) LKPS</p>', 1),
(133, '<p>Tingkat kepuasan pengguna lulusan.<br />\r\nTabel 8.e.2) LKPS</p>', 1),
(134, '<p>Publikasi ilmiah mahasiswa, yang dihasilkan secara mandiri atau bersama DTPS, dengan judul yang relevan dengan bidang program studi dalam 3 tahun terakhir.<br />\r\nTabel 8.f.1) LKPS</p>', 1),
(135, '<p>Luaran penelitian dan PkM yang dihasilkan mahasiswa, baik secara mandiri atau bersama DTPS dalam 3 tahun terakhir.<br />\r\nTabel 8.f.4) LKPS</p>', 1),
(136, '<p>Keserbacakupan (kelengkapan, keluasan, dan kedalaman), ketepatan, ketajaman, dan kesesuaian analisis capaian kinerja serta konsistensi dengan setiap kriteria.</p>', 1),
(137, '<p>Ketepatan analisis SWOT atau analisis yang relevan di dalam mengembangkan strategi.</p>', 1),
(138, '<p>Ketepatan di dalam menetapkan prioritas program pengembangan.</p>', 1),
(139, '<p>UPPS memiliki kebijakan, ketersediaan sumberdaya, kemampuan melaksanakan, dan kerealistikan program.</p>', 1),
(141, '<p>Konsistensi dengan hasil analisis SWOT dan/atau analisis lain serta rencana pengembangan ke depan.</p>', 3),
(142, '<p>Keserbacakupan informasi dalam profil dan konsistensi antara profil dengan data dan informasi yang disampaikan pada masing-masing kriteria, serta menunjukkan iklim yang kondusif untuk pengembangan dan reputasi sebagai rujukan di bidang keilmuannya.</p>', 3),
(143, '<p>Kesesuaian Visi, Misi, Tujuan dan Strategi (VMTS) Unit Pengelola Program Studi (UPPS) terhadap VMTS Perguruan Tinggi (PT) dan visi keilmuan Program Studi (PS) yang dikelolanya.</p>', 3),
(144, '<p>Mekanisme dan keterlibatan pemangku kepentingan dalam penyusunan VMTS UPPS.</p>', 3),
(145, '<p>Strategi pencapaian tujuan disusun berdasarkan analisis yang sistematis, serta pada pelaksanaannya dilakukan pemantauan dan evaluasi yang ditindak lanjuti.&nbsp;</p>', 3),
(146, '<p>A. Kelengkapan struktur organisasi dan keefektifan penyelenggaraan organisasi.</p>\r\n<p>B. Perwujudan good governance dan pemenuhan lima pilar sistem tata pamong, yang mencakup:</p>\r\n\r\n<ol>\r\n	<li>Kredibel,</li>\r\n	<li>Transparan,</li>\r\n	<li>Akuntabel,</li>\r\n	<li>Bertanggung jawab,</li>\r\n	<li>Adil.</li>\r\n</ol>\r\n<p>Skor = (A + (2 x B)) / 3</p>', 3),
(147, '<p>A. Komitmen pimpinan UPPS.</p>\r\n<p>B. Kapabilitas pimpinan UPPS, mencakup aspek:</p>\r\n\r\n<ol>\r\n	<li>perencanaan,</li>\r\n	<li>pengorganisasian,</li>\r\n	<li>penempatan personel,</li>\r\n	<li>pelaksanaan,</li>\r\n	<li>pengendalian dan pengawasan, dan</li>\r\n	<li>pelaporan yang menjadi dasar tindak lanjut.&nbsp;</li>\r\n</ol>\r\n<p>Skor = (A + (2 x B)) / 3</p>', 3),
(148, '<p>Mutu, manfaat, kepuasan dan keberlanjutan kerjasama pendidikan, penelitian dan PkM yang relevan dengan program studi. UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi 3 aspek berikut:</p>\r\n\r\n<ol>\r\n	<li>memberikan manfaat bagi program studi dalam pemenuhan proses pembelajaran, penelitian, PkM.</li>\r\n	<li>memberikan peningkatan kinerja tridharma dan fasilitas pendukung program studi.</li>\r\n	<li>memberikan kepuasan kepada mitra industri dan mitra kerjasama lainnya, serta menjamin keberlanjutan kerjasama dan hasilnya.</li>\r\n</ol>', 3),
(149, '<p>A. Kerjasama perguruan tinggi di bidang pendidikan, penelitian dan PkM dalam 3 tahun terakhir.</p>\r\n<p>B. Kerjasama tingkat internasional, nasional, wilayah/lokal yang relevan dengan program studi dan dikelola oleh UPPS dalam 3 tahun terakhir.\r\nTabel 1 LKPS</p>', 3),
(150, '<p>Pelampauan SN-DIKTI (indikator kinerja tambahan) yang ditetapkan oleh UPPS pada tiap kriteria.</p>', 3),
(151, '<p>Analisis keberhasilan dan/atau ketidakberhasilan pencapaian kinerja yang telah ditetapkan institusi yang memenuhi 2 aspek sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>capaian kinerja harus diukur dengan metoda yang tepat, dan hasilnya dianalisis serta dievaluasi, dan</li>\r\n	<li>analisis terhadap capaian kinerja mencakup identifikasi akar masalah, faktor pendukung keberhasilan dan faktor penghambat ketercapaian standar, dan deskripsi singkat tindak lanjut yang akan dilakukan.</li>\r\n</ol>', 3),
(152, '<p>Keterlaksanaan Sistem Penjaminan Mutu Internal (akademik dan nonakademik) yang dibuktikan dengan keberadaan 5 aspek:</p>\r\n\r\n<ol>\r\n	<li>dokumen legal pembentukan unsur pelaksana penjaminan mutu.</li>\r\n	<li>ketersediaan dokumen mutu: kebijakan SPMI, manual SPMI, standar SPMI, dan formulir SPMI.</li>\r\n	<li>terlaksananya siklus penjaminan mutu (siklus PPEPP).</li>\r\n	<li>bukti sahih efektivitas pelaksanaan penjaminan mutu.</li>\r\n	<li>memiliki external benchmarking dalam peningkatan mutu.</li>\r\n</ol>', 3),
(153, '<p>Pengukuran kepuasan layanan manajemen terhadap para pemangku kepentingan: mahasiswa, dosen, tenaga kependidikan, lulusan, pengguna dan mitra yang memenuhi aspek-aspek berikut:</p>\r\n\r\n<ol>\r\n	<li>menggunakan instrumen kepuasan yang sahih, andal, mudah digunakan,</li>\r\n	<li>dilaksanakan secara berkala, serta datanya terekam secara komprehensif,&nbsp;</li>\r\n	<li>dianalisis dengan metode yang tepat serta bermanfaat untuk pengambilan keputusan,</li>\r\n	<li>tingkat kepuasan dan umpan balik ditindaklanjuti untuk perbaikan dan peningkatan mutu luaran secara berkala dan tersistem,</li>\r\n	<li>dilakukan review terhadap pelaksanaan pengukuran kepuasan dosen dan mahasiswa, serta</li>\r\n	<li>hasilnya dipublikasikan dan mudah diakses oleh dosen dan mahasiswa.</li>\r\n</ol>', 3),
(154, '<p>Metoda rekrutmen dan keketatan seleksi.<br />\r\nTabel 2.a LKPS</p>', 3),
(155, '<p>A. Peningkatan animo calon mahasiswa.<br />\r\nTabel 2.a LKPS</p>', 3),
(156, '<p>A. Ketersediaan layanan kemahasiswaan di bidang:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>penalaran, minat dan bakat,</li>\r\n	<li>kesejahteraan (bimbingan dan konseling, layanan beasiswa, dan layanan kesehatan), dan</li>\r\n	<li>bimbingan karir dan kewirausahaan.</li>\r\n</ol>\r\n\r\n<p>B. Akses dan mutu layanan kemahasiswaan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 3),
(157, '<p>Kecukupan jumlah DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>', 3),
(158, '<p>Kualifikasi akademik DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDS3 = Jumlah DTPS yang berpendidikan tertinggi Doktor/Doktor Terapan/Subspesialis.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>PDS3 = (NDS3 / NDTPS) x 100%</p>', 3),
(159, '<p>Jabatan akademik DTPS.<br />\r\nTabel 3.a.1) LKPS</p>\r\n\r\n<p>NDGB = Jumlah DTPS yang memiliki jabatan akademik Guru Besar.</p>\r\n\r\n<p>NDLK = Jumlah DTPS yang memiliki jabatan akademik Lektor Kepala.</p>\r\n\r\n<p>PGBLKL = ((NDGB + NDLK + NDL) / NDTPS) x 100%</p>', 3),
(160, '<p>Rasio jumlah mahasiswa program studi terhadap jumlah DTPS.<br />\r\nTabel 2.a LKPS dan Tabel 3.a.1) LKPS</p>\r\n\r\n<p>NM = Jumlah mahasiswa pada saat TS.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RMD = NM / NDTPS</p>', 3),
(161, '<p>Penugasan DTPS sebagai pembimbing utama tugas akhir mahasiswa.<br />\r\nTabel 3.a.2) LKPS&nbsp;</p>\r\n\r\n<p>RDPUPS = Rata-rata jumlah mahasiswa yang dibimbing pada PS yang diakreditasi</p>\r\n\r\n<p>RDPUL = Rata-rata jumlah mahasiswa yang dibimbing pada PS lain di PT</p>\r\n\r\n<p>RDPU = (RDUPS + RDPUL) / 2</p>', 3);
INSERT INTO `indikators` (`id`, `dec`, `jenjang_id`) VALUES
(162, '<p>Ekuivalensi Waktu Mengajar Penuh DTPS.<br />\r\nTabel 3.a.3) LKPS</p>\r\n\r\n<p>EWMPDT = Rata-rata EWMP DT per semester pada saat TS.</p>\r\n\r\n<p>EWMPDTPS = Rata-rata EWMP DTPS per semester pada saat TS.</p>\r\n\r\n<p>EWMP = EWMPDTPS</p>', 3),
(163, '<p>Dosen tidak tetap.<br />\r\nTabel 3.a.4) LKPS</p>\r\n\r\n<p>NDTT = Jumlah dosen tidak tetap yang ditugaskan sebagai pengampu mata kuliah di program studi yang diakreditasi.</p>\r\n\r\n<p>NDT = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah di program studi yang diakreditasi.</p>\r\n\r\n<p>PDTT = (NDTT / (NDTT + NDT)) x 100%</p>', 3),
(164, '<p>Pengakuan/rekognisi atas kepakaran/prestasi/kinerja DTPS.<br />\r\nPengakuan/rekognisi atas kepakaran/prestasi/kinerja DTPS dapat berupa:</p>\r\n\r\n<ol>\r\n	<li>menjadi staf ahli/tenaga ahli/narasumber di lembaga tingkat wilayah/nasional/ internasional pada bidang yang sesuai dengan bidang program studi.</li>\r\n	<li>menjadi visiting lecturer atau visiting scholar di program studi/perguruan tinggi terakreditasi A/Unggul atau program studi/perguruan tinggi internasional bereputasi.</li>\r\n	<li>menjadi invited speaker pada pertemuan ilmiah tingkat wilayah/nasional/ internasional.</li>\r\n	<li>menjadi editor atau mitra bestari pada jurnal nasional terakreditasi/jurnal internasional bereputasi di bidang yang sesuai dengan bidang program studi.</li>\r\n</ol>\r\n\r\n<p>Tabel 3.b.1) LKPS</p>\r\n\r\n<p>NRD = Jumlah pengakuan atas prestasi/kinerja DTPS yang relevan dengan bidang keahlian dalam 3 tahun terakhir.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RRD = NRD / NDTPS&nbsp;</p>', 3),
(165, '<p>Kegiatan penelitian DTPS yang relevan dengan bidang program studi dalam 3 tahun terakhir.<br />\r\nTabel 3.b.2) LKPS</p>\r\n\r\n<p>NI = Jumlah penelitian dengan sumber pembiayaan luar negeri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NN = Jumlah penelitian dengan sumber pembiayaan dalam negeri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NL = Jumlah penelitian dengan sumber pembiayaan PT/mandiri dalam 3 tahun terakhir.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RI = NI / 3 / NDTPS</p>\r\n\r\n<p>RN = NN / 3 / NDTPS</p>\r\n\r\n<p>RL = NL / 3 / NDTPS</p>', 3),
(166, '<p>Kegiatan PkM DTPS yang relevan dengan bidang program studi dalam 3 tahun terakhir.</p>', 3),
(167, '<p>Publikasi ilmiah dengan tema yang relevan dengan bidang program studi yang dihasilkan DTPS dalam 3 tahun terakhir.<br />\r\nTabel 3.b.4) LKPS</p>', 3),
(168, '<p>Artikel karya ilmiah DTPS yang disitasi dalam 3 tahun terakhir.<br />\r\nTabel 3.b.5) LKPS</p>\r\n\r\n<p>NAS = Jumlah judul artikel yang disitasi.</p>\r\n\r\n<p>NDTPS = Jumlah dosen tetap yang ditugaskan sebagai pengampu mata kuliah dengan bidang keahlian yang sesuai dengan kompetensi inti program studi yang diakreditasi.</p>\r\n\r\n<p>RS = NAS / NDTPS</p>', 3),
(169, '<p>Luaran penelitian dan PkM yang dihasilkan DTPS dalam 3 tahun terakhir.<br />\r\nTabel 3.b.7) LKPS</p>', 3),
(170, '<p>Upaya pengembangan dosen.<br />\r\nCatatan: Jika Skor rata-rata butir Profil Dosen &ge; 3,5 , maka Skor = 4.</p>', 3),
(171, '<p>A. Kualifikasi dan kecukupan tenaga kependidikan berdasarkan jenis pekerjaannya (administrasi, pustakawan, teknisi, dll.)<br />\r\nCatatan: Penilaian kecukupan tidak hanya ditentukan oleh jumlah tenaga kependidikan, namun keberadaan dan pemanfaatan teknologi informasi dan komputer dalam proses administrasi dapat dijadikan pertimbangan untuk menilai efektifitas pekerjaan dan kebutuhan akan tenaga kependidikan.</p>\r\n\r\n<p>B. Akses dan mutu layanan kemahasiswaan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 3),
(172, '<p>Biaya operasional pendidikan.<br />\r\nTabel 4 LKPS</p>\r\n\r\n<p>BOP = Biaya operasional pendidikan dalam 3 tahun terakhir.</p>\r\n\r\n<p>NM = Jumlah mahasiswa aktif pada saat TS.</p>\r\n\r\n<p>DOP = Rata-rata dana operasional pendidikan/mahasiswa/ tahun dalam 3 tahun terakhir = BOP / 3 / NM</p>', 3),
(173, '<p>Dana penelitian DTPS.<br />\r\nTabel 4 LKPS</p>', 3),
(174, '<p>Dana pengabdian kepada masyarakat DTPS.<br />\r\nTabel 4 LKPS</p>', 3),
(175, '<p>Realisasi investasi (SDM, sarana dan prasarana) yang mendukung penyelenggaraan tridharma.<br />\r\nCatatan: Jika Skor rata-rata butir tentang Profil Dosen, Sarana, dan Prasarana &ge; 3,5 , maka Skor butir ini = 4.</p>', 3),
(176, '<p>Kecukupan dana untuk menjamin pencapaian capaian pembelajaran.</p>', 3),
(177, '<p>Kecukupan, aksesibilitas dan mutu sarana dan prasarana untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 3),
(178, '<p>A. Keterlibatan pemangku kepentingan dalam proses evaluasi dan pemutakhiran kurikulum.</p>\r\n\r\n<p>B. Kesesuaian capaian pembelajaran dengan profil lulusan dan jenjang KKNI/SKKNI.</p>\r\n\r\n<p>C. Ketepatan struktur kurikulum dalam pembentukan capaian pembelajaran.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C)) / 5</p>', 3),
(179, '<p>Pemenuhan karakteristik proses pembelajaran, yang terdiri atas sifat:</p>\r\n\r\n<ol>\r\n	<li>interaktif,</li>\r\n	<li>holistik,</li>\r\n	<li>integratif,</li>\r\n	<li>saintifik,</li>\r\n	<li>kontekstual,</li>\r\n	<li>tematik,</li>\r\n	<li>efektif,</li>\r\n	<li>kolaboratif, dan</li>\r\n	<li>berpusat pada mahasiswa.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', 3),
(180, '<p>A. Ketersediaan dan kelengkapan dokumen rencana pembelajaran semester (RPS)&nbsp;</p>\r\n\r\n<p>B. Kedalaman dan keluasan RPS sesuai dengan capaian pembelajaran lulusan.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 3),
(181, '<p>A. Bentuk interaksi antara dosen, mahasiswa dan sumber belajar</p>\r\n\r\n<p>B. Pemantauan kesesuaian proses terhadap rencana pembelajaran</p>\r\n\r\n<p>C. Proses pembelajaran yang terkait dengan penelitian harus mengacu SN Dikti Penelitian: 1) hasil penelitian: harus memenuhi pengembangan IPTEKS, meningkatkan kesejahteraan masyarakat, dan daya saing bangsa. 2) isi penelitian: memenuhi kedalaman dan keluasan materi penelitian sesuai capaian pembelajaran. 3) proses penelitian: mencakup perencanaan, pelaksanaan, dan pelaporan. 4) penilaian penelitian memenuhi unsur edukatif, obyektif, akuntabel, dan transparan.</p>\r\n\r\n<p>D. Proses pembelajaran yang terkait dengan PkM harus mengacu SN Dikti PkM: 1) hasil PkM: harus memenuhi pengembangan IPTEKS, meningkatkan kesejahteraan masyarakat, dan daya saing bangsa. 2) isi PkM: memenuhi kedalaman dan keluasan materi PkM sesuai capaian pembelajaran. 3) proses PkM: &nbsp;mencakup perencanaan, pelaksanaan, dan pelaporan. 4) penilaian PkM memenuhi unsur edukatif, obyektif, akuntabel, dan transparan.</p>\r\n\r\n<p>E. Kesesuaian metode pembelajaran dengan capaian pembelajaran. Contoh: RBE (research based education), IBE (industry based education), teaching factory/teaching industry, dll.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C) + (2 x D) + (2 x E)) / 9</p>', 3),
(182, '<p>Pembelajaran yang dilaksanakan dalam bentuk praktikum, praktik studio, praktik bengkel, atau praktik lapangan.<br />\r\nTabel 5.a LKPS</p>\r\n\r\n<p>JP = Jam pembelajaran praktikum, praktik studio, praktik bengkel, atau praktik lapangan (termasuk KKN)</p>\r\n\r\n<p>JB = Jam pembelajaran total selama masa pendidikan.</p>\r\n\r\n<p>PJP = (JP / JB) x 100%</p>', 3),
(183, '<p>Monitoring dan evaluasi pelaksanaan proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa untuk memperoleh capaian pembelajaran lulusan.</p>', 3),
(184, '<p>A. Mutu pelaksanaan penilaian pembelajaran (proses dan hasil belajar mahasiswa) untuk mengukur ketercapaian capaian pembelajaran berdasarkan prinsip penilaian yang mencakup: 1) edukatif, 2) otentik, 3) objektif, 4) akuntabel, dan 5) transparan, yang dilakukan secara terintegrasi.</p>\r\n\r\n<p>B. Pelaksanaan penilaian terdiri atas teknik dan instrumen penilaian.&nbsp;<br />\r\nTeknik penilaian terdiri dari: 1) observasi, 2) partisipasi, 3) unjuk kerja, 4) test tertulis, 5) test lisan, dan 6) angket.<br />\r\nInstrumen penilaian terdiri dari: 1) penilaian proses dalam bentuk rubrik, dan/ atau; 2) penilaian hasil dalam bentuk portofolio, atau 3) karya disain.</p>\r\n\r\n<p>C. Pelaksanaan penilaian memuat unsur-unsur sebagai berikut: 1) mempunyai kontrak rencana penilaian, 2) melaksanakan penilaian sesuai kontrak atau kesepakatan, 3) memberikan umpan balik dan memberi kesempatan untuk mempertanyakan hasil kepada mahasiswa, 4) mempunyai dokumentasi penilaian proses dan hasil belajar mahasiswa, 5) mempunyai prosedur yang mencakup tahap perencanaan, kegiatan pemberian tugas atau soal, observasi kinerja, pengembalian hasil observasi, dan pemberian nilai akhir, 6) pelaporan penilaian berupa kualifikasi keberhasilan mahasiswa dalam menempuh suatu mata kuliah dalam bentuk huruf dan angka, 7) mempunyai bukti-bukti rencana dan telah melakukan proses perbaikan berdasar hasil monev penilaian.</p>\r\n\r\n<p>Skor = (A + (2 x B) + (2 x C)) / 5</p>', 3),
(185, '<p>Integrasi kegiatan penelitian dan PkM dalam pembelajaran oleh DTPS dalam 3 tahun terakhir.<br />\r\nTabel 5.b LKPS</p>\r\n\r\n<p>MK = Jumlah mata kuliah yang dikembangkan berdasarkan hasil penelitian/PkM DTPS dalam 3 tahun terakhir.</p>', 3),
(186, '<p>Keterlaksanaan dan keberkalaan program dan kegiatan diluar kegiatan pembelajaran terstruktur untuk meningkatkan suasana akademik.<br />\r\nContoh: kegiatan himpunan mahasiswa, kuliah umum/studium generale, seminar ilmiah, bedah buku.</p>', 3),
(187, '<p>A. Tingkat kepuasan mahasiswa terhadap proses pendidikan.<br />\r\nTabel 5.c LKPS<br />\r\nAspek yang diukur: 1) Keandalan (reliability): kemampuan dosen, tenaga kependidikan, dan pengelola dalam memberikan pelayanan; 2) Daya tanggap (responsiveness): kemauan dari dosen, tenaga kependidikan, dan pengelola dalam membantu mahasiswa dan memberikan jasa dengan cepat; 3) Kepastian (assurance): kemampuan dosen, tenaga kependidikan, dan pengelola untuk memberi keyakinan kepada mahasiswa bahwa pelayanan yang diberikan telah sesuai dengan ketentuan; 4) Empati (empathy): kesediaan/kepedulian dosen, tenaga kependidikan, dan pengelola untuk memberi perhatian kepada mahasiswa; dan 5) Tangible: penilaian mahasiswa terhadap kecukupan, aksesibitas, kualitas sarana dan prasarana.</p>\r\n\r\n<p>B. Analisis dan tindak lanjut dari hasil pengukuran kepuasan mahasiswa.</p>\r\n\r\n<p>Skor = (A + (2 x B)) / 3</p>', 3),
(188, '<p>Relevansi penelitian pada UPPS mencakup unsur-unsur sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>memiliki peta jalan yang memayungi tema penelitian dosen dan mahasiswa,</li>\r\n	<li>dosen dan mahasiswa melaksanakan penelitian sesuai dengan agenda penelitian dosen yang merujuk kepada peta jalan penelitian.&nbsp;</li>\r\n	<li>melakukan evaluasi kesesuaian penelitian dosen dan mahasiswa dengan peta jalan, dan&nbsp;</li>\r\n	<li>menggunakan hasil evaluasi untuk perbaikan relevansi penelitian dan pengembangan keilmuan program studi.</li>\r\n</ol>', 3),
(189, '<p>Penelitian DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.<br />\r\nTabel 6.a LKPS</p>\r\n\r\n<p>NPM = Jumlah judul penelitian DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.</p>\r\n\r\n<p>NPD = Jumlah judul penelitian DTPS dalam 3 tahun terakhir.&nbsp;</p>\r\n\r\n<p>PPDM = (NPM / NPkMD) x 100%&nbsp;</p>', 3),
(190, '<p>Relevansi PkM pada UPPS mencakup unsur-unsur sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>memiliki peta jalan yang memayungi tema PkM dosen dan mahasiswa serta hilirisasi/penerapan keilmuan program studi,&nbsp;</li>\r\n	<li>dosen dan mahasiswa melaksanakan PkM sesuai dengan peta jalan PkM.&nbsp;</li>\r\n	<li>melakukan evaluasi kesesuaian PkM dosen dan mahasiswa dengan peta jalan, dan&nbsp;</li>\r\n	<li>menggunakan hasil evaluasi untuk perbaikan relevansi PkM dan pengembangan keilmuan program studi.</li>\r\n</ol>', 3),
(191, '<p>PkM DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.<br />\r\nTabel 7 LKPS</p>\r\n\r\n<p>NPkMM = Jumlah judul PkM DTPS yang dalam pelaksanaannya melibatkan mahasiswa program studi dalam 3 tahun terakhir.</p>\r\n\r\n<p>NPkMD = Jumlah judul PkM DTPS dalam 3 tahun terakhir.&nbsp;</p>\r\n\r\n<p>PPkMDM = (NPkMM / NPkMD) x 100%&nbsp;</p>', 3),
(192, '<p>Analisis pemenuhan capaian pembelajaran lulusan (CPL) yang diukur dengan metoda yang sahih dan relevan, mencakup aspek:</p>\r\n\r\n<ol>\r\n	<li>keserbacakupan,&nbsp;</li>\r\n	<li>kedalaman, dan&nbsp;</li>\r\n	<li>kebermanfaatan analisis yang ditunjukkan dengan peningkatan CPL dari waktu ke waktu dalam 3 tahun terakhir.</li>\r\n</ol>', 3),
(193, '<p>IPK lulusan.<br />\r\nTabel 8.a LKPS</p>\r\n\r\n<p>RIPK = Rata-rata IPK lulusan dalam 3 tahun terakhir.</p>', 3),
(194, '<p>Prestasi mahasiswa di bidang akademik dalam 3 tahun terakhir.<br />\r\nTabel 8.b.1) LKP</p>\r\n\r\n<p>RW = NW / NM</p>', 3),
(195, '<p>Prestasi mahasiswa di bidang nonakademik dalam 3 tahun terakhir.<br />\r\nTabel 8.b.2) LKPS</p>\r\n\r\n<p>RW = NW / NM</p>', 3),
(196, '<p>Masa studi.<br />\r\nTabel 8.c LKPS</p>', 3),
(197, '<p>Kelulusan tepat waktu.<br />\r\nTabel 8.c LKPS</p>', 3),
(198, '<p>Keberhasilan studi.<br />\r\nTabel 8.c LKPS</p>', 3),
(199, '<p>Pelaksanaan tracer study yang mencakup 5 aspek sebagai berikut:&nbsp;</p>\r\n\r\n<ol>\r\n	<li>pelaksanaan tracer study terkoordinasi di tingkat PT,</li>\r\n	<li>kegiatan tracer study dilakukan secara reguler setiap tahun dan terdokumentasi,</li>\r\n	<li>isi kuesioner mencakup seluruh pertanyaan inti tracer study DIKTI.</li>\r\n	<li>ditargetkan pada seluruh populasi (lulusan TS-4 s.d. TS-2),</li>\r\n	<li>hasilnya disosialisasikan dan digunakan untuk pengembangan kurikulum dan pembelajaran.&nbsp;</li>\r\n</ol>', 3),
(200, '<p>Waktu tunggu.<br />\r\nTabel 8.d.1) LKPS</p>', 3),
(201, '<p>Kesesuaian bidang kerja.&nbsp;<br />\r\nTabel 8.d.2) LKPS</p>', 3),
(202, '<p>Tingkat dan ukuran tempat kerja lulusan.<br />\r\nTabel 8.e.1) LKPS</p>', 3),
(203, '<p>Tingkat kepuasan pengguna lulusan.<br />\r\nTabel 8.e.2) LKPS</p>', 3),
(204, '<p>Publikasi ilmiah mahasiswa, yang dihasilkan secara mandiri atau bersama DTPS, dengan judul yang relevan dengan bidang program studi dalam 3 tahun terakhir.<br />\r\nTabel 8.f.1) LKPS</p>', 3),
(205, '<p>Luaran penelitian dan PkM yang dihasilkan mahasiswa, baik secara mandiri atau bersama DTPS dalam 3 tahun terakhir.<br />\r\nTabel 8.f.4) LKPS</p>', 3),
(206, '<p>Keserbacakupan (kelengkapan, keluasan, dan kedalaman), ketepatan, ketajaman, dan kesesuaian analisis capaian kinerja serta konsistensi dengan setiap kriteria.</p>', 3),
(207, '<p>Ketepatan analisis SWOT atau analisis yang relevan di dalam mengembangkan strategi.</p>', 3),
(208, '<p>Ketepatan di dalam menetapkan prioritas program pengembangan.</p>', 3),
(209, '<p>UPPS memiliki kebijakan, ketersediaan sumberdaya, kemampuan melaksanakan, dan kerealistikan program.</p>', 3);

-- --------------------------------------------------------

--
-- Table structure for table `jenjangs`
--

CREATE TABLE `jenjangs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `kode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenjangs`
--

INSERT INTO `jenjangs` (`id`, `name`, `kode`) VALUES
(0, '0', 'NULL'),
(1, 'Strata Satu', 'S1'),
(2, 'Strata Dua', 'S2'),
(3, 'Profesi', 'Profesi');

-- --------------------------------------------------------

--
-- Table structure for table `l1_s`
--

CREATE TABLE `l1_s` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `jenjang_id` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `l1_s`
--

INSERT INTO `l1_s` (`id`, `name`, `jenjang_id`, `created_at`, `updated_at`) VALUES
(0, NULL, 0, '2022-02-13 04:24:38', '2022-02-13 04:24:39'),
(1, 'A. Kondisi Eksternal', 2, '2022-02-11 21:47:56', '2022-02-11 21:47:56'),
(2, 'B. Profil Unit Pengelola Program Studi', 2, '2022-02-11 21:48:12', '2022-02-11 21:48:12'),
(3, 'C.1. Visi, Misi, Tujuan dan Strategi', 2, '2022-02-11 21:48:28', '2022-02-11 21:48:28'),
(4, 'C.2. Tata Pamong, Tata Kelola dan Kerjasama', 2, '2022-02-11 21:48:45', '2022-02-11 21:48:45'),
(5, 'C.3. Mahasiswa', 2, '2022-02-11 21:49:03', '2022-02-11 21:49:03'),
(6, 'C.4. Sumber Daya Manusia', 2, '2022-02-11 21:49:17', '2022-02-11 21:49:17'),
(7, 'C.5. Keuangan, Sarana dan Prasarana', 2, '2022-02-11 21:49:38', '2022-02-11 21:49:38'),
(8, 'C.6. Pendidikan', 2, '2022-02-11 21:49:53', '2022-02-11 21:49:53'),
(9, 'C.7. Penelitian', 2, '2022-02-11 21:50:08', '2022-02-11 21:50:08'),
(10, 'C.8. Pengabdian kepada Masyarakat', 2, '2022-02-11 21:50:27', '2022-02-11 21:50:27'),
(11, 'C.9. Luaran dan Capaian Tridharma', 2, '2022-02-11 21:50:44', '2022-02-11 21:50:44'),
(12, 'D. Analisis dan Penetapan Program Pengembangan', 2, '2022-02-11 21:51:04', '2022-02-11 21:51:04'),
(13, 'A. Kondisi Eksternal', 1, '2022-02-11 21:47:56', '2022-02-11 21:47:56'),
(14, 'B. Profil Unit Pengelola Program Studi', 1, '2022-02-11 21:48:12', '2022-02-11 21:48:12'),
(15, 'C.1. Visi, Misi, Tujuan dan Strategi', 1, '2022-02-11 21:48:28', '2022-02-11 21:48:28'),
(16, 'C.2. Tata Pamong, Tata Kelola dan Kerjasama', 1, '2022-02-11 21:48:45', '2022-02-11 21:48:45'),
(17, 'C.3. Mahasiswa', 1, '2022-02-11 21:49:03', '2022-02-11 21:49:03'),
(18, 'C.4. Sumber Daya Manusia', 1, '2022-02-11 21:49:17', '2022-02-11 21:49:17'),
(19, 'C.5. Keuangan, Sarana dan Prasarana', 1, '2022-02-11 21:49:38', '2022-02-11 21:49:38'),
(20, 'C.6. Pendidikan', 1, '2022-02-11 21:49:53', '2022-02-11 21:49:53'),
(21, 'C.7. Penelitian', 1, '2022-02-11 21:50:08', '2022-02-11 21:50:08'),
(22, 'C.8. Pengabdian kepada Masyarakat', 1, '2022-02-11 21:50:27', '2022-02-11 21:50:27'),
(23, 'C.9. Luaran dan Capaian Tridharma', 1, '2022-02-11 21:50:44', '2022-02-11 21:50:44'),
(24, 'D. Analisis dan Penetapan Program Pengembangan', 1, '2022-02-11 21:51:04', '2022-02-11 21:51:04'),
(25, 'A. Kondisi Eksternal', 3, '2022-02-11 21:47:56', '2022-02-11 21:47:56'),
(26, 'B. Profil Unit Pengelola Program Studi', 3, '2022-02-11 21:48:12', '2022-02-11 21:48:12'),
(27, 'C.1. Visi, Misi, Tujuan dan Strategi', 3, '2022-02-11 21:48:28', '2022-02-11 21:48:28'),
(28, 'C.2. Tata Pamong, Tata Kelola dan Kerjasama', 3, '2022-02-11 21:48:45', '2022-02-11 21:48:45'),
(29, 'C.3. Mahasiswa', 3, '2022-02-11 21:49:03', '2022-02-11 21:49:03'),
(30, 'C.4. Sumber Daya Manusia', 3, '2022-02-11 21:49:17', '2022-02-11 21:49:17'),
(31, 'C.5. Keuangan, Sarana dan Prasarana', 3, '2022-02-11 21:49:38', '2022-02-11 21:49:38'),
(32, 'C.6. Pendidikan', 3, '2022-02-11 21:49:53', '2022-02-11 21:49:53'),
(33, 'C.7. Penelitian', 3, '2022-02-11 21:50:08', '2022-02-11 21:50:08'),
(34, 'C.8. Pengabdian kepada Masyarakat', 3, '2022-02-11 21:50:27', '2022-02-11 21:50:27'),
(35, 'C.9. Luaran dan Capaian Tridharma', 3, '2022-02-11 21:50:44', '2022-02-11 21:50:44'),
(36, 'D. Analisis dan Penetapan Program Pengembangan', 3, '2022-02-11 21:51:04', '2022-02-11 21:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `l2_s`
--

CREATE TABLE `l2_s` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `l1_id` int(11) DEFAULT 0,
  `jenjang_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `l2_s`
--

INSERT INTO `l2_s` (`id`, `name`, `l1_id`, `jenjang_id`, `created_at`, `updated_at`) VALUES
(0, NULL, 0, 0, '2022-02-13 04:21:37', '2022-02-13 04:21:38'),
(1, 'A.1', 1, 2, '2022-02-12 22:26:21', '2022-05-22 20:10:52'),
(2, 'B.1', 2, 2, '2022-02-18 19:46:21', '2022-02-18 19:46:21'),
(3, 'C.1.4. Indikator Kinerja Utama', 3, 2, '2022-02-18 19:50:50', '2022-02-18 19:50:50'),
(4, 'C.2.4. Indikator Kinerja Utama', 4, 2, '2022-02-18 19:51:31', '2022-02-18 19:51:31'),
(5, 'C.2.5 Indikator Kinerja Tambahan', 4, 2, '2022-02-23 20:54:33', '2022-02-23 20:54:33'),
(6, 'C.2.6 Evaluasi Capaian Kinerja', 4, 2, '2022-02-23 20:55:13', '2022-02-23 20:55:13'),
(7, 'C.2.7 Penjaminan Mutu', 4, 2, '2022-02-23 20:55:57', '2022-02-23 20:55:57'),
(8, 'C.2.8 Kepuasan pemangku kepentingan', 4, 2, '2022-02-23 20:56:39', '2022-02-23 20:56:39'),
(9, 'C.3.4 Indikator Kinerja Utama', 5, 2, '2022-02-23 20:57:55', '2022-02-23 20:57:55'),
(10, 'C.4.4 Indikator Kinerja Utama', 6, 2, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(11, 'C.5.4 Indikator Kinerja Utama', 7, 2, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(12, 'C.6.4 Indikator Kinerja Utama', 8, 2, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(13, 'C.7.4 Indikator Kinerja Utama', 9, 2, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(14, 'C.8.4 Indikator Kinerja Utama', 10, 2, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(15, 'C.9.4 Indikator Kinerja Utama', 11, 2, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(16, 'D.1 Analisis dan Capaian Kinerja', 12, 2, '2022-02-24 00:19:17', '2022-02-24 00:19:17'),
(17, 'D.2 Analisis SWOT atau Analisis  Lain yang Relevan', 12, 2, '2022-02-24 00:19:48', '2022-02-24 00:19:48'),
(18, 'D.3 Program Pengembangan', 12, 2, '2022-02-24 00:20:15', '2022-02-24 00:20:15'),
(19, 'D.4 Program Keberlanjutan', 12, 2, '2022-02-24 00:20:46', '2022-02-24 00:20:46'),
(20, 'A.1', 13, 1, '2022-02-12 22:26:21', '2022-05-22 20:10:52'),
(21, 'B.1', 14, 1, '2022-02-18 19:46:21', '2022-02-18 19:46:21'),
(22, 'C.1.4. Indikator Kinerja Utama', 15, 1, '2022-02-18 19:50:50', '2022-02-18 19:50:50'),
(23, 'C.2.4. Indikator Kinerja Utama', 16, 1, '2022-02-18 19:51:31', '2022-02-18 19:51:31'),
(24, 'C.2.5 Indikator Kinerja Tambahan', 16, 1, '2022-02-23 20:54:33', '2022-02-23 20:54:33'),
(25, 'C.2.6 Evaluasi Capaian Kinerja', 16, 1, '2022-02-23 20:55:13', '2022-02-23 20:55:13'),
(26, 'C.2.7 Penjaminan Mutu', 16, 1, '2022-02-23 20:55:57', '2022-02-23 20:55:57'),
(27, 'C.2.8 Kepuasan pemangku kepentingan', 16, 1, '2022-02-23 20:56:39', '2022-02-23 20:56:39'),
(28, 'C.3.4 Indikator Kinerja Utama', 17, 1, '2022-02-23 20:57:55', '2022-02-23 20:57:55'),
(29, 'C.4.4 Indikator Kinerja Utama', 18, 1, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(30, 'C.5.4 Indikator Kinerja Utama', 19, 1, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(31, 'C.6.4 Indikator Kinerja Utama', 20, 1, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(32, 'C.7.4 Indikator Kinerja Utama', 21, 1, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(33, 'C.8.4 Indikator Kinerja Utama', 22, 1, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(34, 'C.9.4 Indikator Kinerja Utama', 23, 1, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(35, 'D.1 Analisis dan Capaian Kinerja', 24, 1, '2022-02-24 00:19:17', '2022-02-24 00:19:17'),
(36, 'D.2 Analisis SWOT atau Analisis  Lain yang Relevan', 24, 1, '2022-02-24 00:19:48', '2022-02-24 00:19:48'),
(37, 'D.3 Program Pengembangan', 24, 1, '2022-02-24 00:20:15', '2022-02-24 00:20:15'),
(38, 'D.4 Program Keberlanjutan', 24, 1, '2022-02-24 00:20:46', '2022-02-24 00:20:46'),
(39, 'A.1', 25, 3, '2022-02-12 22:26:21', '2022-05-22 20:10:52'),
(40, 'B.1', 26, 3, '2022-02-18 19:46:21', '2022-02-18 19:46:21'),
(41, 'C.1.4. Indikator Kinerja Utama', 27, 3, '2022-02-18 19:50:50', '2022-02-18 19:50:50'),
(42, 'C.2.4. Indikator Kinerja Utama', 28, 3, '2022-02-18 19:51:31', '2022-02-18 19:51:31'),
(43, 'C.2.5 Indikator Kinerja Tambahan', 28, 3, '2022-02-23 20:54:33', '2022-02-23 20:54:33'),
(44, 'C.2.6 Evaluasi Capaian Kinerja', 28, 3, '2022-02-23 20:55:13', '2022-02-23 20:55:13'),
(45, 'C.2.7 Penjaminan Mutu', 28, 3, '2022-02-23 20:55:57', '2022-02-23 20:55:57'),
(46, 'C.2.8 Kepuasan pemangku kepentingan', 28, 3, '2022-02-23 20:56:39', '2022-02-23 20:56:39'),
(47, 'C.3.4 Indikator Kinerja Utama', 29, 3, '2022-02-23 20:57:55', '2022-02-23 20:57:55'),
(48, 'C.4.4 Indikator Kinerja Utama', 30, 3, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(49, 'C.5.4 Indikator Kinerja Utama', 31, 3, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(50, 'C.6.4 Indikator Kinerja Utama', 32, 3, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(51, 'C.7.4 Indikator Kinerja Utama', 33, 3, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(52, 'C.8.4 Indikator Kinerja Utama', 34, 3, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(53, 'C.9.4 Indikator Kinerja Utama', 35, 3, '2022-02-24 03:58:27', '2022-02-24 03:58:29'),
(54, 'D.1 Analisis dan Capaian Kinerja', 36, 3, '2022-02-24 00:19:17', '2022-02-24 00:19:17'),
(55, 'D.2 Analisis SWOT atau Analisis  Lain yang Relevan', 36, 3, '2022-02-24 00:19:48', '2022-02-24 00:19:48'),
(56, 'D.3 Program Pengembangan', 36, 3, '2022-02-24 00:20:15', '2022-02-24 00:20:15'),
(57, 'D.4 Program Keberlanjutan', 36, 3, '2022-02-24 00:20:46', '2022-02-24 00:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `l3_s`
--

CREATE TABLE `l3_s` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `l2_id` int(11) NOT NULL DEFAULT 0,
  `jenjang_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `l3_s`
--

INSERT INTO `l3_s` (`id`, `name`, `l2_id`, `jenjang_id`, `created_at`, `updated_at`) VALUES
(0, NULL, 0, 0, '2022-02-24 04:03:57', '2022-02-24 04:03:57'),
(1, 'C.2.4.a) Sistem Tata Pamong', 4, 2, '2022-02-23 21:09:38', '2022-02-23 21:09:38'),
(2, 'C.2.4.b) Kepemimpinan dan Kemampuan Manajerial', 4, 2, '2022-02-23 21:09:38', '2022-02-23 21:09:38'),
(3, 'C.2.4.c) Kerjasama', 4, 2, '2022-02-23 21:09:38', '2022-02-23 21:09:38'),
(4, 'C.3.4.a) Kualitas Input Mahasiswa', 9, 2, '2022-02-23 21:18:08', '2022-02-23 21:18:08'),
(5, 'C.3.4.b) Daya Tarik Program Studi', 9, 2, '2022-02-23 21:18:43', '2022-02-23 21:18:43'),
(6, 'C.3.4.c) Layanan Kemahasiswaan', 9, 2, '2022-02-23 21:19:20', '2022-02-23 21:19:20'),
(7, 'C.4.4.a) Profil Dosen', 10, 2, '2022-02-23 21:44:13', '2022-02-23 21:44:13'),
(8, 'C.4.4.b) Kinerja Dosen', 10, 2, '2022-02-23 22:36:47', '2022-02-23 22:36:47'),
(9, 'C.4.4.c) Pengembangan Dosen', 10, 2, '2022-02-23 22:37:47', '2022-02-23 22:37:47'),
(10, 'C.4.4.d) Tenaga Kependidikan', 10, 2, '2022-02-23 22:38:27', '2022-02-23 22:38:27'),
(11, 'C.5.4.a) Keuangan', 11, 2, '2022-02-23 22:39:19', '2022-02-23 22:39:19'),
(12, 'C.5.4.b) Sarana dan Prasarana', 11, 2, '2022-02-23 22:40:05', '2022-02-23 22:40:05'),
(13, 'C.6.4.a) Kurikulum', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(14, 'C.6.4.b) Karakteristik Proses Pembelajaran', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(15, 'C.6.4.c) Rencana Proses Pembelajaran', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(16, 'C.6.4.d) Pelaksanaan Proses Pembelajaran', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(17, 'C.6.4.e) Monitoring dan Evaluasi Proses Pembelajaran\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(18, 'C.6.4.f) Penilaian Pembelajaran\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(19, 'C.6.4.g) Integrasi kegiatan penelitian dan PkM dalam pembelajaran\r\n\r\n\r\n', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(20, 'C.6.4.h) Suasana Akademik\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(21, 'C.6.4.i) Kepuasan Mahasiswa\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 12, 2, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(22, 'C.7.4.a) Relevansi Penelitian', 13, 2, '2022-02-24 00:10:07', '2022-02-24 00:10:07'),
(23, 'C.7.4.b) Penelitian Dosen dan Mahasiswa', 13, 2, '2022-02-24 00:11:06', '2022-02-24 00:11:06'),
(24, 'C.8.4.a) Relevansi PkM', 14, 2, '2022-02-24 00:13:42', '2022-02-24 00:13:42'),
(25, 'C.8.4.b) PkM Dosen dan Mahasiswa', 14, 2, '2022-02-24 00:14:40', '2022-02-24 00:14:40'),
(26, 'C.9.4.a) Luaran Dharma Pendidikan', 15, 2, '2022-02-24 00:16:09', '2022-02-24 00:16:09'),
(27, 'C.9.4.b) Luaran Dharma Penelitian dan PkM', 15, 2, '2022-02-24 00:18:10', '2022-02-24 00:18:10'),
(28, 'C.2.4.a) Sistem Tata Pamong', 23, 1, '2022-02-23 21:09:38', '2022-02-23 21:09:38'),
(29, 'C.2.4.b) Kepemimpinan dan Kemampuan Manajerial', 23, 1, '2022-02-23 21:09:38', '2022-02-23 21:09:38'),
(30, 'C.2.4.c) Kerjasama', 23, 1, '2022-02-23 21:09:38', '2022-02-23 21:09:38'),
(31, 'C.3.4.a) Kualitas Input Mahasiswa', 28, 1, '2022-02-23 21:18:08', '2022-02-23 21:18:08'),
(32, 'C.3.4.b) Daya Tarik Program Studi', 28, 1, '2022-02-23 21:18:43', '2022-02-23 21:18:43'),
(33, 'C.3.4.c) Layanan Kemahasiswaan', 28, 1, '2022-02-23 21:19:20', '2022-02-23 21:19:20'),
(34, 'C.4.4.a) Profil Dosen', 29, 1, '2022-02-23 21:44:13', '2022-02-23 21:44:13'),
(35, 'C.4.4.b) Kinerja Dosen', 29, 1, '2022-02-23 22:36:47', '2022-02-23 22:36:47'),
(36, 'C.4.4.c) Pengembangan Dosen', 29, 1, '2022-02-23 22:37:47', '2022-02-23 22:37:47'),
(37, 'C.4.4.d) Tenaga Kependidikan', 29, 1, '2022-02-23 22:38:27', '2022-02-23 22:38:27'),
(38, 'C.5.4.a) Keuangan', 30, 1, '2022-02-23 22:39:19', '2022-02-23 22:39:19'),
(39, 'C.5.4.b) Sarana dan Prasarana', 30, 1, '2022-02-23 22:40:05', '2022-02-23 22:40:05'),
(40, 'C.6.4.a) Kurikulum', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(41, 'C.6.4.b) Karakteristik Proses Pembelajaran', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(42, 'C.6.4.c) Rencana Proses Pembelajaran', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(43, 'C.6.4.d) Pelaksanaan Proses Pembelajaran', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(44, 'C.6.4.e) Monitoring dan Evaluasi Proses Pembelajaran\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(45, 'C.6.4.f) Penilaian Pembelajaran\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(46, 'C.6.4.g) Integrasi kegiatan penelitian dan PkM dalam pembelajaran\r\n\r\n\r\n', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(47, 'C.6.4.h) Suasana Akademik\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(48, 'C.6.4.i) Kepuasan Mahasiswa\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 31, 1, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(49, 'C.7.4.a) Relevansi Penelitian', 32, 1, '2022-02-24 00:10:07', '2022-02-24 00:10:07'),
(50, 'C.7.4.b) Penelitian Dosen dan Mahasiswa', 32, 1, '2022-02-24 00:11:06', '2022-02-24 00:11:06'),
(51, 'C.8.4.a) Relevansi PkM', 33, 1, '2022-02-24 00:13:42', '2022-02-24 00:13:42'),
(52, 'C.8.4.b) PkM Dosen dan Mahasiswa', 33, 1, '2022-02-24 00:14:40', '2022-02-24 00:14:40'),
(53, 'C.9.4.a) Luaran Dharma Pendidikan', 34, 1, '2022-02-24 00:16:09', '2022-02-24 00:16:09'),
(54, 'C.9.4.b) Luaran Dharma Penelitian dan PkM', 34, 1, '2022-02-24 00:18:10', '2022-02-24 00:18:10'),
(55, 'C.2.4.a) Sistem Tata Pamong', 42, 3, '2022-02-23 21:09:38', '2022-05-28 01:17:45'),
(56, 'C.2.4.b) Kepemimpinan dan Kemampuan Manajerial', 42, 3, '2022-02-23 21:09:38', '2022-02-23 21:09:38'),
(57, 'C.2.4.c) Kerjasama', 42, 3, '2022-02-23 21:09:38', '2022-02-23 21:09:38'),
(58, 'C.3.4.a) Kualitas Input Mahasiswa', 47, 3, '2022-02-23 21:18:08', '2022-02-23 21:18:08'),
(59, 'C.3.4.b) Daya Tarik Program Studi', 47, 3, '2022-02-23 21:18:43', '2022-02-23 21:18:43'),
(60, 'C.3.4.c) Layanan Kemahasiswaan', 47, 3, '2022-02-23 21:19:20', '2022-02-23 21:19:20'),
(61, 'C.4.4.a) Profil Dosen', 48, 3, '2022-02-23 21:44:13', '2022-02-23 21:44:13'),
(62, 'C.4.4.b) Kinerja Dosen', 48, 3, '2022-02-23 22:36:47', '2022-02-23 22:36:47'),
(63, 'C.4.4.c) Pengembangan Dosen', 48, 3, '2022-02-23 22:37:47', '2022-02-23 22:37:47'),
(64, 'C.4.4.d) Tenaga Kependidikan', 48, 3, '2022-02-23 22:38:27', '2022-02-23 22:38:27'),
(65, 'C.5.4.a) Keuangan', 49, 3, '2022-02-23 22:39:19', '2022-02-23 22:39:19'),
(66, 'C.5.4.b) Sarana dan Prasarana', 49, 3, '2022-02-23 22:40:05', '2022-02-23 22:40:05'),
(67, 'C.6.4.a) Kurikulum', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(68, 'C.6.4.b) Karakteristik Proses Pembelajaran', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(69, 'C.6.4.c) Rencana Proses Pembelajaran', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(70, 'C.6.4.d) Pelaksanaan Proses Pembelajaran', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(71, 'C.6.4.e) Monitoring dan Evaluasi Proses Pembelajaran\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(72, 'C.6.4.f) Penilaian Pembelajaran\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(73, 'C.6.4.g) Integrasi kegiatan penelitian dan PkM dalam pembelajaran\r\n\r\n\r\n', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(74, 'C.6.4.h) Suasana Akademik\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(75, 'C.6.4.i) Kepuasan Mahasiswa\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 50, 3, '2022-02-23 22:41:21', '2022-02-23 22:41:21'),
(76, 'C.7.4.a) Relevansi Penelitian', 51, 3, '2022-02-24 00:10:07', '2022-02-24 00:10:07'),
(77, 'C.7.4.b) Penelitian Dosen dan Mahasiswa', 51, 3, '2022-02-24 00:11:06', '2022-02-24 00:11:06'),
(78, 'C.8.4.a) Relevansi PkM', 52, 3, '2022-02-24 00:13:42', '2022-02-24 00:13:42'),
(79, 'C.8.4.b) PkM Dosen dan Mahasiswa', 52, 3, '2022-02-24 00:14:40', '2022-02-24 00:14:40'),
(80, 'C.9.4.a) Luaran Dharma Pendidikan', 53, 3, '2022-02-24 00:16:09', '2022-02-24 00:16:09'),
(81, 'C.9.4.b) Luaran Dharma Penelitian dan PkM', 53, 3, '2022-02-24 00:18:10', '2022-02-24 00:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `l4_s`
--

CREATE TABLE `l4_s` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `l3_id` int(11) NOT NULL DEFAULT 0,
  `jenjang_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `l4_s`
--

INSERT INTO `l4_s` (`id`, `name`, `l3_id`, `jenjang_id`, `created_at`, `updated_at`) VALUES
(0, NULL, 0, 0, '2022-02-13 04:25:42', '2022-02-13 04:25:44'),
(1, 'A.1.1.1', 1, 2, '2022-02-12 22:58:18', '2022-02-12 22:58:18'),
(2, 'A.1.1.1', 28, 1, '2022-02-12 22:58:18', '2022-02-12 22:58:18'),
(3, 'A.1.1.1', 55, 3, '2022-02-12 22:58:18', '2022-02-12 22:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2021_10_06_025948_create_l1_s_table', 1),
(4, '2021_10_06_030000_create_l2_s_table', 1),
(5, '2021_10_06_043246_create_l3_s_table', 1),
(6, '2021_10_06_043257_create_l4_s_table', 1),
(7, '2022_01_18_080946_indikator', 1),
(8, '2022_01_18_081208_element', 1),
(9, '2022_01_18_082755_score', 1),
(10, '2022_01_18_083934_files', 1),
(11, '2022_01_18_090648_prodi', 1),
(12, '2022_01_18_091253_create_jenjangs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prodis`
--

CREATE TABLE `prodis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `jenjang_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prodis`
--

INSERT INTO `prodis` (`id`, `name`, `kode`, `jenjang_id`) VALUES
(1, 'Manajemen', 'M', '1'),
(2, 'Akuntansi', 'A', '1'),
(3, 'Ilmu Keperawatan', 'IKep', '1'),
(4, 'Profesi Ners', 'Ners', '3'),
(5, 'K3', 'K3', '1'),
(6, 'Teknik Mesin', 'TM', '1'),
(7, 'Teknik Sipil', 'TS', '1'),
(8, 'Ilmu Komputer', 'IKom', '1'),
(9, 'Ilmu Hukum', 'IH', '1'),
(10, 'Sastra Inggris', 'SI', '1'),
(11, 'Administrasi Pendidikan', 'AP', '1'),
(12, 'Manajemen Pendidikan', 'MP', '2');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `value` decimal(3,2) NOT NULL DEFAULT 0.00,
  `indikator_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `name`, `value`, `indikator_id`) VALUES
(1, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan secara komprehensif dan strategis,</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya,</li>\r\n	<li>menggunakan hasil identifikasi dan posisi yang ditetapkan untuk melakukan analisis (SWOT/metoda analisis lain yang relevan) untuk pengembangan program studi, dan</li>\r\n	<li>merumuskan strategi pengembangan program studi yang berkesesuaian untuk menghasilkan program-program pengembangan alternatif yang tepat.</li>\r\n</ol>', 4.00, 1),
(2, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan secara komprehensif,</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya, dan&nbsp;</li>\r\n	<li>menggunakan hasil identifikasi dan posisi yang ditetapkan untuk melakukan analisis (SWOT/metoda analisis lain yang relevan) untuk pengembangan program studi.</li>\r\n</ol>', 3.00, 1),
(3, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan, dan</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya.</li>\r\n</ol>', 2.00, 1),
(4, '<p>Unit Pengelola Program Studi (UPPS) kurang mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan, dan</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya.</li>\r\n</ol>', 1.00, 1),
(5, '<p>Profil UPPS:&nbsp;<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dan konsisten dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;<br />\r\n3) menunjukkan iklim yang kondusif untuk pengembangan keilmuan program studi.<br />\r\n4) menunjukkan reputasi sebagai rujukan di bidang keilmuannya.</p>', 4.00, 2),
(6, '<p>Profil UPPS:<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dan konsisten dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;<br />\r\n3) menunjukkan iklim yang kondusif untuk pengembangan keilmuan program studi.</p>', 3.00, 2),
(7, '<p>Profil UPPS:<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;</p>', 2.00, 2),
(8, '<p>Profil UPPS:<br />\r\n1) kurang menunjukkan keserbacakupan informasi yang jelas dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) kurang menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;</p>', 1.00, 2),
(9, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait keunikan program studi serta didukung data konsistensi implementasinya,<br />\r\n2) misi, tujuan, dan strategi yang searah dan bersinerji dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi dengan data konsistensi implementasinya.</p>', 4.00, 3),
(10, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait keunikan program studi,<br />\r\n2) misi, tujuan, dan strategi yang searah dan bersinerji dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi.</p>', 3.00, 3),
(11, '<p>UPPS memiliki:&nbsp;<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait program studi,<br />\r\n2) misi, tujuan, dan strategi yang searah dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi.</p>', 2.00, 3),
(12, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi namun tidak memayungi visi keilmuan terkait program studi,<br />\r\n2) misi, tujuan, dan strategi kurang searah dengan misi, tujuan sasaran, dan strategi perguruan tinggi serta kurang mendukung pengembangan program studi.</p>', 1.00, 3),
(13, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan semua pemangku kepentingan internal (dosen, mahasiswa dan tenaga kependidikan) dan eksternal (lulusan, pengguna lulusan dan pakar/mitra/organisasi profesi/pemerintah).</p>', 4.00, 4),
(14, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan pemangku kepentingan internal (dosen, mahasiswa dan tenaga kependidikan) dan pemangku kepentingan eksternal (lulusan dan pengguna lulusan).&nbsp;</p>', 3.00, 4),
(15, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan pemangku kepentingan internal (dosen dan mahasiswa) dan pemangku kepentingan eksternal (lulusan).</p>', 2.00, 4),
(16, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi namun tidak melibatkan pemangku kepentingan.</p>', 1.00, 4),
(17, '<p>Strategi efektif untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan dan terdokumentasi serta pada pelaksanaannya dilakukan pemantauan dan evaluasi dan ditindaklanjuti.</p>', 4.00, 5),
(18, '<p>Strategi efektif untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan dan terdokumentasi serta pada pelaksanaannya dilakukan pemantauan dan evaluasi.</p>', 3.00, 5),
(19, '<p>Strategi untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan serta terdokumentasi namun belum terbukti efektifitasnya.</p>', 2.00, 5),
(20, '<p>Strategi untuk mencapai tujuan disusun berdasarkan analisis yang kurang sistematis serta tidak menggunakan metoda yang relevan.</p>', 1.00, 5),
(21, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi 3 aspek.</p>', 4.00, 8),
(22, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi aspek 1 dan 2.</p>', 3.00, 8),
(23, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi aspek 1.</p>', 2.00, 8),
(24, '<p>UPPS tidak memiliki bukti pelaksanaan kerjasama.</p>', 1.00, 8),
(25, '<p>UPPS menetapkan indikator kinerja tambahan berdasarkan standar pendidikan tinggi yang ditetapkan perguruan tinggi. Indikator kinerja tambahan mencakup seluruh kriteria serta menunjukkan daya saing UPPS dan program studi di tingkat inernasional. Data indikator kinerja tambahan telah diukur, dimonitor, dikaji, dan dianalisis untuk perbaikan berkelanjutan.</p>', 4.00, 10),
(26, '<p>UPPS menetapkan indikator kinerja tambahan berdasarkan standar pendidikan tinggi yang ditetapkan perguruan tinggi. Indikator kinerja tambahan mencakup sebagian kriteria serta menunjukkan daya saing UPPS dan program studi di tingkat nasional. Data indikator kinerja tambahan telah diukur, dimonitor, dikaji, dan dianalisis untuk perbaikan berkelanjutan.</p>', 3.00, 10),
(27, '<p>UPPS tidak menetapkan indikator kinerja tambahan.</p>', 2.00, 10),
(28, '<p>Tidak ada Skor kurang dari 2.</p>', 1.00, 10),
(29, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek, dilaksanakan setiap tahun dan hasilnya dipublikasikan kepada para pemangku kepentingan.</p>', 4.00, 11),
(30, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek dan dilaksanakan setiap tahun.</p>', 3.00, 11),
(31, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek.&nbsp;</p>', 2.00, 11),
(32, '<p>UPPS memiliki laporan pencapaian kinerja namun belum dianalisis dan dievaluasi.&nbsp;</p>', 1.00, 11),
(33, '<p>UPPS telah melaksanakan SPMI yang memenuhi 5 aspek.</p>', 4.00, 12),
(34, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 sampai dengan 4.&nbsp;</p>', 3.00, 12),
(35, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 sampai dengan 3.</p>', 2.00, 12),
(36, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 dan 2, serta siklus kegiatan SPMI baru dilaksanakan pada tahapan penetapan standar dan pelaksanaan standar pendidikan tinggi.</p>', 1.00, 12),
(37, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi seluruh aspek.</p>', 4.00, 13),
(38, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d 4 dan salah satu dari aspek 5 atau aspek 6.</p>', 3.00, 13),
(39, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d 4.</p>', 2.00, 13),
(40, '<p>UPPS melakukan pengukuran kepuasan kepada sebagian pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d. 4.</p>', 1.00, 13),
(41, '<p>UPPS merencanakan dan mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT) secara konsisten.</p>', 4.00, 30),
(42, '<p>UPPS merencanakan dan mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 3.00, 30),
(43, '<p>UPPS mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 2.00, 30),
(44, '<p>UPPS mengembangkan DTPS tidak mengikuti atau tidak sesuai dengan rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 1.00, 30),
(45, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta melebihi standar pembelajaran, penelitian dan PkM untuk mendukung terciptanya suasana akademik yang sehat dan kondusif.</p>', 4.00, 35),
(46, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta melebihi standar pembelajaran, penelitian dan PkM.</p>', 3.00, 35),
(47, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta memenuhi standar pembelajaran, penelitian dan PkM.</p>', 2.00, 35),
(48, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana kurang sesuai dengan perencanaan investasi.</p>', 1.00, 35),
(49, '<p>Dana dapat menjamin keberlangsungan operasional tridharma, pengembangan 3 tahun terakhir serta memiliki kecukupan dana untuk rencana pengembangan 3 tahun ke depan yang didukung oleh sumber pendanaan yang realistis.</p>', 4.00, 36),
(50, '<p>Dana dapat menjamin keberlangsungan operasional tridharma serta pengembangan 3 tahun terakhir.</p>', 3.00, 36),
(51, '<p>Dana dapat menjamin keberlangsungan operasional tridharma dan sebagian kecil pengembangan.</p>', 2.00, 36),
(52, '<p>Dana &nbsp;dapat menjamin keberlangsungan operasional dan tidak ada untuk pengembangan.</p>', 1.00, 36),
(53, '<p>UPPS menyediakan sarana dan prasarana yang mutakhir serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 4.00, 37),
(54, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 3.00, 37),
(55, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran.</p>', 2.00, 37),
(56, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang tidak cukup untuk menjamin pencapaian</p>', 1.00, 37),
(57, '<p>Terpenuhinya karakteristik proses pembelajaran program studi yang mencakup seluruh sifat, dan telah menghasilkan profil lulusan yang sesuai dengan capaian pembelajaran.&nbsp;</p>', 4.00, 39),
(58, '<p>Terpenuhinya karakteristik proses pembelajaran program studi yang berpusat pada mahasiswa, dan telah menghasilkan profil lulusan yang sesuai dengan capaian pembelajaran.&nbsp;</p>', 3.00, 39),
(59, '<p>Karakteristik proses pembelajaran program studi berpusat pada mahasiswa yang diterapkan pada minimal 50% matakuliah.</p>', 2.00, 39),
(60, '<p>Karakteristik proses pembelajaran program studi belum berpusat pada mahasiswa.</p>', 1.00, 39),
(61, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa yang dilaksanakan secara konsisten dan ditindak lanjuti.</p>', 4.00, 43),
(62, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa yang dilaksanakan secara konsisten.</p>', 3.00, 43),
(63, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa.</p>', 2.00, 43),
(64, '<p>UPPS telah melaksanakan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa namun tidak semua didukung bukti sahih.</p>', 1.00, 43),
(65, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan setiap bulan.</p>', 4.00, 46),
(66, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan dua s.d tiga bulan sekali.</p>', 3.00, 46),
(67, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan empat s.d. enam bulan sekali.</p>', 2.00, 46),
(68, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan lebih dari enam bulan sekali.</p>', 1.00, 46),
(69, '<p>UPPS memenuhi 4 unsur relevansi penelitian dosen dan mahasiswa.</p>', 4.00, 48),
(70, '<p>UPPS memenuhi &nbsp;unsur 1, 2, dan 3 relevansi penelitian dosen dan mahasiswa.</p>', 3.00, 48),
(71, '<p>UPPS memenuhi &nbsp;unsur 1, dan 2 relevansi penelitian dosen dan mahasiswa.</p>', 2.00, 48),
(72, '<p>UPPS memenuhi &nbsp;unsur pertama namun penelitian dosen dan mahasiswa tidak sesuai dengan peta jalan.</p>', 1.00, 48),
(73, '<p>UPPS memenuhi 4 unsur relevansi PkM dosen dan mahasiswa.</p>', 4.00, 50),
(74, '<p>UPPS memenuhi &nbsp;unsur 1, 2, dan 3 relevansi PkM dosen dan mahasiswa.</p>', 3.00, 50),
(75, '<p>UPPS memenuhi &nbsp;unsur 1, dan 2 relevansi PkM dosen dan mahasiswa.</p>', 2.00, 50),
(76, '<p>UPPS memenuhi &nbsp;unsur pertama namun PkM dosen dan mahasiswa tidak sesuai dengan peta jalan.</p>', 1.00, 50),
(77, '<p>Analisis capaian pembelajaran lulusan memenuhi 3 aspek.&nbsp;</p>', 4.00, 52),
(78, '<p>Analisis capaian pembelajaran lulusan memenuhi 2 aspek.&nbsp;</p>', 3.00, 52),
(79, '<p>Analisis capaian pembelajaran lulusan memenuhi 1 aspek.&nbsp;</p>', 2.00, 52),
(80, '<p>Analisis capaian pembelajaran lulusan tidak memenuhi ketiga aspek.&nbsp;</p>', 1.00, 52),
(81, '<p>Tracer study yang dilakukan UPPS telah mencakup 5 aspek.</p>', 4.00, 59),
(82, '<p>Tracer study yang dilakukan UPPS telah mencakup 4 aspek.</p>', 3.00, 59),
(83, '<p>Tracer study yang dilakukan UPPS telah mencakup 3 aspek.</p>', 2.00, 59),
(84, '<p>Tracer study yang dilakukan UPPS telah mencakup 2 aspek.</p>', 1.00, 59),
(85, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai) yang didukung oleh keberadaan pangkalan data institusi yang terintegrasi.<br />\r\n2) konsisten dengan seluruh kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif, tepat, dan tajam untuk mengidentifikasi akar masalah di &nbsp;UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal dan eksternal serta mudah diakses.</p>', 4.00, 66),
(86, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai) yang didukung oleh keberadaan pangkalan data institusi yang belum terintegrasi.<br />\r\n2) konsisten dengan sebagian besar (7 s.d. 8) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif dan tepat untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal serta mudah diakses.</p>', 3.00, 66),
(87, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai).<br />\r\n2) konsisten dengan sebagian (5 s.d. 6) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal.</p>', 2.00, 66),
(88, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya tidak sepenuhnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai).<br />\r\n2) konsisten dengan sebagian kecil (kurang dari 5) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan tidak secara komprehensif untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya tidak dipublikasikan.</p>', 1.00, 66),
(89, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat,<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja,<br />\r\n3) merumuskan strategi pengembangan UPPS yang berkesesuaian, dan<br />\r\n4) menghasilkan program-program pengembangan alternatif yang tepat.</p>', 4.00, 67),
(90, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat,<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja, dan<br />\r\n3) merumuskan strategi pengembangan UPPS yang berkesesuaian.</p>', 3.00, 67),
(91, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat, dan&nbsp;<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja.</p>', 2.00, 67),
(92, '<p>UPPS melakukan analisis SWOT atau analisis lain yang memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS, dan<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja, namun tidak terstruktur dan tidak sistematis.</p>', 1.00, 67),
(93, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan,<br />\r\n3) rencana strategis UPPS yang berlaku,<br />\r\n4) aspirasi dari pemangku kepentingan internal dan eksternal, dan<br />\r\n5) program yang menjamin keberlanjutan.</p>', 4.00, 68),
(94, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan,<br />\r\n3) rencana strategis UPPS yang berlaku, dan<br />\r\n4) aspirasi dari pemangku kepentingan internal.</p>', 3.00, 68),
(95, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan, dan<br />\r\n3) rencana strategis UPPS yang berlaku.</p>', 2.00, 68),
(96, '<p>UPPS menetapkan prioritas program pengembangan namun belum mempertimbangan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS, dan<br />\r\n3) rencana strategis UPPS yang berlaku.</p>', 1.00, 68),
(97, '<p>UPPS memiliki kebijakan dan upaya yang diturunkan ke dalam berbagai peraturan untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan,<br />\r\n3) rencana penjaminan mutu yang berkelanjutan, dan&nbsp;<br />\r\n4) keberadaan dukungan stakeholders eksternal.</p>', 4.00, 69),
(98, '<p>UPPS memiliki kebijakan dan upaya yang diturunkan ke dalam berbagai peraturan untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan, dan<br />\r\n3) rencana penjaminan mutu yang berkelanjutan.</p>', 3.00, 69),
(99, '<p>UPPS memiliki kebijakan dan upaya untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan, dan<br />\r\n3) rencana penjaminan mutu yang berkelanjutan.</p>', 2.00, 69),
(100, '<p>UPPS memiliki kebijakan dan upaya namun belum cukup untuk menjamin keberlanjutan program.</p>', 1.00, 69),
(101, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan secara komprehensif dan strategis,</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya,</li>\r\n	<li>menggunakan hasil identifikasi dan posisi yang ditetapkan untuk melakukan analisis (SWOT/metoda analisis lain yang relevan) untuk pengembangan program studi, dan</li>\r\n	<li>merumuskan strategi pengembangan program studi yang berkesesuaian untuk menghasilkan program-program pengembangan alternatif yang tepat.</li>\r\n</ol>', 4.00, 71),
(102, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan secara komprehensif,</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya, dan&nbsp;</li>\r\n	<li>menggunakan hasil identifikasi dan posisi yang ditetapkan untuk melakukan analisis (SWOT/metoda analisis lain yang relevan) untuk pengembangan program studi.</li>\r\n</ol>', 3.00, 71),
(103, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan, dan</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya.</li>\r\n</ol>', 2.00, 71),
(104, '<p>Unit Pengelola Program Studi (UPPS) kurang mampu :</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan, dan</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya.</li>\r\n</ol>', 1.00, 71),
(105, '<p>Profil UPPS:&nbsp;<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dan konsisten dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;<br />\r\n3) menunjukkan iklim yang kondusif untuk pengembangan keilmuan program studi.<br />\r\n4) menunjukkan reputasi sebagai rujukan di bidang keilmuannya.</p>', 4.00, 72),
(106, '<p>Profil UPPS:<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dan konsisten dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;<br />\r\n3) menunjukkan iklim yang kondusif untuk pengembangan keilmuan program studi.</p>', 3.00, 72),
(107, '<p>Profil UPPS:<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;</p>', 2.00, 72),
(108, '<p>Profil UPPS:<br />\r\n1) kurang menunjukkan keserbacakupan informasi yang jelas dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) kurang menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;</p>', 1.00, 72),
(109, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait keunikan program studi serta didukung data konsistensi implementasinya,<br />\r\n2) misi, tujuan, dan strategi yang searah dan bersinerji dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi dengan data konsistensi implementasinya.</p>', 4.00, 73),
(110, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait keunikan program studi,<br />\r\n2) misi, tujuan, dan strategi yang searah dan bersinerji dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi.</p>', 3.00, 73),
(111, '<p>UPPS memiliki:&nbsp;<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait program studi,<br />\r\n2) misi, tujuan, dan strategi yang searah dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi.</p>', 2.00, 73),
(112, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi namun tidak memayungi visi keilmuan terkait program studi,<br />\r\n2) misi, tujuan, dan strategi kurang searah dengan misi, tujuan sasaran, dan strategi perguruan tinggi serta kurang mendukung pengembangan program studi.</p>', 1.00, 73),
(113, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan semua pemangku kepentingan internal (dosen, mahasiswa dan tenaga kependidikan) dan eksternal (lulusan, pengguna lulusan dan pakar/mitra/organisasi profesi/pemerintah).</p>', 4.00, 74),
(114, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan pemangku kepentingan internal (dosen, mahasiswa dan tenaga kependidikan) dan pemangku kepentingan eksternal (lulusan dan pengguna lulusan).&nbsp;</p>', 3.00, 74),
(115, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan pemangku kepentingan internal (dosen dan mahasiswa) dan pemangku kepentingan eksternal (lulusan).</p>', 2.00, 74),
(116, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi namun tidak melibatkan pemangku kepentingan.</p>', 1.00, 74),
(117, '<p>Strategi efektif untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan dan terdokumentasi serta pada pelaksanaannya dilakukan pemantauan dan evaluasi dan ditindaklanjuti.</p>', 4.00, 75),
(118, '<p>Strategi efektif untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan dan terdokumentasi serta pada pelaksanaannya dilakukan pemantauan dan evaluasi.</p>', 3.00, 75),
(119, '<p>Strategi untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan serta terdokumentasi namun belum terbukti efektifitasnya.</p>', 2.00, 75),
(120, '<p>Strategi untuk mencapai tujuan disusun berdasarkan analisis yang kurang sistematis serta tidak menggunakan metoda yang relevan.</p>', 1.00, 75),
(121, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi 3 aspek.</p>', 4.00, 78),
(122, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi aspek 1 dan 2.</p>', 3.00, 78),
(123, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi aspek 1.</p>', 2.00, 78),
(124, '<p>UPPS tidak memiliki bukti pelaksanaan kerjasama.</p>', 1.00, 78),
(125, '<p>UPPS menetapkan indikator kinerja tambahan berdasarkan standar pendidikan tinggi yang ditetapkan perguruan tinggi. Indikator kinerja tambahan mencakup seluruh kriteria serta menunjukkan daya saing UPPS dan program studi di tingkat inernasional. Data indikator kinerja tambahan telah diukur, dimonitor, dikaji, dan dianalisis untuk perbaikan berkelanjutan.</p>', 4.00, 80),
(126, '<p>UPPS menetapkan indikator kinerja tambahan berdasarkan standar pendidikan tinggi yang ditetapkan perguruan tinggi. Indikator kinerja tambahan mencakup sebagian kriteria serta menunjukkan daya saing UPPS dan program studi di tingkat nasional. Data indikator kinerja tambahan telah diukur, dimonitor, dikaji, dan dianalisis untuk perbaikan berkelanjutan.</p>', 3.00, 80),
(127, '<p>UPPS tidak menetapkan indikator kinerja tambahan.</p>', 2.00, 80),
(128, '<p>Tidak ada Skor kurang dari 2.</p>', 1.00, 80),
(129, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek, dilaksanakan setiap tahun dan hasilnya dipublikasikan kepada para pemangku kepentingan.</p>', 4.00, 81),
(130, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek dan dilaksanakan setiap tahun.</p>', 3.00, 81),
(131, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek.&nbsp;</p>', 2.00, 81),
(132, '<p>UPPS memiliki laporan pencapaian kinerja namun belum dianalisis dan dievaluasi.&nbsp;</p>', 1.00, 81),
(133, '<p>UPPS telah melaksanakan SPMI yang memenuhi 5 aspek.</p>', 4.00, 82),
(134, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 sampai dengan 4.&nbsp;</p>', 3.00, 82),
(135, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 sampai dengan 3.</p>', 2.00, 82),
(136, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 dan 2, serta siklus kegiatan SPMI baru dilaksanakan pada tahapan penetapan standar dan pelaksanaan standar pendidikan tinggi.</p>', 1.00, 82),
(137, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi seluruh aspek.</p>', 4.00, 83),
(138, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d 4 dan salah satu dari aspek 5 atau aspek 6.</p>', 3.00, 83),
(139, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d 4.</p>', 2.00, 83),
(140, '<p>UPPS melakukan pengukuran kepuasan kepada sebagian pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d. 4.</p>', 1.00, 83),
(141, '<p>UPPS merencanakan dan mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT) secara konsisten.</p>', 4.00, 100),
(142, '<p>UPPS merencanakan dan mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 3.00, 100),
(143, '<p>UPPS mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 2.00, 100),
(144, '<p>UPPS mengembangkan DTPS tidak mengikuti atau tidak sesuai dengan rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 1.00, 100),
(145, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta melebihi standar pembelajaran, penelitian dan PkM untuk mendukung terciptanya suasana akademik yang sehat dan kondusif.</p>', 4.00, 105),
(146, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta melebihi standar pembelajaran, penelitian dan PkM.</p>', 3.00, 105),
(147, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta memenuhi standar pembelajaran, penelitian dan PkM.</p>', 2.00, 105),
(148, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana kurang sesuai dengan perencanaan investasi.</p>', 1.00, 105),
(149, '<p>Dana dapat menjamin keberlangsungan operasional tridharma, pengembangan 3 tahun terakhir serta memiliki kecukupan dana untuk rencana pengembangan 3 tahun ke depan yang didukung oleh sumber pendanaan yang realistis.</p>', 4.00, 106),
(150, '<p>Dana dapat menjamin keberlangsungan operasional tridharma serta pengembangan 3 tahun terakhir.</p>', 3.00, 106),
(151, '<p>Dana dapat menjamin keberlangsungan operasional tridharma dan sebagian kecil pengembangan.</p>', 2.00, 106),
(152, '<p>Dana &nbsp;dapat menjamin keberlangsungan operasional dan tidak ada untuk pengembangan.</p>', 1.00, 106),
(153, '<p>UPPS menyediakan sarana dan prasarana yang mutakhir serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 4.00, 107),
(154, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 3.00, 107),
(155, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran.</p>', 2.00, 107),
(156, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang tidak cukup untuk menjamin pencapaian</p>', 1.00, 107),
(157, '<p>Terpenuhinya karakteristik proses pembelajaran program studi yang mencakup seluruh sifat, dan telah menghasilkan profil lulusan yang sesuai dengan capaian pembelajaran.&nbsp;</p>', 4.00, 109),
(158, '<p>Terpenuhinya karakteristik proses pembelajaran program studi yang berpusat pada mahasiswa, dan telah menghasilkan profil lulusan yang sesuai dengan capaian pembelajaran.&nbsp;</p>', 3.00, 109),
(159, '<p>Karakteristik proses pembelajaran program studi berpusat pada mahasiswa yang diterapkan pada minimal 50% matakuliah.</p>', 2.00, 109),
(160, '<p>Karakteristik proses pembelajaran program studi belum berpusat pada mahasiswa.</p>', 1.00, 109),
(161, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa yang dilaksanakan secara konsisten dan ditindak lanjuti.</p>', 4.00, 113),
(162, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa yang dilaksanakan secara konsisten.</p>', 3.00, 113),
(163, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa.</p>', 2.00, 113),
(164, '<p>UPPS telah melaksanakan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa namun tidak semua didukung bukti sahih.</p>', 1.00, 113),
(165, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan setiap bulan.</p>', 4.00, 116),
(166, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan dua s.d tiga bulan sekali.</p>', 3.00, 116),
(167, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan empat s.d. enam bulan sekali.</p>', 2.00, 116),
(168, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan lebih dari enam bulan sekali.</p>', 1.00, 116),
(169, '<p>UPPS memenuhi 4 unsur relevansi penelitian dosen dan mahasiswa.</p>', 4.00, 118),
(170, '<p>UPPS memenuhi &nbsp;unsur 1, 2, dan 3 relevansi penelitian dosen dan mahasiswa.</p>', 3.00, 118),
(171, '<p>UPPS memenuhi &nbsp;unsur 1, dan 2 relevansi penelitian dosen dan mahasiswa.</p>', 2.00, 118),
(172, '<p>UPPS memenuhi &nbsp;unsur pertama namun penelitian dosen dan mahasiswa tidak sesuai dengan peta jalan.</p>', 1.00, 118),
(173, '<p>UPPS memenuhi 4 unsur relevansi PkM dosen dan mahasiswa.</p>', 4.00, 120),
(174, '<p>UPPS memenuhi &nbsp;unsur 1, 2, dan 3 relevansi PkM dosen dan mahasiswa.</p>', 3.00, 120),
(175, '<p>UPPS memenuhi &nbsp;unsur 1, dan 2 relevansi PkM dosen dan mahasiswa.</p>', 2.00, 120),
(176, '<p>UPPS memenuhi &nbsp;unsur pertama namun PkM dosen dan mahasiswa tidak sesuai dengan peta jalan.</p>', 1.00, 120),
(177, '<p>Analisis capaian pembelajaran lulusan memenuhi 3 aspek.&nbsp;</p>', 4.00, 122),
(178, '<p>Analisis capaian pembelajaran lulusan memenuhi 2 aspek.&nbsp;</p>', 3.00, 122),
(179, '<p>Analisis capaian pembelajaran lulusan memenuhi 1 aspek.&nbsp;</p>', 2.00, 122),
(180, '<p>Analisis capaian pembelajaran lulusan tidak memenuhi ketiga aspek.&nbsp;</p>', 1.00, 122),
(181, '<p>Tracer study yang dilakukan UPPS telah mencakup 5 aspek.</p>', 4.00, 129),
(182, '<p>Tracer study yang dilakukan UPPS telah mencakup 4 aspek.</p>', 3.00, 129),
(183, '<p>Tracer study yang dilakukan UPPS telah mencakup 3 aspek.</p>', 2.00, 129),
(184, '<p>Tracer study yang dilakukan UPPS telah mencakup 2 aspek.</p>', 1.00, 129),
(185, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai) yang didukung oleh keberadaan pangkalan data institusi yang terintegrasi.<br />\r\n2) konsisten dengan seluruh kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif, tepat, dan tajam untuk mengidentifikasi akar masalah di &nbsp;UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal dan eksternal serta mudah diakses.</p>', 4.00, 136),
(186, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai) yang didukung oleh keberadaan pangkalan data institusi yang belum terintegrasi.<br />\r\n2) konsisten dengan sebagian besar (7 s.d. 8) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif dan tepat untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal serta mudah diakses.</p>', 3.00, 136),
(187, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai).<br />\r\n2) konsisten dengan sebagian (5 s.d. 6) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal.</p>', 2.00, 136),
(188, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya tidak sepenuhnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai).<br />\r\n2) konsisten dengan sebagian kecil (kurang dari 5) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan tidak secara komprehensif untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya tidak dipublikasikan.</p>', 1.00, 136),
(189, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat,<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja,<br />\r\n3) merumuskan strategi pengembangan UPPS yang berkesesuaian, dan<br />\r\n4) menghasilkan program-program pengembangan alternatif yang tepat.</p>', 4.00, 137),
(190, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat,<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja, dan<br />\r\n3) merumuskan strategi pengembangan UPPS yang berkesesuaian.</p>', 3.00, 137),
(191, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat, dan&nbsp;<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja.</p>', 2.00, 137),
(192, '<p>UPPS melakukan analisis SWOT atau analisis lain yang memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS, dan<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja, namun tidak terstruktur dan tidak sistematis.</p>', 1.00, 137),
(193, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan,<br />\r\n3) rencana strategis UPPS yang berlaku,<br />\r\n4) aspirasi dari pemangku kepentingan internal dan eksternal, dan<br />\r\n5) program yang menjamin keberlanjutan.</p>', 4.00, 138),
(194, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan,<br />\r\n3) rencana strategis UPPS yang berlaku, dan<br />\r\n4) aspirasi dari pemangku kepentingan internal.</p>', 3.00, 138),
(195, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan, dan<br />\r\n3) rencana strategis UPPS yang berlaku.</p>', 2.00, 138),
(196, '<p>UPPS menetapkan prioritas program pengembangan namun belum mempertimbangan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS, dan<br />\r\n3) rencana strategis UPPS yang berlaku.</p>', 1.00, 138),
(197, '<p>UPPS memiliki kebijakan dan upaya yang diturunkan ke dalam berbagai peraturan untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan,<br />\r\n3) rencana penjaminan mutu yang berkelanjutan, dan&nbsp;<br />\r\n4) keberadaan dukungan stakeholders eksternal.</p>', 4.00, 139),
(198, '<p>UPPS memiliki kebijakan dan upaya yang diturunkan ke dalam berbagai peraturan untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan, dan<br />\r\n3) rencana penjaminan mutu yang berkelanjutan.</p>', 3.00, 139),
(199, '<p>UPPS memiliki kebijakan dan upaya untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan, dan<br />\r\n3) rencana penjaminan mutu yang berkelanjutan.</p>', 2.00, 139),
(200, '<p>UPPS memiliki kebijakan dan upaya namun belum cukup untuk menjamin keberlanjutan program.</p>', 1.00, 139),
(201, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan secara komprehensif dan strategis,</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya,</li>\r\n	<li>menggunakan hasil identifikasi dan posisi yang ditetapkan untuk melakukan analisis (SWOT/metoda analisis lain yang relevan) untuk pengembangan program studi, dan</li>\r\n	<li>merumuskan strategi pengembangan program studi yang berkesesuaian untuk menghasilkan program-program pengembangan alternatif yang tepat.</li>\r\n</ol>', 4.00, 141),
(202, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan secara komprehensif,</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya, dan&nbsp;</li>\r\n	<li>menggunakan hasil identifikasi dan posisi yang ditetapkan untuk melakukan analisis (SWOT/metoda analisis lain yang relevan) untuk pengembangan program studi.</li>\r\n</ol>', 3.00, 141),
(203, '<p>Unit Pengelola Program Studi (UPPS) mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan, dan</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya.</li>\r\n</ol>', 2.00, 141),
(204, '<p>Unit Pengelola Program Studi (UPPS) kurang mampu:</p>\r\n\r\n<ol>\r\n	<li>mengidentifikasi kondisi lingkungan dan industri yang relevan, dan</li>\r\n	<li>menetapkan posisi relatif program studi terhadap lingkungannya.</li>\r\n</ol>', 1.00, 141),
(205, '<p>Profil UPPS:&nbsp;<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dan konsisten dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;<br />\r\n3) menunjukkan iklim yang kondusif untuk pengembangan keilmuan program studi.<br />\r\n4) menunjukkan reputasi sebagai rujukan di bidang keilmuannya.</p>', 4.00, 142),
(206, '<p>Profil UPPS:<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dan konsisten dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;<br />\r\n3) menunjukkan iklim yang kondusif untuk pengembangan keilmuan program studi.</p>', 3.00, 142),
(207, '<p>Profil UPPS:<br />\r\n1) menunjukkan keserbacakupan informasi yang jelas dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;</p>', 2.00, 142),
(208, '<p>Profil UPPS:<br />\r\n1) kurang menunjukkan keserbacakupan informasi yang jelas dengan data dan informasi yang disampaikan pada masing-masing kriteria,<br />\r\n2) kurang menggambarkan keselarasan dengan substansi keilmuan program studi.&nbsp;</p>', 1.00, 142),
(209, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait keunikan program studi serta didukung data konsistensi implementasinya,<br />\r\n2) misi, tujuan, dan strategi yang searah dan bersinerji dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi dengan data konsistensi implementasinya.</p>', 4.00, 143),
(210, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait keunikan program studi,<br />\r\n2) misi, tujuan, dan strategi yang searah dan bersinerji dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi.</p>', 3.00, 143),
(211, '<p>UPPS memiliki:&nbsp;<br />\r\n1) visi yang mencerminkan visi perguruan tinggi dan memayungi visi keilmuan terkait program studi,<br />\r\n2) misi, tujuan, dan strategi yang searah dengan misi, tujuan, dan strategi perguruan tinggi serta mendukung pengembangan program studi.</p>', 2.00, 143),
(212, '<p>UPPS memiliki:<br />\r\n1) visi yang mencerminkan visi perguruan tinggi namun tidak memayungi visi keilmuan terkait program studi,<br />\r\n2) misi, tujuan, dan strategi kurang searah dengan misi, tujuan sasaran, dan strategi perguruan tinggi serta kurang mendukung pengembangan program studi.</p>', 1.00, 143),
(213, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan semua pemangku kepentingan internal (dosen, mahasiswa dan tenaga kependidikan) dan eksternal (lulusan, pengguna lulusan dan pakar/mitra/organisasi profesi/pemerintah).</p>', 4.00, 144),
(214, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan pemangku kepentingan internal (dosen, mahasiswa dan tenaga kependidikan) dan pemangku kepentingan eksternal (lulusan dan pengguna lulusan).&nbsp;</p>', 3.00, 144),
(215, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi serta ada keterlibatan pemangku kepentingan internal (dosen dan mahasiswa) dan pemangku kepentingan eksternal (lulusan).</p>', 2.00, 144),
(216, '<p>Ada mekanisme dalam penyusunan dan penetapan visi, misi, tujuan dan strategi yang terdokumentasi namun tidak melibatkan pemangku kepentingan.</p>', 1.00, 144),
(217, '<p>Strategi efektif untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan dan terdokumentasi serta pada pelaksanaannya dilakukan pemantauan dan evaluasi dan ditindaklanjuti.</p>', 4.00, 145),
(218, '<p>Strategi efektif untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan dan terdokumentasi serta pada pelaksanaannya dilakukan pemantauan dan evaluasi.</p>', 3.00, 145),
(219, '<p>Strategi untuk mencapai tujuan dan disusun berdasarkan analisis yang sistematis dengan menggunakan metoda yang relevan serta terdokumentasi namun belum terbukti efektifitasnya.</p>', 2.00, 145),
(220, '<p>Strategi untuk mencapai tujuan disusun berdasarkan analisis yang kurang sistematis serta tidak menggunakan metoda yang relevan.</p>', 1.00, 145),
(221, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi 3 aspek.</p>', 4.00, 148),
(222, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi aspek 1 dan 2.</p>', 3.00, 148),
(223, '<p>UPPS memiliki bukti yang sahih terkait kerjasama yang ada telah memenuhi aspek 1.</p>', 2.00, 148),
(224, '<p>UPPS tidak memiliki bukti pelaksanaan kerjasama.</p>', 1.00, 148),
(225, '<p>UPPS menetapkan indikator kinerja tambahan berdasarkan standar pendidikan tinggi yang ditetapkan perguruan tinggi. Indikator kinerja tambahan mencakup seluruh kriteria serta menunjukkan daya saing UPPS dan program studi di tingkat inernasional. Data indikator kinerja tambahan telah diukur, dimonitor, dikaji, dan dianalisis untuk perbaikan berkelanjutan.</p>', 4.00, 150);
INSERT INTO `scores` (`id`, `name`, `value`, `indikator_id`) VALUES
(226, '<p>UPPS menetapkan indikator kinerja tambahan berdasarkan standar pendidikan tinggi yang ditetapkan perguruan tinggi. Indikator kinerja tambahan mencakup sebagian kriteria serta menunjukkan daya saing UPPS dan program studi di tingkat nasional. Data indikator kinerja tambahan telah diukur, dimonitor, dikaji, dan dianalisis untuk perbaikan berkelanjutan.</p>', 3.00, 150),
(227, '<p>UPPS tidak menetapkan indikator kinerja tambahan.</p>', 2.00, 150),
(228, '<p>Tidak ada Skor kurang dari 2.</p>', 1.00, 150),
(229, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek, dilaksanakan setiap tahun dan hasilnya dipublikasikan kepada para pemangku kepentingan.</p>', 4.00, 151),
(230, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek dan dilaksanakan setiap tahun.</p>', 3.00, 151),
(231, '<p>Analisis pencapaian kinerja UPPS di tiap kriteria memenuhi 2 aspek.&nbsp;</p>', 2.00, 151),
(232, '<p>UPPS memiliki laporan pencapaian kinerja namun belum dianalisis dan dievaluasi.&nbsp;</p>', 1.00, 151),
(233, '<p>UPPS telah melaksanakan SPMI yang memenuhi 5 aspek.</p>', 4.00, 152),
(234, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 sampai dengan 4.&nbsp;</p>', 3.00, 152),
(235, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 sampai dengan 3.</p>', 2.00, 152),
(236, '<p>UPPS telah melaksanakan SPMI yang memenuhi aspek nomor 1 dan 2, serta siklus kegiatan SPMI baru dilaksanakan pada tahapan penetapan standar dan pelaksanaan standar pendidikan tinggi.</p>', 1.00, 152),
(237, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi seluruh aspek.</p>', 4.00, 153),
(238, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d 4 dan salah satu dari aspek 5 atau aspek 6.</p>', 3.00, 153),
(239, '<p>UPPS melakukan pengukuran kepuasan kepada seluruh pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d 4.</p>', 2.00, 153),
(240, '<p>UPPS melakukan pengukuran kepuasan kepada sebagian pemangku kepentingan terhadap layanan manajemen yang memenuhi aspek 1 s.d. 4.</p>', 1.00, 153),
(241, '<p>UPPS merencanakan dan mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT) secara konsisten.</p>', 4.00, 170),
(242, '<p>UPPS merencanakan dan mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 3.00, 170),
(243, '<p>UPPS mengembangkan DTPS mengikuti rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 2.00, 170),
(244, '<p>UPPS mengembangkan DTPS tidak mengikuti atau tidak sesuai dengan rencana pengembangan SDM di perguruan tinggi (Renstra PT).</p>', 1.00, 170),
(245, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta melebihi standar pembelajaran, penelitian dan PkM untuk mendukung terciptanya suasana akademik yang sehat dan kondusif.</p>', 4.00, 175),
(246, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta melebihi standar pembelajaran, penelitian dan PkM.</p>', 3.00, 175),
(247, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana telah sesuai dengan perencanaan investasi serta memenuhi standar pembelajaran, penelitian dan PkM.</p>', 2.00, 175),
(248, '<p>Persentase realisasi dana untuk investasi SDM serta Sarana dan Prasarana kurang sesuai dengan perencanaan investasi.</p>', 1.00, 175),
(249, '<p>Dana dapat menjamin keberlangsungan operasional tridharma, pengembangan 3 tahun terakhir serta memiliki kecukupan dana untuk rencana pengembangan 3 tahun ke depan yang didukung oleh sumber pendanaan yang realistis.</p>', 4.00, 176),
(250, '<p>Dana dapat menjamin keberlangsungan operasional tridharma serta pengembangan 3 tahun terakhir.</p>', 3.00, 176),
(251, '<p>Dana dapat menjamin keberlangsungan operasional tridharma dan sebagian kecil pengembangan.</p>', 2.00, 176),
(252, '<p>Dana &nbsp;dapat menjamin keberlangsungan operasional dan tidak ada untuk pengembangan.</p>', 1.00, 176),
(253, '<p>UPPS menyediakan sarana dan prasarana yang mutakhir serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 4.00, 177),
(254, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran dan meningkatkan suasana akademik.</p>', 3.00, 177),
(255, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang cukup untuk menjamin pencapaian capaian pembelajaran.</p>', 2.00, 177),
(256, '<p>UPPS menyediakan sarana dan prasarana serta aksesibiltas yang tidak cukup untuk menjamin pencapaian</p>', 1.00, 177),
(257, '<p>Terpenuhinya karakteristik proses pembelajaran program studi yang mencakup seluruh sifat, dan telah menghasilkan profil lulusan yang sesuai dengan capaian pembelajaran.&nbsp;</p>', 4.00, 179),
(258, '<p>Terpenuhinya karakteristik proses pembelajaran program studi yang berpusat pada mahasiswa, dan telah menghasilkan profil lulusan yang sesuai dengan capaian pembelajaran.&nbsp;</p>', 3.00, 179),
(259, '<p>Karakteristik proses pembelajaran program studi berpusat pada mahasiswa yang diterapkan pada minimal 50% matakuliah.</p>', 2.00, 179),
(260, '<p>Karakteristik proses pembelajaran program studi belum berpusat pada mahasiswa.</p>', 1.00, 179),
(261, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa yang dilaksanakan secara konsisten dan ditindak lanjuti.</p>', 4.00, 183),
(262, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa yang dilaksanakan secara konsisten.</p>', 3.00, 183),
(263, '<p>UPPS memiliki bukti sahih tentang sistem dan pelaksanaan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa.</p>', 2.00, 183),
(264, '<p>UPPS telah melaksanakan monitoring dan evaluasi proses pembelajaran mencakup karakteristik, perencanaan, pelaksanaan, proses pembelajaran dan beban belajar mahasiswa namun tidak semua didukung bukti sahih.</p>', 1.00, 183),
(265, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan setiap bulan.</p>', 4.00, 186),
(266, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan dua s.d tiga bulan sekali.</p>', 3.00, 186),
(267, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan empat s.d. enam bulan sekali.</p>', 2.00, 186),
(268, '<p>Kegiatan ilmiah yang terjadwal dilaksanakan lebih dari enam bulan sekali.</p>', 1.00, 186),
(269, '<p>UPPS memenuhi 4 unsur relevansi penelitian dosen dan mahasiswa.</p>', 4.00, 188),
(270, '<p>UPPS memenuhi &nbsp;unsur 1, 2, dan 3 relevansi penelitian dosen dan mahasiswa.</p>', 3.00, 188),
(271, '<p>UPPS memenuhi &nbsp;unsur 1, dan 2 relevansi penelitian dosen dan mahasiswa.</p>', 2.00, 188),
(272, '<p>UPPS memenuhi &nbsp;unsur pertama namun penelitian dosen dan mahasiswa tidak sesuai dengan peta jalan.</p>', 1.00, 188),
(273, '<p>UPPS memenuhi 4 unsur relevansi PkM dosen dan mahasiswa.</p>', 4.00, 190),
(274, '<p>UPPS memenuhi &nbsp;unsur 1, 2, dan 3 relevansi PkM dosen dan mahasiswa.</p>', 3.00, 190),
(275, '<p>UPPS memenuhi &nbsp;unsur 1, dan 2 relevansi PkM dosen dan mahasiswa.</p>', 2.00, 190),
(276, '<p>UPPS memenuhi &nbsp;unsur pertama namun PkM dosen dan mahasiswa tidak sesuai dengan peta jalan.</p>', 1.00, 190),
(277, '<p>Analisis capaian pembelajaran lulusan memenuhi 3 aspek.&nbsp;</p>', 4.00, 192),
(278, '<p>Analisis capaian pembelajaran lulusan memenuhi 2 aspek.&nbsp;</p>', 3.00, 192),
(279, '<p>Analisis capaian pembelajaran lulusan memenuhi 1 aspek.&nbsp;</p>', 2.00, 192),
(280, '<p>Analisis capaian pembelajaran lulusan tidak memenuhi ketiga aspek.&nbsp;</p>', 1.00, 192),
(281, '<p>Tracer study yang dilakukan UPPS telah mencakup 5 aspek.</p>', 4.00, 199),
(282, '<p>Tracer study yang dilakukan UPPS telah mencakup 4 aspek.</p>', 3.00, 199),
(283, '<p>Tracer study yang dilakukan UPPS telah mencakup 3 aspek.</p>', 2.00, 199),
(284, '<p>Tracer study yang dilakukan UPPS telah mencakup 2 aspek.</p>', 1.00, 199),
(285, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai) yang didukung oleh keberadaan pangkalan data institusi yang terintegrasi.<br />\r\n2) konsisten dengan seluruh kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif, tepat, dan tajam untuk mengidentifikasi akar masalah di &nbsp;UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal dan eksternal serta mudah diakses.</p>', 4.00, 206),
(286, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai) yang didukung oleh keberadaan pangkalan data institusi yang belum terintegrasi.<br />\r\n2) konsisten dengan sebagian besar (7 s.d. 8) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif dan tepat untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal serta mudah diakses.</p>', 3.00, 206),
(287, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai).<br />\r\n2) konsisten dengan sebagian (5 s.d. 6) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan secara komprehensif untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya dipublikasikan kepada para pemangku kepentingan internal.</p>', 2.00, 206),
(288, '<p>UPPS telah melakukan analisis capaian kinerja yang:&nbsp;<br />\r\n1) analisisnya tidak sepenuhnya didukung oleh data/informasi yang relevan (merujuk pada pencapaian standar mutu perguruan tinggi) dan berkualitas (andal dan memadai).<br />\r\n2) konsisten dengan sebagian kecil (kurang dari 5) kriteria yang diuraikan sebelumnya,&nbsp;<br />\r\n3) analisisnya dilakukan tidak secara komprehensif untuk mengidentifikasi akar masalah di UPPS.<br />\r\n4) hasilnya tidak dipublikasikan.</p>', 1.00, 206),
(289, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat,<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja,<br />\r\n3) merumuskan strategi pengembangan UPPS yang berkesesuaian, dan<br />\r\n4) menghasilkan program-program pengembangan alternatif yang tepat.</p>', 4.00, 207),
(290, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat,<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja, dan<br />\r\n3) merumuskan strategi pengembangan UPPS yang berkesesuaian.</p>', 3.00, 207),
(291, '<p>UPPS melakukan analisis SWOT atau analisis lain yang relevan, serta memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS dilakukan secara tepat, dan&nbsp;<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja.</p>', 2.00, 207),
(292, '<p>UPPS melakukan analisis SWOT atau analisis lain yang memenuhi aspek-aspek sebagai berikut:<br />\r\n1) melakukan identifikasi kekuatan atau faktor pendorong, kelemahan atau faktor penghambat, peluang dan ancaman yang dihadapi UPPS, dan<br />\r\n2) memiliki keterkaitan dengan hasil analisis capaian kinerja, namun tidak terstruktur dan tidak sistematis.</p>', 1.00, 207),
(293, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan,<br />\r\n3) rencana strategis UPPS yang berlaku,<br />\r\n4) aspirasi dari pemangku kepentingan internal dan eksternal, dan<br />\r\n5) program yang menjamin keberlanjutan.</p>', 4.00, 208),
(294, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan,<br />\r\n3) rencana strategis UPPS yang berlaku, dan<br />\r\n4) aspirasi dari pemangku kepentingan internal.</p>', 3.00, 208),
(295, '<p>UPPS menetapkan prioritas program pengembangan berdasarkan hasil analisis SWOT atau analisis lainnya yang mempertimbangkan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS di masa depan, dan<br />\r\n3) rencana strategis UPPS yang berlaku.</p>', 2.00, 208),
(296, '<p>UPPS menetapkan prioritas program pengembangan namun belum mempertimbangan secara komprehensif:<br />\r\n1) kapasitas UPPS,<br />\r\n2) kebutuhan UPPS dan PS, dan<br />\r\n3) rencana strategis UPPS yang berlaku.</p>', 1.00, 208),
(297, '<p>UPPS memiliki kebijakan dan upaya yang diturunkan ke dalam berbagai peraturan untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan,<br />\r\n3) rencana penjaminan mutu yang berkelanjutan, dan&nbsp;<br />\r\n4) keberadaan dukungan stakeholders eksternal.</p>', 4.00, 209),
(298, '<p>UPPS memiliki kebijakan dan upaya yang diturunkan ke dalam berbagai peraturan untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan, dan<br />\r\n3) rencana penjaminan mutu yang berkelanjutan.</p>', 3.00, 209),
(299, '<p>UPPS memiliki kebijakan dan upaya untuk menjamin keberlanjutan program yang mencakup:<br />\r\n1) alokasi sumber daya,&nbsp;<br />\r\n2) kemampuan melaksanakan, dan<br />\r\n3) rencana penjaminan mutu yang berkelanjutan.</p>', 2.00, 209),
(300, '<p>UPPS memiliki kebijakan dan upaya namun belum cukup untuk menjamin keberlanjutan program.</p>', 1.00, 209);

-- --------------------------------------------------------

--
-- Table structure for table `targets`
--

CREATE TABLE `targets` (
  `id` int(11) UNSIGNED NOT NULL,
  `l1_id` int(11) DEFAULT NULL,
  `prodi_id` int(11) DEFAULT NULL,
  `value` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `targets`
--

INSERT INTO `targets` (`id`, `l1_id`, `prodi_id`, `value`) VALUES
(1, 1, 1, 10.50),
(2, 2, 1, 8.00),
(3, 3, 1, 20.00),
(4, 4, 1, 30.00),
(5, 5, 1, 9.00),
(6, 6, 1, 40.00),
(7, 7, 1, 10.00),
(8, 8, 1, 50.00),
(9, 9, 1, 3.00),
(10, 10, 1, 10.00),
(11, 11, 1, 20.00),
(12, 12, 1, 15.00),
(13, 1, 2, 5.00),
(14, 2, 2, 17.00),
(15, 3, 2, 0.00),
(16, 4, 2, 0.00),
(17, 5, 2, 0.00),
(18, 6, 2, 0.00),
(19, 7, 2, 0.00),
(20, 8, 2, 0.00),
(21, 9, 2, 0.00),
(22, 10, 2, 0.00),
(23, 11, 2, 0.00),
(24, 12, 2, 0.00),
(25, 1, 3, 25.00),
(26, 2, 3, 10.00),
(27, 3, 3, 7.00),
(28, 4, 3, 14.00),
(29, 5, 3, 23.00),
(30, 6, 3, 14.00),
(31, 7, 3, 18.00),
(32, 8, 3, 27.00),
(33, 9, 3, 31.00),
(34, 10, 3, 40.00),
(35, 11, 3, 28.00),
(36, 12, 3, 14.80),
(37, 1, 5, 15.00),
(38, 2, 5, 30.00),
(39, 3, 5, 0.00),
(40, 4, 5, 0.00),
(41, 5, 5, 0.00),
(42, 6, 5, 0.00),
(43, 7, 5, 0.00),
(44, 8, 5, 0.00),
(45, 9, 5, 0.00),
(46, 10, 5, 0.00),
(47, 11, 5, 0.00),
(48, 12, 5, 0.00),
(49, 1, 7, 0.00),
(50, 2, 7, 0.00),
(51, 3, 7, 0.00),
(52, 4, 7, 0.00),
(53, 5, 7, 0.00),
(54, 6, 7, 0.00),
(55, 7, 7, 0.00),
(56, 8, 7, 0.00),
(57, 9, 7, 0.00),
(58, 10, 7, 0.00),
(59, 11, 7, 0.00),
(60, 12, 7, 0.00),
(61, 1, 8, 0.00),
(62, 2, 8, 0.00),
(63, 3, 8, 0.00),
(64, 4, 8, 0.00),
(65, 5, 8, 0.00),
(66, 6, 8, 0.00),
(67, 7, 8, 0.00),
(68, 8, 8, 0.00),
(69, 9, 8, 0.00),
(70, 10, 8, 0.00),
(71, 11, 8, 0.00),
(72, 12, 8, 0.00),
(73, 1, 9, 0.00),
(74, 2, 9, 0.00),
(75, 3, 9, 0.00),
(76, 4, 9, 0.00),
(77, 5, 9, 0.00),
(78, 6, 9, 0.00),
(79, 7, 9, 0.00),
(80, 8, 9, 0.00),
(81, 9, 9, 0.00),
(82, 10, 9, 0.00),
(83, 11, 9, 0.00),
(84, 12, 9, 0.00),
(85, 1, 10, 0.00),
(86, 2, 10, 0.00),
(87, 3, 10, 0.00),
(88, 4, 10, 0.00),
(89, 5, 10, 0.00),
(90, 6, 10, 0.00),
(91, 7, 10, 0.00),
(92, 8, 10, 0.00),
(93, 9, 10, 0.00),
(94, 10, 10, 0.00),
(95, 11, 10, 0.00),
(96, 12, 10, 0.00),
(97, 1, 11, 0.00),
(98, 2, 11, 0.00),
(99, 3, 11, 0.00),
(100, 4, 11, 0.00),
(101, 5, 11, 0.00),
(102, 6, 11, 0.00),
(103, 7, 11, 0.00),
(104, 8, 11, 0.00),
(105, 9, 11, 0.00),
(106, 10, 11, 0.00),
(107, 11, 11, 0.00),
(108, 12, 11, 0.00),
(109, 1, 12, 0.00),
(110, 2, 12, 0.00),
(111, 3, 12, 0.00),
(112, 4, 12, 0.00),
(113, 5, 12, 0.00),
(114, 6, 12, 0.00),
(115, 7, 12, 0.00),
(116, 8, 12, 0.00),
(117, 9, 12, 0.00),
(118, 10, 12, 0.00),
(119, 11, 12, 0.00),
(120, 12, 12, 0.00),
(121, 1, 13, 0.00),
(122, 2, 13, 0.00),
(123, 3, 13, 0.00),
(124, 4, 13, 0.00),
(125, 5, 13, 0.00),
(126, 6, 13, 0.00),
(127, 7, 13, 0.00),
(128, 8, 13, 0.00),
(129, 9, 13, 0.00),
(130, 10, 13, 0.00),
(131, 11, 13, 0.00),
(132, 12, 13, 0.00),
(133, 1, 14, 0.00),
(134, 2, 14, 0.00),
(135, 3, 14, 0.00),
(136, 4, 14, 0.00),
(137, 5, 14, 0.00),
(138, 6, 14, 0.00),
(139, 7, 14, 0.00),
(140, 8, 14, 0.00),
(141, 9, 14, 0.00),
(142, 10, 14, 0.00),
(143, 11, 14, 0.00),
(144, 12, 14, 0.00),
(145, 1, 15, 0.00),
(146, 2, 15, 0.00),
(147, 3, 15, 0.00),
(148, 4, 15, 0.00),
(149, 5, 15, 0.00),
(150, 6, 15, 0.00),
(151, 7, 15, 0.00),
(152, 8, 15, 0.00),
(153, 9, 15, 0.00),
(154, 10, 15, 0.00),
(155, 11, 15, 0.00),
(156, 12, 15, 0.00),
(157, 1, 16, 0.00),
(158, 2, 16, 0.00),
(159, 3, 16, 0.00),
(160, 4, 16, 0.00),
(161, 5, 16, 0.00),
(162, 6, 16, 0.00),
(163, 7, 16, 0.00),
(164, 8, 16, 0.00),
(165, 9, 16, 0.00),
(166, 10, 16, 0.00),
(167, 11, 16, 0.00),
(168, 12, 16, 0.00),
(169, 1, 17, 0.00),
(170, 2, 17, 0.00),
(171, 3, 17, 0.00),
(172, 4, 17, 0.00),
(173, 5, 17, 0.00),
(174, 6, 17, 0.00),
(175, 7, 17, 0.00),
(176, 8, 17, 0.00),
(177, 9, 17, 0.00),
(178, 10, 17, 0.00),
(179, 11, 17, 0.00),
(180, 12, 17, 0.00),
(181, 1, 18, 0.00),
(182, 2, 18, 0.00),
(183, 3, 18, 0.00),
(184, 4, 18, 0.00),
(185, 5, 18, 0.00),
(186, 6, 18, 0.00),
(187, 7, 18, 0.00),
(188, 8, 18, 0.00),
(189, 9, 18, 0.00),
(190, 10, 18, 0.00),
(191, 11, 18, 0.00),
(192, 12, 18, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('Admin','Ketua LPM','Ketua Program Studi','Dosen','UPPS','Mahasiswa','Alumni') NOT NULL,
  `prodi_kode` varchar(50) DEFAULT NULL,
  `prodi_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `prodi_kode`, `prodi_name`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Wakhid Rahmad Faisol', 'wakhidrf@bpmunigres.com', 'Admin', '-', '-', '$2y$10$T1VUGV3DlsToJcnNYBh5cOhmOhORSuu81vt62S4zWFxh.VtTcih3u', '2022-05-30 20:01:05', '2025-05-22 18:54:48'),
(20, 'Anisaul Hasanah, S.Pd., M.Akun.', 'anisa@bpmunigres.com', 'Admin', '-', '-', '$2y$10$lIG85w/JzjqEBQe1h2r38ePnIlRZuSXi2Yvi9R3OOoQLtgyRyVbaW', '2025-05-22 18:52:58', '2025-05-22 20:31:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berkas`
--
ALTER TABLE `berkas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indikators`
--
ALTER TABLE `indikators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenjangs`
--
ALTER TABLE `jenjangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l1_s`
--
ALTER TABLE `l1_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l2_s`
--
ALTER TABLE `l2_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l3_s`
--
ALTER TABLE `l3_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `l4_s`
--
ALTER TABLE `l4_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prodis`
--
ALTER TABLE `prodis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `targets`
--
ALTER TABLE `targets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berkas`
--
ALTER TABLE `berkas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indikators`
--
ALTER TABLE `indikators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `jenjangs`
--
ALTER TABLE `jenjangs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `l1_s`
--
ALTER TABLE `l1_s`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `l2_s`
--
ALTER TABLE `l2_s`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `l3_s`
--
ALTER TABLE `l3_s`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `l4_s`
--
ALTER TABLE `l4_s`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `prodis`
--
ALTER TABLE `prodis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=301;

--
-- AUTO_INCREMENT for table `targets`
--
ALTER TABLE `targets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
