-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 24, 2020 lúc 03:57 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `twitter`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `comment_status` varchar(145) COLLATE utf8_unicode_ci NOT NULL,
  `comment_by` int(11) NOT NULL,
  `comment_tweet` int(11) NOT NULL,
  `comment_create_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`comment_id`, `comment_status`, `comment_by`, `comment_tweet`, `comment_create_date`) VALUES
(1, 'hello', 1, 1, '2020-11-14 22:04:35'),
(2, 'x', 1, 17, '2020-11-15 15:39:31'),
(5, 'test 2', 1, 17, '2020-11-15 21:52:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follow`
--

CREATE TABLE `follow` (
  `follow_id` int(11) NOT NULL,
  `user_sender` int(11) DEFAULT NULL,
  `user_receive` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `follow`
--

INSERT INTO `follow` (`follow_id`, `user_sender`, `user_receive`, `create_date`) VALUES
(23, 15, 1, '2020-11-22 21:54:24'),
(24, 1, 3, '2020-11-23 13:33:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tweet_id` int(11) DEFAULT NULL,
  `like_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `likes`
--

INSERT INTO `likes` (`like_id`, `user_id`, `tweet_id`, `like_date`) VALUES
(54, 1, 18, '2020-11-08 11:13:30'),
(55, 1, 17, '2020-11-08 21:13:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_to` int(11) DEFAULT NULL,
  `message_from` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `message_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `retweets`
--

CREATE TABLE `retweets` (
  `retweet_id` int(11) NOT NULL,
  `retweet_status` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_retweet` int(11) DEFAULT NULL,
  `tweet_id` int(11) DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `retweets`
--

INSERT INTO `retweets` (`retweet_id`, `retweet_status`, `user_retweet`, `tweet_id`, `like_count`, `post_date`) VALUES
(1, 'hello', 1, 1, 0, NULL),
(2, 'xin chào', 15, 17, 0, NULL),
(5, 'test2', 1, 18, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trends`
--

CREATE TABLE `trends` (
  `trend_id` int(11) NOT NULL,
  `hashtag` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trends`
--

INSERT INTO `trends` (`trend_id`, `hashtag`, `create_date`) VALUES
(1, 'vku', NULL),
(2, 'hashtag1', '2020-10-31 22:09:43'),
(4, 'hashtag2', '2020-10-31 22:11:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tweets`
--

CREATE TABLE `tweets` (
  `tweet_id` int(11) NOT NULL,
  `tweet_status` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tweet_userid` int(11) DEFAULT NULL,
  `tweet_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `likes_count` int(11) DEFAULT NULL,
  `tweet_create_date` datetime DEFAULT NULL,
  `retweet_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tweets`
--

INSERT INTO `tweets` (`tweet_id`, `tweet_status`, `tweet_userid`, `tweet_image`, `likes_count`, `tweet_create_date`, `retweet_count`) VALUES
(1, 'hello', 1, '', 0, '2020-10-29 16:19:12', 2),
(17, 'test 1', 1, '', 1, '2020-11-07 23:19:16', 1),
(18, '', 1, 'public/imagetweet/received_175650173343462.jpeg', 1, '2020-11-08 11:13:26', 1),
(26, 'xin chào', 1, 'public/imagetweet/FB_IMG_1530169288179.jpg', 0, '2020-11-16 21:53:45', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_image` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `following` int(11) DEFAULT NULL,
  `followers` int(11) DEFAULT NULL,
  `bio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `screen_name`, `profile_image`, `profile_cover`, `following`, `followers`, `bio`, `country`, `website`) VALUES
(1, 'nhat123', 'nhatkt21@gmail.com', '123456', 'lenhat132', 'public/imageUser/FB_IMG_1536675621414.jpg', 'public/imageUser/10 - sPlzio1.png', 1, 1, 'hello', 'viet nam', ''),
(3, 'NGUYENVANA', 'a@gmail.com', '1234567', 'nhat123', 'public/imageUser/5 - s7hHbrm.jpg', 'public/imageUser/microsoft-thua-nhan-loi-tu-khoi-dong-lai-do-ban-cap-nhat-windows-10-e52-5042064.jpg', 1, 0, 'asa', NULL, NULL),
(15, 'leducnhat', 'nhatkt2ddd1@gmail.com', '12323232', 'Lê Nhật', 'public/imageUser/28 - uzJFj76.png', 'public/imageUser/microsoft-thua-nhan-loi-tu-khoi-dong-lai-do-ban-cap-nhat-windows-10-e52-5042064.jpg', 0, 1, 'ddsdsd', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_comt_u` (`comment_by`),
  ADD KEY `fk_comt_t` (`comment_tweet`);

--
-- Chỉ mục cho bảng `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `fk_sender_us` (`user_sender`),
  ADD KEY `fk_receive_us` (`user_receive`);

--
-- Chỉ mục cho bảng `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `fk_like_user` (`user_id`),
  ADD KEY `fk_like_tweet` (`tweet_id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `fk_msgto_us` (`message_to`),
  ADD KEY `fk_msgfrom_us` (`message_from`);

--
-- Chỉ mục cho bảng `retweets`
--
ALTER TABLE `retweets`
  ADD PRIMARY KEY (`retweet_id`),
  ADD KEY `fk_rt_us` (`user_retweet`),
  ADD KEY `fk_rt_tw` (`tweet_id`);

--
-- Chỉ mục cho bảng `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`trend_id`);

--
-- Chỉ mục cho bảng `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`tweet_id`),
  ADD KEY `fk_tw_us` (`tweet_userid`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `follow`
--
ALTER TABLE `follow`
  MODIFY `follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `retweets`
--
ALTER TABLE `retweets`
  MODIFY `retweet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `trends`
--
ALTER TABLE `trends`
  MODIFY `trend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tweets`
--
ALTER TABLE `tweets`
  MODIFY `tweet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comt_t` FOREIGN KEY (`comment_tweet`) REFERENCES `tweets` (`tweet_id`),
  ADD CONSTRAINT `fk_comt_u` FOREIGN KEY (`comment_by`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `fk_receive_us` FOREIGN KEY (`user_receive`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_sender_us` FOREIGN KEY (`user_sender`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_like_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`),
  ADD CONSTRAINT `fk_like_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_msgfrom_us` FOREIGN KEY (`message_from`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `fk_msgto_us` FOREIGN KEY (`message_to`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `retweets`
--
ALTER TABLE `retweets`
  ADD CONSTRAINT `fk_rt_tw` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`),
  ADD CONSTRAINT `fk_rt_us` FOREIGN KEY (`user_retweet`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `fk_tw_us` FOREIGN KEY (`tweet_userid`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
