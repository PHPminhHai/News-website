
DROP DATABASE IF EXISTS webtintuc;
CREATE DATABASE IF NOT EXISTS webtintuc
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

USE webtintuc;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users(
	idUser int(11) AUTO_INCREMENT, 
	fullName varchar(50) NOT NULL,
	gender int(1) NOT NULL,
	birthDay date NOT NULL,
	userName varchar(50) NOT NULL  UNIQUE,
	passWord varchar(50) NOT NULL,
	userEmail varchar(100) NOT NULL UNIQUE,
	userPhone varchar(12) NULL UNIQUE,
	userAddress varchar(100) DEFAULT NULL,
	userAdmin tinyint(1) DEFAULT '0',
	PRIMARY KEY (idUser)
);


DROP TABLE IF EXISTS theloai;
CREATE TABLE IF NOT EXISTS theloai(
	idTheLoai varchar(10),
	tenTheLoai varchar(255) NOT NULL,
	tenTheLoaiKhongDau varchar(255) NOT NULL,
	thuTu tinyint(2) NOT NULL,
	anHien tinyint(1) NULL DEFAULT '0',
	PRIMARY KEY(idTheLoai)
);



DROP TABLE IF EXISTS loaitin;
CREATE TABLE IF NOT EXISTS loaitin(
	idLoaiTin int(11)  AUTO_INCREMENT,
	idTheLoai varchar(10) NOT NULL,
	tenLoaiTin varchar(255) NOT NULL,
	tenLoaiTinKhongDau varchar(255) NOT NULL,
	thuTu tinyint(2) NOT NULL  DEFAULT '1' UNIQUE,
	anHien tinyint(1)  DEFAULT '0' NUll,
	PRIMARY KEY (idLoaiTin),
	INDEX idLoaiTin(idTheLoai),
	FOREIGN KEY (idTheLoai) REFERENCES theloai(idTheLoai) ON DELETE CASCADE

);

DROP TABLE IF EXISTS tinchitiet;
CREATE TABLE IF NOT EXISTS tinchitiet(
	idTinChiTiet int(11)  AUTO_INCREMENT,
	idTheLoai varchar(10) NOT NULL,
	idLoaiTin int(11) NOT NULL,
	tieuDe varchar(255) NOT NULL,
	tieuDeKhongDau varchar(255) NULL,
	tomTat varchar(255) DEFAULT NULL,
	noiDung text NOT NULL,
	image varchar(255) DEFAULT NULL,
	ngayDang timestamp NOT NULL DEFAULT
	CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	tinNoiBat tinyint(1) DEFAULT '0',
	soLanXem tinyint(1) DEFAULT '0',
	anHien tinyint(1)  DEFAULT '0',
	PRIMARY KEY (idTinChiTiet),
	INDEX idTheLoai(idTheLoai),
	INDEX idLoaiTin(idLoaiTin),
	FOREIGN KEY (idTheLoai) REFERENCES theloai(idTheLoai) ON DELETE CASCADE,
	FOREIGN KEY(idLoaiTin) REFERENCES loaitin(idLoaiTin)

);

DROP TABLE IF EXISTS quangcao;
CREATE TABLE IF NOT EXISTS quangcao(
	idQuangCao int(11) AUTO_INCREMENT,
	idUser int(11) NOT NULL,
	image varchar(255) NOT NUll,
	groupImage tinyint(1) NOT NUll,
	PRIMARY KEY (idQuangCao)
);

DROP TABLE IF EXISTS slide;
CREATE TABLE IF NOT EXISTS slide(
	idSlide int(11) AUTO_INCREMENT,
	idUser int(11) NOT NULL,
	image varchar(255) NOT NUll,
	groupImage tinyint(1) NOT NUll,
	PRIMARY KEY (idSlide)
);


INSERT INTO users(fullName, gender, birthDay, userName, passWord, userEmail, userPhone, userAddress, userAdmin)
VALUES('Minh Hai','1','2019-05-05','minhhai','123456','minhhai@gmail.com','0123456789','abc','1'),
('abc','1','2019-05-05','abc','123456','abc@gmail.com','01234567888','abc','1');


INSERT INTO theloai(idTheLoai, tenTheLoai, tenTheLoaiKhongDau, thuTu, anHien)
VALUES('XH','Xã Hội','Xa-Hoi','1',''),
('TG','Thế Giới','The-Gioi','2',''),
('KD','Kinh Doanh','Kinh-Doanh','3',''),
('VH','Văn Hóa','Văn Hóa','4',''),
('DS','Đời Sống','Doi-Song','5',''),
('TT', 'Thể Thao', 'The-Thao', '6',''),
('PL', 'Pháp Luật', 'Phap-Luat','7','');



