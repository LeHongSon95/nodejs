-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 15, 2022 lúc 03:39 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `labnodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai`
--

CREATE TABLE `loai` (
  `idLoai` int(11) NOT NULL,
  `tenLoai` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `thuTu` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai`
--

INSERT INTO `loai` (`idLoai`, `tenLoai`, `thuTu`, `anHien`) VALUES
(1, 'Lịch sử', 1, 1),
(2, 'Văn học ', 2, 0),
(3, 'Nghệ thuật sống', 3, 1),
(4, 'Đời sống', 4, 1),
(5, 'Thiếu nhi', 5, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `idSach` int(11) NOT NULL,
  `tenSach` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `moTa` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `urlHinh` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `capNhat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gia` double NOT NULL,
  `idLoai` int(11) NOT NULL,
  `anHien` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`idSach`, `tenSach`, `moTa`, `urlHinh`, `capNhat`, `gia`, `idLoai`, `anHien`) VALUES
(1, 'Sống Chậm Đợi Nắng Lên', 'Lúc con trai còn nhỏ, tôi thường có những trò chơi đố vui dành cho con. Các câu đố thường lấy chủ đề về thiên nhiên, cây cối và loài vật gần gũi trong đời sống hàng ngày. Tôi luôn mong muốn con được trải lòng với vạn vật xung quanh một cách dịu lành và ngọt ngào.\r\n\r\nNhớ có lần tôi hỏi con: Đố con, đây là con gì? Lúc thò cổ / Lúc rụt đầu/  Hễ đi đâu đó / Mang nhà đi theo. Con đã ngẩn tò te suốt cả buổi rồi tự hỏi: Sao lại có con vật mang nhà đi theo bố nhỉ.\r\n\r\nĐến khi con không thể giải đố được, ', 'images/song-cham-doi-nang-len.png', '2022-01-13 17:00:00', 85900, 3, 1),
(2, 'Sống Xanh Như Những Lá Trà', 'Trong cuốn sách thú vị này, bạn sẽ được khám phá kho tàng ý tưởng về sự đơn giản, tiết kiệm, các phương pháp tự chế và cả trí tuệ của người Nhật. Chính Kayaki đã áp dụng điều mà cô gọi là ‘Green tea living’ - gồm ăn thực phẩm ít calo, tập thể dục và thiền định... vào cuộc sống. Cô cũng đưa ra lời khuyên về việc thường xuyên ăn súp miso, sử dụng phương pháp bấm huyệt, thử dùng dầu ô-liu cho da khô, massage da mặt bằng thìa và các gợi ý để sống cuộc sống thanh đạm.\r\n\r\nTrà xanh không chỉ có lợi cho', 'images/song-xanh-nhu-nhung-la-tra.png', '2022-01-13 17:00:00', 109000, 3, 1),
(3, 'Sống Như Lần Đầu, Yêu Như Lần Cuối', 'Cuốn sách là những câu chuyện đời sống hằng ngày, như chuyện của những tấm bưu thiếp, những lá thư tay, những hạnh phúc giản dị mà chúng ta dễ dàng bỏ lỡ, đặc điểm con người, đời sống ở những vùng miền mà tác giả đã đi qua, hay những cảm xúc đang chi phối mỗi người. Từ những trải nghiệm cá nhân, tác giả muốn chia sẻ lại những cảm xúc của mình về cách nhìn nhận từ những điều nhỏ nhất, đến những quan điểm về cuộc sống nhân sinh. Qua những trang viết đầy chân thành của một người trẻ, Denley Lupin c', 'images/song-nhu-lan-dau-tien-yeu-thuong-nhu-lan-cuoi.jpg', '2022-01-13 17:00:00', 99000, 3, 1),
(4, 'Những Ngày Đầy Nắng', '“Bạn thân mến! Tôi chưa bao giờ nghĩ mình sẽ viết sách. Tôi cũng chưa bao giờ tin, mình có thể làm bánh. Tôi chưa bao giờ biết được rằng, ước mơ lại có giá trị lớn lao đến như vậy, cho đến khi tôi thật sự chạm tay vào… Nếu như hôm đó, trong rất nhiều những thất bại của bản thân, những ngã rẽ, những con đường, rất nhiều những hoạch định tương lai nhưng không có lối đi, hay nơi nào mà mình thật sự thuộc về, nếu tôi bỏ cuộc, chắc chắn, sẽ không có Những ngày đầy nắng, cũng không có tôi của ngày hôm', 'images/nhung-ngay-day-nang.png', '2022-01-13 17:00:00', 129000, 3, 1),
(5, 'Sức Mạnh Của Sự Tử Tế', 'Bạn có nhớ nụ cười của một người lạ khi bạn giữ cửa cho họ bước qua hay lời cảm ơn chân thành từ một người bạn khi được bạn giúp đỡ không? Có phải bạn cảm thấy hạnh phúc đến lạ khi làm được điều gì đó cho người khác, dù việc bạn làm vô cùng nhỏ bé? Nụ cười của họ có thể làm bạn vui cả ngày, và lời cảm ơn chân thành từ người nhận giúp bạn cảm thấy cuộc sống mình có ý nghĩa hơn. \r\n\r\nĐó chính là sức mạnh từ sự tử tế - những việc làm nhỏ bé nhưng mang đến niềm hạnh phúc to lớn. Chúng ta đang sống tr', 'images/suc-manh-cua-su-tu-te.png', '2022-01-13 17:00:00', 68000, 3, 1),
(6, 'Để Có Một Tương Lai', 'Trong xã hội có rất nhiều mối nguy. Nếu chúng ta đặt một người trẻ vào xã hội mà không tìm cách bảo vệ họ, họ sẽ tiếp nhận những bạo động, căm thù, sợ hãi và bất an mỗi ngày, rốt cuộc họ sẽ bị bệnh. Những câu chuyện của chúng ta, những chương trình tivi, quảng cáo, sách báo đều tưới tẩm các hạt giống khổ đau nơi những người trẻ và cả những người lớn. Chúng ta cần một vài nguyên tắc, vài phương thuốc cho căn bệnh của mình, những gì lành, đẹp và thật để có thể nương tựa vào.\r\n\r\n2.500 năm trước, Bụ', 'images/de-co-mot-tuong-lai.png', '2022-01-13 17:00:00', 155000, 3, 1),
(7, 'Cân Bằng Cảm Xúc, Cả Lúc Bão Giông', 'Một ngày, chúng ta có khoảng 16 tiếng tiếp xúc với con người, công việc, các nguồn thông tin từ mạng xã hội, loa đài báo giấy… Việc này mang đến cho bạn vô vàn cảm xúc, cả tiêu cực lẫn tích cực. \r\nBạn có thể thấy vui khi nhìn một em bé đến trường nhưng 5 phút sau đã nổi cơn tam bành khi bị đứa trẻ con đi xe đạp đâm sầm vào lại còn ăn vạ. \r\nHoặc bạn rất dễ phát điên nếu như chỉ còn 5 giây nữa đèn giao thông chuyển từ đỏ sang xanh mà kẻ đi đằng sau bấm còi inh ỏi.\r\nHay là, bạn thấy buồn chỉ vì hôm', 'images/can-bang-cam-xuc-ca-luc-bao-giong.jpg', '2022-01-13 17:00:00', 96000, 3, 1),
(8, 'Hiểu Về Trái Tim', 'Xuất bản lần đầu tiên vào năm 2011, Hiểu Về Trái Tim trình làng cùng lúc với kỷ lục: cuốn sách có số lượng in lần đầu lớn nhất: 100.000 bản. Trung tâm sách kỷ lục Việt Nam công nhận kỳ tích ấy nhưng đến nay, con số phát hành của Hiểu Về Trái Tim vẫn chưa có dấu hiệu chậm lại.\r\n\r\nLà tác phẩm đầu tay của nhà sư Minh Niệm, người sáng lập dòng thiền hiểu biết (Understanding Meditation), kết hợp giữa tư tưởng Phật giáo Đại thừa và Thiền nguyên thủy Vipassana, nhưng Hiểu Về Trái Tim không phải tác phẩ', 'images/hieu-ve-trai-tim.jpg', '2022-01-14 10:07:41', 138000, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `fullName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `userNam` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`idUser`, `fullName`, `userNam`, `password`, `role`) VALUES
(0, 'Lê Hồng Sơn', 'admin', '123', 1),
(0, 'sơn', 'user', '123', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`idLoai`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`idSach`),
  ADD KEY `idLoai` (`idLoai`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `loai`
--
ALTER TABLE `loai`
  MODIFY `idLoai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `idSach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`idLoai`) REFERENCES `loai` (`idLoai`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