INSERT INTO loaitin(idLoaiTin, idTheLoai, tenLoaiTin, tenLoaiTinKhongDau, thuTu, anHien)
VALUES(1,'XH', 'Giáo Dục', 'Giao-Duc','1',''),
(2,'XH', 'Nhịp Điệu Trẻ', 'Nhip-Dieu-Tre', '2',''),
(3,'XH', 'Du Lịch', 'Du-Lich','3',''),
(4,'KD', 'Du Học', 'Du-Hoc','4',''),
(5,'KD', 'Cuộc Sống Đó Đây', 'Cuoc-Song-Do-Day','5',''),
(6,'KD', 'Ảnh', 'Anh','6',''),
(7,'TG', 'Người Việt 5 Châu', 'Nguoi-Viet-5-Chau','7',''),
(8,'TG', 'Phân Tích', 'Phan-Tich','8',''),
(9,'TG', 'Chứng Khoán', 'Chung-Khoan','9',''),
(10,'VH','Bất Động Sản', 'Bat-Dong-San', '10',''),
(11,'VH', 'Doanh Nhân', 'Doanh-Nhan','11',''),
(12,'VH', 'Quốc Tế', 'Quoc-Te', '12',''),
(13,'DS', 'Mua Sắm', 'Mua-Sam','13',''),
(14,'DS',  'Doanh Nghiệp Viết', 'Doanh-Nghiep-Viet','14',''),
(15,'DS',  'Hoa Hậu', 'Hoa-Hau', '15',''),
(16, 'TT','Nghệ Sỹ', 'Nghe-Sy', '16',''),
(17,'TT', 'Âm Nhạc', 'Am-Nhac', '17',''),
(18,'TT', 'Thời Trang', 'Thoi-Trang','18',''),
(19,'PL', 'Điện Ảnh', 'Dien-Anh','19',''),
(20,'PL', 'Mỹ Thuật', 'My-Thuat', '20',''),
(21,'PL', 'Bóng Đá', 'Bong-Da', '21','');


INSERT INTO tinchitiet(idLoaiTin, idTheLoai,  tieuDe, tieuDeKhongDau, tomTat, noiDung, image)
VALUES('1','XH','GS Trương Nguyện Thành làm hiệu phó Đại học Văn Lang','','Một năm sau khi rời Đại học Hoa Sen, ông Trương Nguyện Thành từ Mỹ về Việt Nam làm Phó hiệu trưởng Đại học Văn Lang.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','1.jpg'),
('1','XH','Đề thi vào lớp 10 ở Nghệ An có khổ thơ giống đề khảo sát học kỳ','','Lãnh đạo Sở Giáo dục và Đào tạo Nghệ An khẳng định việc ra đề thi vào lớp 10 đúng quy trình, không có động cơ của người ra đề.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','2.jpg'),
('2','XH','Chín cách giúp trẻ hết lười ăn rau','','Cha mẹ hãy để trẻ tập ăn rau từ rau củ chứa nhiều tinh bột, có vị ngọt, như: khoai tây, cà rốt, ngô, đậu Hà Lan, khoai lang...','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','3.jpg'),
('2','XH','Những từ chỉ đơn vị đo lường trong tiếng Anh','','Để nói về lượng nước, sữa hay soda, bạn có thể dùng "a glass of water/milk/soda" (một cốc).','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','4.jpg'),
('3','XH','Cách in tranh từ giấy lên đá và gỗ với keo sữa ','','Với một viên đá, một bức tranh hoặc ảnh, keo PVA (keo sữa) và nước, bạn có thể cùng con tạo nên bức tranh trên đá đẹp mắt. ','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','5.jpg'),
('3','XH','Cụ ông 84 tuổi tham dự kỳ thi đại học ở Trung Quốc','','"Bỏ nhiều công sức cho kỳ thi, tôi không muốn kết thúc khi chưa đạt thành tích mong muốn", ông Yao Keliang chia sẻ lý do thi lần thứ tư.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','6.jpg'),
('4','TG','Trung Quốc sẽ hạn chế xuất khẩu một số công nghệ sang Mỹ','','Truyền thông Trung Quốc đưa tin Bắc Kinh đang xây dựng cơ chế bảo vệ công nghệ trong bối cảnh căng thẳng thương mại với Mỹ gia tăng.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','7.jpg'),
('4','TG','Việt Nam sẽ thúc đẩy giải quyết vấn đề hòa bình ở HĐBA','','Thủ tướng nhấn mạnh Việt Nam có kinh nghiệm, khả năng và chuẩn bị sẵn sàng để thúc đẩy giải quyết vấn đề hòa bình, an ninh quốc tế.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','8.jpg'),
('5','TG','Con gái tỷ phú sòng bạc Macau kết hôn với sinh viên Harvard  ','','Hà Siêu Doanh đeo đầy trang sức vàng, mặc váy đỏ trong đám cưới kiểu truyền thống với người chồng kém 7 tuổi.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','9.jpg'),
('5','TG','Binh sĩ Trung Quốc tranh thủ mua sữa bột khi tàu chiến thăm Australia','','Sữa công thức Australia là sản phẩm được ưa chuộng ở Trung Quốc nên các binh sĩ thăm cảng Sydney đã mua nhiều thùng hàng.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','10.jpg'),
('6','TG','Hội trường vang tiếng vỗ tay khi Việt Nam trúng cử ủy viên HĐBA  ','','Đại diện các quốc gia tại Liên Hợp Quốc chúc mừng Việt Nam trúng cử ủy viên không thường trực Hội đồng Bảo an với số phiếu cao kỷ lục.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','11.jpg'),
('6','TG','Quan chức Mỹ - Trung sẽ họp riêng bên lề G20','','Hai quan chức tài chính hàng đầu Mỹ - Trung sẽ họp vào cuối tuần này nhưng đột phá chỉ có khả năng diễn ra khi Trump - Tập gặp nhau.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','12.jpg'),
('7','DS','50 nghìn đồng một quả cà dầm tương','','Có ngôi nhà ở ven Thượng Hải, anh Trương muốn bán đi để mua 2 căn hộ nhỏ. Anh là điển hình của những người có nhiều tiền nhưng nghèo.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','13.jpg'),
('7','DS','Những triệu phú nghèo ở Trung Quốc','','Phao cổ được nhiều bố mẹ lựa chọn, nhưng nếu không cẩn thận có thể làm tổn thương cổ của bé, và trẻ cũng dễ bị cắm đầu xuống nước.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','14.jpg'),
('8','DS','7 sản phẩm vô dụng mà nhiều người mua cho trẻ 38','','Do cửa sổ nhà bếp mở, bé gái 6 tuổi ở nhà một mình đã chui ra, ngã từ tầng 11 xuống đất.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','15.jpg'),
('8','DS','Bé gái Singapore rơi từ tầng 11 vì mẹ quên khóa cửa sổ nhà bếp','','','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','16.jpg'),
('9','DS','Phụ kiện hữu ích cho nhà tắm, nhà vệ sinh','','Vòi sen tăng áp, vòi xịt rửa vệ sinh tự động, nắp bồn cầu thông minh được ưa chuộng cho không gian nhà hiện đại','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','17.jpg'),
('9','DS','Lời giải cho nhà ống Sài Gòn có mặt tiền bị méo','','Trên mảnh đất hình ống nhưng mặt tiền méo, kiến trúc sư đã cố gắng tận dụng hết đất, đồng thời tạo thêm 3 phòng khép kín cho thuê.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','18.jpg'),
('10','VH','Phụ nữ nên sinh con ở độ tuổi bao nhiêu?','','Hầu hết cầu thủ tuyển Curaçao cao trên 1,8 m, trong đó hai người vượt 1,9 m.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','19.jpg'),
('10','VH','Dàn cầu thủ cao trên 1,8 m của Curaçao','','Hầu hết cầu thủ tuyển Curaçao cao trên 1,8 m, trong đó hai người vượt 1,9 m.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','20.jpg'),
('11','VH','Những thực phẩm bạn không nên ăn sống','','Không nên ăn sống khoai tây, khoai mì, đậu thận, cà tím, nấm dại, uống sữa chưa được tiệt trùng. ','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','21.jpg'),
('11','VH','5 phút tập Cardio đốt cháy calo ','','Huấn luyện viên Shin Phamm hướng dẫn tập động tác bật nhảy, nâng cao đùi, chống đẩy giúp đốt cháy mỡ thừa hiệu quả. ','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','22.jpg'),
('12','VH','Khu thư giãn dành cho vận động viên VnExpress Marathon','','Nhãn hàng Tiger Balm dự kiến phục vụ trên 3000 vận động viên giảm mệt mỏi và đau cơ trước và sau thi đấu.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','23.jpg'),
('12','VH','Hơn một triệu ca bệnh lây qua đường tình dục mỗi ngày','','Nam giới bỏ điện thoại vào túi quần dễ sinh nhiệt ảnh hưởng đến sức khỏe sinh sản; bức xạ cũng gây đau đầu, chóng mặt.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','24.jpg'),
('13','KD','5 thói quen dùng điện thoại có hại sức khỏe ','','Tôi 43 tuổi, mỗi khi ngồi xổm rồi đứng lên đều bị chóng mặt, hoa mắt. Xin hỏi bác sĩ tôi bị bệnh gì và cách điều trị? (Chinh)','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','25.jpg'),
('13','KD','Các nước G20 sắp siết luật thuế với đại gia công nghệ','','Các mô hình khởi nghiệp mới thúc đẩy sự phát triển, nhưng cũng là thách thức với cơ chế quản lý và các mô hình kinh doanh cũ.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','26.jpg'),
('14','KD','Các vòng huy động vốn thường gặp của startup','','Nhóm bộ trưởng tài chính các nước G20 đồng ý soạn thảo luật thuế chung, nhằm lấp các lỗ hổng giúp Facebook hay Google giảm số thuế phải nộp.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','27.jpg'),
('14','KD','Bài toán đổi mới sáng tạo với khởi nghiệp Việt Nam','','Trong quá trình tìm kiếm nguồn đầu tư cho dự án, startup thường trải qua các vòng gọi vốn như hạt giống, series A, B, C…','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','28.jpg'),
('15','KD','Các địa phương kêu thiếu tiền hỗ trợ tiêu huỷ lợn dịch tả châu Phi','','Bộ Nông nghiệp & Phát triển nông thôn đề xuất chi trả hỗ trợ vật nuôi tiêu huỷ theo tỷ lệ % giá thành.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','29.jpg'),
('15','KD','Giá vàng miếng tăng vọt theo thế giới','','Mỗi lượng vàng tăng 70.000 – 100.000 đồng, khi giá thế giới lên đỉnh 14 tháng.','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','30.jpg'),
('16','TT','Việt Nam thua đá luân lưu chung kết King Cup ','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','31.jpg'),
('16','TT','Những VĐV đặc biệt của VnExpress Marathon 2019  ','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','32.jpg'),
('17','TT','Tương Giang - pacer U60 khát vọng truyền cảm hứng tại VM Quy Nhơn 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','33.jpg'),
('17','TT','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','34.jpg'),
('18','TT','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','35.jpg'),
('18','TT','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','36.jpg'),
('19','PL','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','37.jpg'),
('19','PL','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','38.jpg'),
('20','PL','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','39.jpg'),
('20','PL','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','40.jpg'),
('21','PL','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','41.jpg'),
('21','PL','Những VĐV đặc biệt của VnExpress Marathon 2019','','Những VĐV đặc biệt của VnExpress Marathon 2019','Cô gái lộ vòng một vì khỉ kéo tụt váy trong rừng thiêng Bali
	Nữ du khách New Zealand ngại ngùng vì hành động bất ngờ của con khỉ, trong khi những người xung quanh bật cười.
	Nữ du khách bị đười ươi sàm sỡ khi chụp ảnh chung   /  	Đười ươi tát vào mặt du khách vì đòi selfie chung
	Sarah Wijohn, 21 tuổi, du lịch đảo Bali (Indonesia) để kỷ niệm sinh nhật cùng gia đình, trong đó ghé thăm rừng thiêng Sacred Monkey Forest Sanctuary.
	Một con khỉ ngồi trong lòng khi Sarah tạo dáng chụp ảnh và bất ngờ kéo tụt váy của cô rồi bỏ chạy. Nữ du khách vội vàng chỉnh lại trang phục trong khi những người xung quanh phá lên cười.
	Cô gái lộ ngực vì bị khỉ kéo váy trong rừng thiêng Bali   Người thân ghi hình Sarah và con khỉ vào ngày 29/5. Video: Mirror.
	Bà Katrina, mẹ của Sarah, mới đây chia sẻ về kỷ niệm hài hước của cả gia đình: "Chúng tôi đã có trận cười lớn nhờ con khỉ đó. Nhìn chung, chuyến đi Bali thật tuyệt vời".
	Rừng khỉ thiêng là điểm tham quan phổ biến tại Bali, nơi khách có thể chụp ảnh và chơi đùa cùng những đàn khỉ hoang dã. Tuy nhiên, du khách được khuyến cáo không cho khỉ ăn và giữ chặt những đồ vật có giá trị, bởi các con vật đã quen với người và có thể phản ứng khó lường.
	Sarah không phải nữ du khách đầu tiên có trải nghiệm đỏ mặt khi tiếp xúc với khỉ. Năm ngoái, Brittany Bowman cũng bị một con khỉ nhỏ tinh nghịch kéo tuột áo trễ vai của cô trong chuyến du lịch Chiang Mai, Thái Lan.
	"Tôi rất sợ hãi khi con khỉ nhảy lên người, đến nỗi không nghĩ tới chuyện nó có thể tụt áo mình xuống. Chuyện này chỉ là tình cờ, thật vui vì chúng tôi đã ghi lại trong camera", nữ du khách Mỹ nói.','42.jpg');


INSERT INTO `slide` (idSlide, image, groupImage) VALUES
(1,  'a.jpg',1),
(2, 'b.jpg',1),
(3, 'c.jpg',1);


