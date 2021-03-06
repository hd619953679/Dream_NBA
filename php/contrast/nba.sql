-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-11-29 14:33:55
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nba`
--

-- --------------------------------------------------------

--
-- 表的结构 `player`
--

CREATE TABLE `player` (
  `pid` int(11) NOT NULL,
  `Chpname` varchar(30) NOT NULL DEFAULT '',
  `Enpname` varchar(30) NOT NULL DEFAULT '',
  `photo` varchar(20) NOT NULL DEFAULT '',
  `team_id` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `position` varchar(20) NOT NULL DEFAULT '',
  `tall` smallint(6) NOT NULL DEFAULT '0',
  `weight` double(5,1) NOT NULL DEFAULT '0.0',
  `age` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `player`
--

INSERT INTO `player` (`pid`, `Chpname`, `Enpname`, `photo`, `team_id`, `num`, `position`, `tall`, `weight`, `age`) VALUES
(1, '艾尔-霍福德', 'Al Horford', 'ketr1.png', 1, 42, '中锋', 208, 111.1, 31),
(2, '阿米尔-约翰逊', 'Amir Johnson', 'ketr2.png', 1, 90, '前锋', 205, 108.8, 30),
(3, '埃弗里-布拉德利', 'Avery Bradley', 'ketr3.png', 1, 0, '后卫', 187, 81.6, 26),
(4, '以赛亚-托马斯', 'Isaiah Thomas', 'ketr4.png', 1, 4, '后卫', 175, 83.9, 28),
(5, '贾伊-克劳德', 'Jae Crowder', 'ketr5.png', 1, 99, '前锋', 198, 106.6, 26),
(11, '勒布朗-詹姆斯', 'LeBron James', 'qs1.png', 2, 23, '前锋', 203, 113.4, 32),
(12, '凯文-乐福', 'Kevin Love', 'qs2.png', 2, 0, '前锋', 208, 113.8, 28),
(15, '凯尔-科沃尔', 'Kyle Korver', 'qs3.png', 2, 26, '后卫', 200, 96.1, 36),
(17, 'J.R.史密斯', 'JR Smith', 'qs4.png', 2, 5, '后卫', 198, 102.0, 31),
(19, '特里斯坦-汤普森', 'Tristan Thompson', 'qs5.png', 2, 13, '中锋', 205, 107.9, 26),
(21, '德玛雷-卡罗尔', 'DeMarre Carroll', 'ml1.png', 3, 5, '前锋', 203, 96.1, 30),
(22, '赛尔吉-伊巴卡', 'Serge Ibaka', 'ml2.png', 3, 9, '前锋', 208, 106.6, 27),
(23, '凯尔-洛瑞', 'Kyle Lowry', 'ml3.png', 3, 7, '后卫', 182, 93.0, 31),
(24, '德玛尔-德罗赞', 'DeMar DeRozan', 'ml4.png', 3, 10, '后卫', 200, 99.8, 27),
(25, '科里-约瑟夫', 'Cory Joseph', 'ml5.png', 3, 6, '后卫', 190, 96.2, 25),
(26, '约翰-沃尔', 'John Wall', 'qc1.png', 4, 2, '后卫', 193, 95.2, 26),
(27, '布拉德利-比尔', 'Bradley Beal', 'qc2.png', 4, 3, '后卫', 195, 93.5, 23),
(28, '马钦-戈塔特', 'Marcin Gortat', 'qc3.png', 4, 13, '中锋', 210, 108.8, 33),
(29, '布兰登-詹宁斯', 'Brandon Jennings', 'qc4.png', 4, 7, '后卫', 185, 77.1, 27),
(30, '马基夫-莫里斯', 'Markieff Morris', 'qc5.png', 4, 5, '前锋', 208, 111.1, 27),
(31, '德怀特-霍华德', 'Dwight Howard', 'ly1.png', 5, 8, '中锋', 210, 120.2, 31),
(32, '保罗-米尔萨普', 'Paul Millsap', 'ly2.png', 5, 4, '前锋', 203, 111.6, 32),
(33, '克里斯-亨弗里斯', 'Kris Humphries', 'ly3.png', 5, 43, '前锋', 205, 106.6, 32),
(34, '萨博-塞弗洛沙', 'Thabo Sefolosha', 'ly4.png', 5, 25, '前锋', 200, 99.8, 33),
(35, '加里-尼尔', 'Gary Neal', 'ly5.png', 5, 14, '后卫', 193, 95.2, 32),
(36, '格雷格-门罗', 'Greg Monroe', 'xl1.png', 6, 15, '中锋', 210, 120.2, 27),
(37, '克里斯-米德尔顿', 'Khris Middleton', 'xl2.png', 6, 22, '后卫', 203, 106.1, 25),
(38, '迈克尔-比斯利', 'Michael Beasley', 'xl3.png', 6, 9, '前锋', 208, 106.6, 28),
(39, '米尔扎-泰勒托维奇', 'Mirza Teletovic', 'xl4.png', 6, 35, '前锋', 205, 111.1, 31),
(40, '贾巴里-帕克', 'Jabari Parker', 'xl5.png', 6, 12, '前锋', 203, 113.4, 22),
(41, '保罗-乔治', 'Paul George', 'bxz1.png', 7, 13, '前锋', 205, 99.8, 27),
(42, '艾尔-杰弗森', 'Al Jefferson', 'bxz2.png', 7, 7, '中锋', 208, 131.1, 32),
(43, '赛迪斯-杨', 'Thaddeus Young', 'bxz3.png', 7, 21, '前锋', 203, 100.2, 28),
(44, '蒙塔-埃利斯', 'Monta Ellis', 'bxz4.png', 7, 11, '后卫', 190, 83.9, 31),
(45, '杰夫-蒂格', 'Jeff Teague', 'bxz5.png', 7, 44, '后卫', 187, 84.4, 29),
(46, '德怀恩-韦德', 'Dwyane Wade', 'gn1.png', 8, 3, '后卫', 193, 99.8, 35),
(47, '吉米-巴特勒', 'Jimmy Butler', 'gn2.png', 8, 21, '前锋', 200, 104.8, 27),
(48, '罗宾-洛佩兹', 'Robin Lopez', 'gn3.png', 8, 8, '中锋', 213, 115.6, 29),
(49, '拉简-朗多', 'Rajon Rondo', 'gn4.png', 8, 9, '后卫', 185, 84.4, 31),
(50, '尼古拉-米罗蒂奇', 'Nikola Mirotic', 'gn5.png', 8, 44, '前锋', 208, 107.9, 26),
(51, '克里斯-波什', 'Chris Bosh', 'rh1.png', 9, 1, '前锋', 210, 106.6, 33),
(52, '哈桑-怀特塞德', 'Hassan Whiteside', 'rh2.png', 9, 21, '前锋', 213, 120.2, 27),
(53, '戈兰-德拉季奇', 'Goran Dragic', 'rh3.png', 9, 7, '后卫', 190, 86.2, 31),
(54, '约什-麦克罗伯茨', 'Josh McRoberts', 'rh4.png', 9, 4, '前锋', 208, 108.8, 30),
(55, '迪昂-维特斯', 'Dion Waiters', 'rh5.png', 9, 11, '后卫', 193, 99.8, 25),
(56, '托拜亚斯-哈里斯', 'Tobias Harris', 'hs1.png', 10, 34, '前锋', 205, 106.6, 24),
(57, '雷吉-杰克逊', 'Reggie Jackson', 'hs2.png', 10, 1, '后卫', 190, 94.3, 27),
(58, '阿隆-贝恩斯', 'Aron Baynes', 'hs3.png', 10, 12, '中锋', 208, 117.9, 30),
(59, '马库斯-莫里斯', 'Marcus Morris', 'hs4.png', 10, 13, '前锋', 205, 106.6, 27),
(60, '安德鲁-德拉蒙德', 'Andre Drummond', 'hs5.png', 10, 0, '中锋', 210, 126.5, 23),
(61, '罗伊-希伯特', 'Roy Hibbert', 'hf1.png', 11, 34, '中锋', 218, 122.4, 30),
(62, '尼古拉斯-巴图姆', 'Nicolas Batum', 'hf2.png', 11, 5, '后卫', 203, 90.7, 28),
(63, '肯巴-沃克', 'Kemba Walker', 'hf3.png', 11, 15, '后卫', 185, 83.4, 27),
(64, '马文-威廉姆斯', 'Marvin Williams', 'hf4.png', 11, 2, '前锋', 205, 107.5, 30),
(65, '马可-贝里内利', 'Marco Belinelli', 'hf5.png', 11, 21, '前锋', 195, 95.2, 31),
(66, '卡梅隆-安东尼', 'Carmelo Anthony', 'nks1.png', 12, 7, '前锋', 203, 108.8, 33),
(67, '德里克-罗斯', 'Derrick Rose', 'nks2.png', 12, 25, '后卫', 190, 86.2, 28),
(68, '乔吉姆-诺阿', 'Joakim Noah', 'nks3.png', 12, 13, '中锋', 210, 104.3, 32),
(69, '考特尼-李', 'Courtney Lee', 'nks4.png', 12, 5, '后卫', 195, 90.7, 31),
(70, '凯尔-奥奎恩', 'Kyle O\'Quinn', 'nks5.png', 12, 9, '前锋', 208, 113.4, 27),
(71, '尼科拉-武切维奇', 'Nikola Vucevic', 'ms1.png', 13, 9, '中锋', 213, 117.9, 26),
(72, '杰夫-格林', 'Jeff Green', 'ms2.png', 13, 34, '前锋', 205, 106.6, 30),
(73, '朱迪-米克斯', 'Jodie Meeks', 'ms3.png', 13, 20, '后卫', 193, 95.2, 29),
(74, 'C.J. 沃特森', 'C.J. Watson', 'ms4.png', 13, 32, '后卫', 187, 79.4, 33),
(75, '阿隆-戈登', 'Aaron Gordon', 'ms5.png', 13, 0, '前锋', 205, 99.8, 21),
(76, '安德鲁-博古特', 'Andrew Bogut', '76r1.png', 14, 6, '中锋', 213, 117.9, 32),
(77, '蒂亚戈-斯普利特', 'Tiago Splitter', '76r2.png', 14, 47, '前锋', 210, 111.1, 32),
(78, '杰拉德-亨德森', 'Gerald Henderson', '76r3.png', 14, 12, '后卫', 195, 97.5, 29),
(79, '乔尔-恩比德', 'Joel Embiid', '76r4.png', 14, 21, '中锋', 213, 113.4, 23),
(80, '贾里尔-奥卡福', 'Jahlil Okafor', '76r5.png', 14, 8, '中锋', 210, 124.7, 21),
(81, '布鲁克-洛佩兹', 'Brook Lopez', 'lw1.png', 15, 11, '中锋', 213, 121.5, 29),
(82, '特雷沃-布克', 'Trevor Booker', 'lw2.png', 15, 35, '前锋', 203, 103.4, 29),
(83, 'KJ-麦克丹尼尔斯', 'KJ McDaniels', 'lw3.png', 15, 14, '后卫', 198, 93.0, 24),
(84, '兰迪-弗伊', 'Randy Foye', 'lw4.png', 15, 2, '后卫', 193, 98.9, 33),
(85, '路易斯-斯科拉', 'Luis Scola', 'lw5.png', 15, 4, '前锋', 205, 109.3, 37),
(86, '凯文-杜兰特', 'Kevin Durant', 'ys1.png', 16, 35, '前锋', 211, 108.8, 28),
(87, '德雷蒙德-格林', 'Draymond Green', 'ys2.png', 16, 23, '前锋', 203, 104.3, 27),
(88, '克雷-汤普森', 'Klay Thompson', 'ys3.png', 16, 11, '后卫', 200, 97.5, 27),
(89, '安德鲁-伊格达拉', 'Andre Iguodala', 'ys4.png', 16, 9, '前锋', 198, 97.5, 33),
(90, '斯蒂芬-库里', 'Stephen Curry', 'ys5.png', 16, 30, '后卫', 190, 86.2, 29),
(91, '拉马库斯-阿尔德里奇', 'LaMarcus Aldridge', 'mc1.png', 17, 12, '前锋', 210, 117.9, 31),
(92, '科怀-莱昂纳德', 'Kawhi Leonard', 'mc2.png', 17, 2, '前锋', 201, 104.3, 25),
(93, '大卫-李', 'David Lee', 'mc3.png', 17, 10, '中锋', 205, 111.1, 34),
(94, '马努-吉诺比利', 'Manu Ginobili', 'mc4.png', 17, 20, '后卫', 198, 93.0, 39),
(95, '托尼-帕克', 'Tony Parker', 'mc5.png', 17, 9, '后卫', 187, 83.9, 35),
(96, '詹姆斯-哈登', 'James Harden', 'hj1.png', 18, 13, '后卫', 195, 99.8, 27),
(97, '莱恩-安德森', 'Ryan Anderson', 'hj2.png', 18, 3, '前锋', 208, 108.8, 29),
(98, '埃里克-戈登', 'Eric Gordon', 'hj3.png', 18, 10, '后卫', 193, 97.5, 28),
(99, '特雷沃-阿里扎', 'Trevor Ariza', 'hj4.png', 18, 1, '前锋', 204, 97.5, 31),
(100, '帕特里克-贝弗利', 'Patrick Beverley', 'hj5.png', 18, 2, '后卫', 185, 83.9, 28),
(101, '克里斯-保罗', 'Chris Paul', 'kc1.png', 19, 3, '后卫', 183, 79.4, 32),
(102, '德安德烈-乔丹', 'DeAndre Jordan', 'kc2.png', 19, 6, '中锋', 210, 120.2, 28),
(103, '布雷克-格里芬', 'Blake Griffin', 'kc3.png', 19, 32, '前锋', 208, 113.8, 28),
(104, 'JJ-雷迪克', 'JJ Redick', 'kc4.png', 19, 4, '后卫', 193, 86.2, 32),
(105, '贾马尔-克劳福德', 'Jamal Crawford', 'kc5.png', 19, 11, '后卫', 195, 88.4, 37),
(106, '乔-约翰逊', 'Joe Johnson', 'js1.png', 20, 6, '后卫', 200, 108.8, 35),
(107, '戈登-海沃德', 'Gordon Hayward', 'js2.png', 20, 20, '前锋', 203, 102.5, 27),
(108, '德里克-费沃斯', 'Derrick Favors', 'js3.png', 20, 15, '中锋', 208, 120.2, 25),
(109, '亚历克-伯克斯', 'Alec Burks', 'js4.png', 20, 10, '后卫', 198, 97.0, 25),
(110, '乔治-希尔', 'George Hill', 'js5.png', 20, 3, '后卫', 190, 85.3, 31),
(111, '拉塞尔-韦斯布鲁克', 'Russell Westbrook', 'lt1.png', 21, 0, '后卫', 191, 90.7, 28),
(112, '伊内斯-坎特', 'Enes Kanter', 'lt2.png', 21, 11, '中锋', 210, 111.1, 25),
(113, '塔什-吉布森', 'Taj Gibson', 'lt3.png', 21, 22, '前锋', 205, 107.0, 31),
(114, '维克托-奥拉迪波', 'Victor Oladipo', 'lt4.png', 21, 5, '后卫', 193, 95.2, 25),
(115, '厄桑-伊利亚索瓦', 'Ersan Ilyasova', 'lt5.png', 21, 7, '前锋', 208, 106.6, 30),
(116, '钱德勒-帕森斯', 'Chandler Parsons', 'hx1.png', 22, 25, '前锋', 208, 104.3, 28),
(117, '扎克-兰多夫', 'Zach Randolph', 'hx2.png', 22, 50, '前锋', 205, 117.9, 35),
(118, '麦克-康利', 'Mike Conley', 'hx3.png', 22, 11, '后卫', 185, 79.4, 29),
(119, '布兰登-莱特', 'Brandan Wright', 'hx4.png', 22, 34, '前锋', 208, 95.2, 29),
(120, '托尼-阿伦', 'Tony Allen', 'hx5.png', 22, 9, '后卫', 193, 96.6, 35),
(121, '艾尔-法鲁克-阿米努', 'Al-Farouq Aminu', 'ktz1.png', 23, 8, '前锋', 205, 99.8, 26),
(122, '埃德-戴维斯', 'Ed Davis', 'ktz2.png', 23, 17, '前锋', 208, 111.1, 28),
(123, '埃文-特纳', 'Evan Turner', 'ktz3.png', 23, 1, '后卫', 200, 99.8, 28),
(124, '达米安-利拉德', 'Damian Lillard', 'ktz4.png', 23, 0, '后卫', 190, 88.4, 26),
(125, '迈尔斯-莱昂纳德', 'Meyers Leonard', 'ktz5.png', 23, 11, '中锋', 215, 115.6, 25),
(126, '达尼罗-加里纳利', 'Danilo Gallinari', 'jj1.png', 24, 8, '前锋', 208, 102.0, 28),
(127, '肯尼斯-法里德', 'Kenneth Faried', 'jj2.png', 24, 35, '前锋', 203, 103.4, 27),
(128, '威尔森-钱德勒', 'Wilson Chandler', 'jj3.png', 24, 21, '前锋', 203, 102.0, 30),
(129, '贾米尔-尼尔森', 'Jameer Nelson', 'jj4.png', 24, 1, '后卫', 182, 86.2, 35),
(130, '威尔-巴顿', 'Will Barton', 'jj5.png', 24, 5, '后卫', 198, 79.4, 26),
(131, '德马库斯-考辛斯', 'DeMarcus Cousins', 'th1.png', 25, 0, '中锋', 210, 122.4, 26),
(132, '朱-霍乐迪', 'Jrue Holiday', 'th2.png', 25, 11, '后卫', 193, 93.0, 26),
(133, '欧米尔-阿西克', 'Omer Asik', 'th3.png', 25, 3, '中锋', 213, 115.6, 30),
(134, '安东尼-戴维斯', 'Anthony Davis', 'th4.png', 25, 23, '前锋', 210, 114.7, 24),
(135, '贾里特-杰克', 'Jarrett Jack', 'th5.png', 25, 1, '后卫', 190, 90.7, 33),
(136, '韦斯利-马修斯', 'Wesley Matthews', 'xn1.png', 26, 23, '后卫', 195, 99.8, 30),
(137, '德克-诺维茨基', 'Dirk Nowitzki', 'xn2.png', 26, 41, '前锋', 213, 111.1, 38),
(138, '德隆-威廉姆斯', 'Deron Williams', 'xn3.png', 26, 31, '后卫', 190, 90.7, 32),
(139, 'J.J.巴里亚', 'J.J. Barea', 'xn4.png', 26, 5, '后卫', 182, 83.9, 32),
(140, '德文-哈里斯', 'Devin Harris', 'xn5.png', 26, 34, '后卫', 190, 83.9, 34),
(141, '泰-劳森', 'Ty Lawson', 'gw1.png', 27, 10, '后卫', 180, 88.4, 29),
(142, '鲁迪-盖伊', 'Rudy Gay', 'gw2.png', 27, 8, '前锋', 203, 104.3, 30),
(143, '泰瑞克-埃文斯', 'Tyreke Evans', 'gw3.png', 27, 32, '前锋', 198, 99.8, 27),
(144, '阿隆-阿弗拉罗', 'Arron Afflalo', 'gw4.png', 27, 40, '后卫', 195, 95.2, 31),
(145, '科斯塔-库佛斯', 'Kosta Koufos', 'gw5.png', 27, 41, '中锋', 213, 120.2, 28),
(146, '里基-卢比奥', 'Ricky Rubio', 'sll1.png', 28, 9, '后卫', 193, 86.2, 26),
(147, '尼科拉-佩科维奇', 'Nikola Pekovic', 'sll2.png', 28, 14, '中锋', 210, 139.2, 31),
(148, '兰斯-史蒂芬森', 'Lance Stephenson', 'sll3.png', 28, 6, '后卫', 195, 104.3, 26),
(149, '安德鲁-维金斯', 'Andrew Wiggins', 'sll4.png', 28, 22, '前锋', 203, 90.2, 22),
(150, '卡尔-安东尼-唐斯', 'Karl-Anthony Towns', 'sll5.png', 28, 32, '中锋', 213, 110.7, 21),
(151, '洛尔-邓', 'Luol Deng', 'hr1.png', 29, 9, '前锋', 205, 99.8, 32),
(152, '何塞-卡尔德隆', 'Jose Calderon', 'hr2.png', 29, 13, '后卫', 190, 90.7, 35),
(153, '路易斯-威廉姆斯', 'Lou Williams', 'hr3.png', 29, 12, '后卫', 185, 79.4, 30),
(154, '尼克-杨', 'Nick Young', 'hr4.png', 29, 0, '后卫', 200, 95.2, 32),
(155, '丹吉洛-拉塞尔', 'D\'Angelo Russell', 'hr5.png', 29, 1, '后卫', 195, 88.4, 21),
(156, '埃里克-布莱德索', 'Eric Bledsoe', 'ty1.png', 30, 2, '后卫', 185, 93.0, 27),
(157, '布兰登-奈特', 'Brandon Knight', 'ty2.png', 30, 11, '后卫', 190, 88.4, 25),
(158, '泰森-钱德勒', 'Tyson Chandler', 'ty3.png', 30, 4, '中锋', 215, 108.8, 34),
(159, '贾里德-杜德里', 'Jared Dudley', 'ty4.png', 30, 3, '前锋', 200, 102.0, 31),
(160, '亚历克斯-莱恩', 'Alex Len', 'ty5.png', 30, 21, '中锋', 215, 117.9, 23);

-- --------------------------------------------------------

--
-- 表的结构 `player_data`
--

CREATE TABLE `player_data` (
  `pdId` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `s_hit_rate` double(6,1) NOT NULL DEFAULT '0.0',
  `t_hit_rate` double(6,1) NOT NULL DEFAULT '0.0',
  `score` double(6,1) NOT NULL DEFAULT '0.0',
  `rebound` double(6,1) NOT NULL DEFAULT '0.0',
  `assist` double(6,1) NOT NULL DEFAULT '0.0',
  `ST` double(6,1) NOT NULL DEFAULT '0.0',
  `block_shot` double(6,1) NOT NULL DEFAULT '0.0',
  `fault` double(6,1) NOT NULL DEFAULT '0.0',
  `session` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `player_data`
--

INSERT INTO `player_data` (`pdId`, `pid`, `s_hit_rate`, `t_hit_rate`, `score`, `rebound`, `assist`, `ST`, `block_shot`, `fault`, `session`) VALUES
(1, 1, 47.3, 35.5, 14.0, 6.8, 5.0, 0.8, 1.3, 1.0, 68),
(2, 2, 57.6, 40.9, 6.5, 4.6, 1.8, 0.6, 0.8, 1.0, 80),
(3, 3, 46.3, 39.0, 16.3, 6.1, 2.2, 1.2, 0.2, 1.6, 55),
(4, 4, 46.3, 37.9, 28.9, 2.1, 5.9, 0.9, 0.2, 2.8, 76),
(5, 5, 46.3, 39.8, 13.9, 5.8, 2.2, 1.0, 0.3, 1.1, 72),
(6, 11, 54.8, 36.3, 26.4, 8.6, 8.7, 1.2, 0.6, 4.1, 74),
(7, 12, 42.7, 37.3, 19.0, 11.1, 1.9, 0.9, 0.4, 2.0, 60),
(8, 15, 48.7, 48.5, 10.7, 2.8, 1.0, 0.3, 0.2, 0.8, 67),
(9, 17, 34.6, 35.1, 8.6, 2.8, 1.5, 1.0, 0.3, 0.6, 41),
(10, 19, 60.0, 0.0, 8.1, 9.2, 1.0, 0.5, 1.1, 0.8, 78),
(11, 21, 40.0, 34.1, 8.9, 3.8, 1.0, 1.1, 0.4, 0.8, 72),
(12, 22, 48.8, 38.8, 15.1, 6.8, 1.1, 0.6, 1.6, 1.2, 56),
(13, 23, 46.4, 41.2, 22.4, 4.8, 7.0, 1.5, 0.3, 2.9, 60),
(14, 24, 46.7, 26.6, 27.3, 5.2, 3.9, 1.1, 0.2, 2.4, 74),
(15, 25, 45.2, 35.6, 9.3, 2.9, 3.3, 0.8, 0.2, 1.4, 80),
(16, 26, 45.1, 32.7, 23.1, 4.2, 10.7, 2.0, 0.6, 4.1, 78),
(17, 27, 48.2, 40.4, 24.1, 3.1, 3.5, 1.1, 0.3, 2.0, 77),
(18, 28, 57.9, 0.0, 10.8, 10.4, 1.5, 0.5, 0.7, 1.5, 82),
(19, 29, 27.4, 21.2, 3.5, 1.9, 4.7, 0.7, 0.0, 1.0, 23),
(20, 30, 45.7, 36.2, 14.0, 6.5, 1.7, 1.1, 0.6, 1.7, 76),
(21, 31, 63.3, 0.0, 13.5, 12.7, 1.4, 0.9, 1.2, 2.3, 74),
(22, 32, 44.2, 31.1, 18.1, 7.7, 3.7, 1.3, 0.9, 2.3, 67),
(23, 33, 40.7, 35.2, 4.6, 3.7, 0.5, 0.3, 4.0, 0.5, 56),
(24, 34, 44.1, 34.2, 7.2, 4.4, 1.7, 1.5, 0.5, 0.9, 62),
(25, 35, 40.9, 34.6, 9.8, 3.2, 2.4, 1.2, 0.7, 1.7, 73),
(26, 36, 53.3, 0.0, 11.7, 6.6, 2.3, 1.1, 0.5, 1.7, 81),
(27, 37, 45.0, 43.3, 14.7, 4.2, 3.4, 1.4, 0.2, 2.2, 29),
(28, 38, 53.2, 41.9, 9.4, 0.9, 0.9, 0.5, 0.5, 1.2, 56),
(29, 39, 51.1, 32.2, 10.2, 6.5, 1.2, 0.8, 1.0, 2.0, 72),
(30, 40, 49.0, 36.5, 20.1, 6.2, 2.8, 1.0, 0.4, 1.8, 51),
(31, 41, 46.1, 39.3, 23.7, 6.6, 3.3, 1.6, 0.4, 2.9, 75),
(32, 42, 49.9, 0.0, 8.1, 4.2, 0.9, 0.3, 0.2, 0.5, 66),
(33, 43, 52.7, 38.1, 11.0, 6.1, 1.6, 1.5, 0.4, 1.3, 74),
(34, 44, 44.3, 31.9, 8.5, 2.8, 3.2, 1.1, 0.4, 1.8, 74),
(35, 45, 44.2, 35.7, 15.3, 4.0, 7.8, 1.2, 0.4, 2.6, 82),
(36, 46, 43.4, 31.0, 18.3, 4.5, 3.8, 1.4, 0.7, 2.3, 60),
(37, 47, 45.5, 36.7, 23.9, 6.2, 5.5, 1.9, 0.4, 2.1, 76),
(38, 48, 49.3, 0.0, 10.4, 6.4, 1.0, 0.2, 1.4, 1.1, 81),
(39, 49, 40.8, 37.6, 7.8, 5.1, 6.7, 1.4, 0.2, 2.4, 69),
(40, 50, 41.3, 34.2, 10.6, 5.5, 1.1, 0.8, 0.8, 1.1, 70),
(41, 51, 46.7, 36.5, 19.1, 7.4, 2.4, 0.7, 0.6, 1.5, 53),
(42, 52, 55.7, 0.0, 17.0, 14.1, 0.7, 0.7, 2.1, 2.0, 77),
(43, 53, 47.5, 40.5, 20.3, 3.8, 5.8, 1.2, 0.2, 2.9, 73),
(44, 54, 37.3, 41.9, 4.9, 3.4, 2.3, 0.5, 0.2, 1.0, 22),
(45, 55, 42.4, 39.5, 15.8, 3.3, 4.3, 0.9, 0.4, 2.2, 46),
(46, 56, 48.1, 34.7, 1.6, 5.1, 1.7, 0.8, 0.5, 1.2, 82),
(47, 57, 41.9, 35.9, 14.5, 2.2, 5.2, 0.7, 0.1, 2.2, 52),
(48, 58, 51.3, 0.0, 4.9, 4.4, 0.4, 0.2, 0.5, 0.7, 75),
(49, 59, 41.8, 33.1, 14.0, 4.6, 2.0, 0.7, 0.2, 1.1, 79),
(50, 60, 53.0, 28.6, 13.6, 13.8, 1.1, 1.5, 1.1, 1.9, 81),
(51, 61, 54.2, 0.0, 5.2, 3.6, 0.5, 0.2, 1.0, 0.7, 48),
(52, 62, 40.3, 33.3, 15.1, 6.2, 5.9, 1.1, 0.4, 2.5, 77),
(53, 63, 44.4, 39.9, 23.3, 3.9, 5.5, 1.1, 0.3, 2.1, 79),
(54, 64, 42.2, 35.0, 11.2, 6.6, 1.4, 0.8, 0.7, 0.8, 76),
(55, 65, 42.9, 36.0, 10.5, 2.4, 2.0, 0.6, 0.1, 0.9, 74),
(56, 66, 43.3, 35.9, 22.4, 5.9, 2.9, 0.8, 0.5, 2.1, 74),
(57, 67, 47.1, 21.7, 18.0, 3.8, 4.4, 0.7, 0.3, 2.3, 64),
(58, 68, 48.1, 35.0, 4.4, 5.2, 0.4, 0.6, 0.4, 0.9, 74),
(59, 69, 45.6, 40.1, 10.8, 3.4, 2.3, 1.1, 0.3, 0.6, 77),
(69, 70, 52.1, 11.8, 6.3, 5.6, 1.5, 0.5, 1.3, 1.0, 79),
(70, 71, 46.8, 30.7, 14.6, 10.4, 2.8, 1.0, 1.0, 1.6, 75),
(71, 72, 39.4, 27.5, 9.2, 3.1, 1.2, 0.5, 0.2, 1.1, 69),
(72, 73, 40.2, 40.9, 9.1, 2.1, 1.3, 0.9, 0.1, 1.0, 36),
(73, 74, 38.7, 30.5, 4.5, 1.4, 1.8, 0.7, 0.0, 0.8, 62),
(74, 75, 45.4, 28.8, 12.7, 5.1, 1.9, 0.8, 0.5, 1.1, 80),
(75, 76, 43.2, 21.2, 10.1, 6.2, 1.2, 0.6, 1.1, 2.0, 76),
(76, 77, 45.2, 33.3, 4.9, 2.8, 0.5, 0.1, 0.1, 0.8, 8),
(77, 78, 42.3, 35.3, 9.2, 2.6, 1.6, 0.6, 0.2, 0.9, 72),
(78, 79, 46.6, 36.7, 20.2, 7.8, 2.1, 0.8, 2.5, 3.8, 31),
(79, 80, 51.4, 0.0, 11.8, 4.8, 1.2, 0.4, 1.0, 1.8, 50),
(80, 81, 47.4, 37.6, 20.5, 5.4, 2.3, 0.5, 1.7, 2.5, 75),
(81, 82, 51.6, 32.1, 10.0, 8.0, 1.9, 1.1, 0.4, 1.8, 71),
(82, 83, 45.6, 33.3, 2.8, 1.0, 0.1, 0.2, 0.3, 0.3, 29),
(83, 84, 36.3, 33.0, 5.2, 2.2, 2.0, 0.5, 0.1, 1.2, 69),
(84, 85, 41.2, 31.0, 12.3, 6.3, 1.4, 0.9, 0.6, 1.9, 69),
(85, 86, 53.7, 37.5, 25.1, 8.3, 4.8, 1.1, 1.6, 2.2, 62),
(86, 87, 41.8, 30.8, 10.2, 7.9, 7.0, 2.0, 1.4, 2.4, 76),
(87, 88, 46.8, 41.4, 22.3, 3.7, 2.1, 0.8, 0.5, 1.6, 78),
(88, 89, 52.8, 36.2, 7.6, 4.0, 3.4, 1.0, 0.5, 0.8, 76),
(89, 90, 46.8, 41.4, 25.3, 4.5, 6.6, 1.8, 0.2, 3.0, 79),
(90, 91, 47.7, 41.1, 17.3, 7.3, 1.9, 0.6, 1.2, 1.4, 72),
(91, 92, 48.5, 38.0, 25.5, 5.8, 3.5, 1.8, 0.7, 2.1, 74),
(92, 93, 59.0, 0.0, 7.3, 5.6, 1.6, 0.4, 0.5, 1.0, 79),
(93, 94, 39.0, 39.2, 7.5, 2.3, 2.7, 1.2, 0.2, 1.4, 69),
(94, 95, 46.6, 33.3, 10.1, 1.8, 4.5, 0.5, 0.0, 1.4, 63),
(95, 96, 34.7, 84.7, 29.1, 8.1, 11.2, 1.5, 0.5, 5.7, 81),
(96, 97, 41.8, 40.3, 13.6, 4.6, 0.9, 0.4, 0.2, 0.8, 72),
(97, 98, 40.6, 37.2, 16.2, 2.7, 2.5, 0.6, 0.5, 1.6, 75),
(98, 99, 40.9, 34.4, 11.7, 5.7, 2.2, 1.8, 0.3, 0.9, 80),
(99, 100, 42.0, 38.2, 9.5, 5.9, 4.2, 1.5, 0.4, 1.5, 67),
(100, 101, 47.6, 41.1, 18.1, 5.0, 9.2, 2.0, 0.1, 2.4, 61),
(101, 102, 71.4, 0.0, 12.7, 13.8, 1.2, 0.6, 1.7, 1.4, 81),
(102, 103, 49.3, 33.6, 21.6, 8.1, 4.9, 0.9, 0.4, 2.3, 61),
(103, 104, 44.5, 42.9, 15.0, 2.2, 1.4, 0.7, 0.2, 1.3, 78),
(104, 105, 41.3, 36.0, 12.3, 1.6, 2.6, 0.7, 0.2, 1.6, 82),
(105, 106, 43.6, 41.1, 9.2, 3.1, 1.8, 0.5, 0.2, 0.9, 78),
(106, 107, 47.1, 39.8, 21.9, 5.4, 3.5, 1.0, 0.3, 1.9, 73),
(107, 108, 48.7, 30.0, 9.5, 6.1, 1.1, 0.9, 0.8, 1.2, 50),
(108, 109, 39.9, 32.9, 6.7, 2.9, 0.7, 0.4, 0.1, 0.8, 42),
(109, 110, 47.7, 40.3, 16.9, 3.4, 4.2, 1.0, 0.2, 1.7, 49),
(110, 111, 42.5, 34.3, 31.6, 10.7, 10.4, 1.6, 0.4, 5.4, 81),
(111, 112, 54.5, 13.2, 14.3, 6.7, 0.9, 0.4, 0.5, 1.7, 72),
(112, 113, 52.1, 16.7, 11.6, 6.9, 1.1, 0.5, 0.9, 1.4, 78),
(113, 114, 44.2, 36.1, 15.9, 4.3, 2.6, 1.2, 0.3, 1.8, 67),
(114, 115, 41.2, 34.8, 10.4, 5.8, 1.7, 0.8, 0.3, 1.3, 82),
(115, 116, 33.8, 26.9, 6.2, 2.5, 1.6, 0.6, 0.1, 0.7, 34),
(116, 117, 44.9, 22.3, 14.1, 8.2, 1.7, 0.5, 0.1, 1.4, 73),
(117, 118, 46.0, 40.8, 20.5, 3.5, 6.3, 1.3, 0.3, 2.3, 69),
(118, 119, 61.5, 0.0, 6.8, 2.8, 0.5, 0.4, 0.7, 0.4, 28),
(119, 120, 46.1, 27.8, 9.1, 5.5, 1.4, 1.6, 0.4, 1.4, 71),
(120, 121, 39.3, 33.0, 8.7, 7.4, 1.6, 1.0, 0.7, 1.5, 61),
(121, 122, 52.8, 0.0, 4.3, 5.3, 0.6, 0.3, 0.5, 0.8, 46),
(122, 123, 42.6, 26.3, 9.0, 3.8, 3.2, 0.8, 0.4, 1.5, 65),
(123, 124, 44.4, 37.0, 27.0, 4.9, 5.9, 0.9, 0.3, 2.6, 75),
(124, 125, 38.6, 34.7, 5.4, 3.2, 1.0, 0.2, 0.4, 0.5, 74),
(125, 126, 44.7, 38.9, 18.2, 5.2, 2.1, 0.6, 0.2, 1.3, 63),
(126, 127, 54.8, 0.0, 9.6, 7.6, 0.9, 0.7, 0.7, 1.0, 61),
(127, 128, 46.1, 33.7, 15.7, 6.5, 2.0, 0.7, 0.4, 1.6, 71),
(128, 129, 44.4, 38.8, 9.2, 2.6, 5.1, 0.7, 0.1, 1.7, 75),
(129, 130, 44.3, 37.0, 13.7, 4.3, 3.4, 0.8, 0.5, 1.6, 60),
(130, 131, 45.2, 35.6, 27.8, 10.6, 4.8, 1.4, 1.3, 3.8, 55),
(131, 132, 45.4, 35.6, 15.4, 3.9, 7.3, 1.5, 0.7, 2.9, 67),
(132, 133, 47.7, 0.0, 2.7, 5.3, 0.5, 0.2, 0.3, 0.5, 31),
(141, 134, 50.5, 29.9, 28.0, 11.8, 2.1, 1.3, 2.2, 2.4, 75),
(142, 135, 39.6, 37.4, 12.1, 2.1, 1.3, 0.5, 0.2, 1.9, 76),
(143, 136, 39.3, 36.3, 13.5, 3.5, 2.9, 1.1, 0.2, 1.4, 73),
(144, 137, 43.7, 37.8, 14.2, 6.5, 1.5, 0.6, 0.7, 0.9, 54),
(145, 138, 43.0, 34.8, 13.1, 2.6, 6.9, 0.6, 0.1, 2.5, 64),
(146, 139, 41.4, 35.8, 10.9, 2.4, 5.5, 0.4, 0.0, 1.8, 35),
(147, 140, 39.9, 32.8, 6.7, 2.0, 2.1, 0.7, 0.1, 0.9, 65),
(148, 141, 45.4, 28.8, 9.9, 2.6, 4.8, 1.1, 0.1, 1.9, 69),
(149, 142, 45.5, 37.2, 18.7, 6.3, 2.8, 1.5, 0.9, 2.5, 30),
(150, 143, 40.1, 30.0, 9.5, 3.3, 3.5, 0.9, 0.2, 1.5, 26),
(151, 144, 44.0, 41.1, 8.4, 2.0, 1.3, 0.3, 0.1, 0.7, 61),
(152, 145, 55.1, 0.0, 6.6, 5.7, 0.7, 0.5, 0.7, 0.9, 71),
(153, 146, 40.2, 30.6, 11.1, 4.1, 9.1, 1.7, 0.1, 2.6, 75),
(154, 147, 38.0, 0.0, 4.5, 1.8, 0.9, 0.1, 0.0, 0.8, 12),
(155, 148, 47.6, 35.5, 7.2, 4.0, 4.2, 0.5, 0.3, 1.8, 12),
(156, 149, 45.2, 35.6, 23.6, 4.0, 2.3, 1.0, 0.4, 2.3, 82),
(157, 150, 54.2, 36.7, 25.1, 12.3, 2.7, 0.7, 1.3, 2.6, 82),
(158, 151, 38.7, 30.9, 7.6, 5.3, 1.3, 0.9, 0.4, 0.8, 56),
(159, 152, 40.4, 26.7, 3.6, 1.9, 2.2, 0.2, 0.0, 0.9, 41),
(160, 153, 44.4, 38.5, 18.6, 2.3, 3.2, 1.1, 0.2, 2.1, 81),
(161, 154, 43.0, 40.4, 13.2, 2.3, 1.0, 0.6, 0.2, 0.6, 60),
(162, 155, 40.5, 35.2, 15.6, 3.5, 4.8, 1.4, 0.3, 2.8, 63),
(163, 156, 51.0, 50.0, 5.7, 5.1, 0.6, 0.4, 0.7, 0.9, 67),
(164, 157, 39.8, 32.4, 11.0, 2.2, 2.4, 0.5, 0.1, 1.6, 54),
(165, 158, 67.1, 0.0, 8.4, 11.5, 0.6, 0.7, 0.5, 1.4, 47),
(166, 159, 45.4, 37.9, 6.8, 3.5, 1.9, 0.7, 0.3, 1.1, 64),
(167, 160, 49.7, 25.0, 8.0, 6.6, 0.6, 0.5, 1.3, 1.3, 77);

-- --------------------------------------------------------

--
-- 表的结构 `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `ch_tname` varchar(30) NOT NULL DEFAULT '',
  `en_tname` varchar(50) NOT NULL DEFAULT '',
  `location` varchar(10) NOT NULL DEFAULT '',
  `pcount` tinyint(4) NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `team`
--

INSERT INTO `team` (`team_id`, `ch_tname`, `en_tname`, `location`, `pcount`, `logo`, `area`) VALUES
(1, '凯尔特人', 'Boston Celtics', 'east', 15, 'ketr.png', '大西洋赛区'),
(2, '骑士', 'Cleveland Cavaliers', 'east', 16, 'qs.png', '中部赛区'),
(3, '猛龙', 'Toronto Raptors', 'east', 17, 'ml.png', '大西洋赛区'),
(4, '奇才', 'Washington Wizards', 'east', 18, 'qc.png', '东南赛区'),
(5, '老鹰', 'Atlanta Hawks', 'east', 14, 'ly.png', '东南赛区'),
(6, '雄鹿', 'Milwaukee Bucks', 'east', 16, 'xl.png', '中部赛区'),
(7, '步行者', 'Indiana Pacers', 'east', 15, 'bxz.png', '中部赛区'),
(8, '公牛', 'Chicago Bulls', 'east', 15, 'gn.png', '中部赛区'),
(9, '热火', 'Miami Heat ', 'east', 16, 'rh.png', '东南赛区'),
(10, '活塞', 'Detroit Piston', 'east', 15, 'hs.png', '中部赛区'),
(11, '黄蜂', 'Charlotte Hornets', 'east', 19, 'hf.png', '东南赛区'),
(12, '尼克斯', 'New York Knicks', 'east', 14, 'nks.png', '大西洋赛区'),
(13, '魔术', 'Orlando Magic', 'east', 16, 'ms.png', '东南赛区'),
(14, '76人', 'Philadelphia 76ers', 'east', 21, '76r.png', '大西洋赛区'),
(15, '篮网', 'Brooklyn Nets', 'east', 18, 'lw.png', '大西洋赛区'),
(16, '勇士', 'Golden State Warriors', 'west', 15, 'ys.png', '太平洋赛区'),
(17, '马刺', 'San Antonio Spurs', 'west', 16, 'mc.png', '西南赛区'),
(18, '火箭', 'Houston Rockets', 'west', 14, 'hj.png', '西南赛区'),
(19, '快船', 'Los Angeles Clippers', 'west', 15, 'kc.png', '太平洋赛区'),
(20, '爵士', 'Utah Jazz', 'west', 15, 'js.png', '西北赛区'),
(21, '雷霆', 'Oklahoma City Thunder', 'west', 17, 'lt.png', '西北赛区'),
(22, '灰熊', 'Memphis Grizzlies', 'west', 15, 'hx.png', '西南赛区'),
(23, '开拓者', 'Portland TrailBlazers', 'west', 16, 'ktz.png', '西北赛区'),
(24, '掘金', 'Denver Nuggets', 'west', 16, 'jj.png', '西北赛区'),
(25, '鹈鹕', 'new orleans pelicans', 'west', 14, 'th.png', '西南赛区'),
(26, '小牛', 'Dallas Mericks', 'west', 17, 'xn.png', '西南赛区'),
(27, '国王', 'Sacramento Kings', 'west', 18, 'gw.png', '太平洋赛区'),
(28, '森林狼', 'Minnesota Timberwolves', 'west', 16, 'sll.png', '西北赛区'),
(29, '湖人', 'Los Angeles Lakers', 'west', 17, 'hr.png', '太平洋赛区'),
(30, '太阳', 'Phoenix Suns', 'west', 18, 'ty.png', '太平洋赛区');

-- --------------------------------------------------------

--
-- 表的结构 `team_data`
--

CREATE TABLE `team_data` (
  `tdId` int(11) NOT NULL,
  `team_id` int(11) NOT NULL DEFAULT '0',
  `win` smallint(6) NOT NULL DEFAULT '0',
  `score` double(6,1) NOT NULL DEFAULT '0.0',
  `rebound` double(6,1) NOT NULL DEFAULT '0.0',
  `assist` double(6,1) NOT NULL DEFAULT '0.0',
  `ST` double(6,1) NOT NULL DEFAULT '0.0',
  `block_shot` double(6,1) NOT NULL DEFAULT '0.0',
  `fault` double(6,1) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `team_data`
--

INSERT INTO `team_data` (`tdId`, `team_id`, `win`, `score`, `rebound`, `assist`, `ST`, `block_shot`, `fault`) VALUES
(1, 1, 53, 108.0, 42.0, 25.2, 7.5, 4.2, 13.3),
(2, 2, 51, 110.7, 43.7, 22.7, 6.6, 4.0, 13.7),
(3, 3, 51, 106.9, 43.3, 18.5, 8.3, 4.9, 12.7),
(4, 4, 49, 109.2, 42.9, 23.9, 8.4, 4.1, 14.2),
(5, 5, 43, 103.2, 44.3, 23.6, 8.2, 4.8, 15.8),
(6, 6, 42, 103.6, 40.4, 24.2, 8.1, 5.3, 14.0),
(7, 7, 42, 105.1, 42.0, 22.5, 8.2, 5.0, 13.8),
(8, 8, 41, 102.9, 46.3, 22.6, 7.8, 4.8, 13.6),
(9, 9, 41, 103.2, 43.6, 21.2, 7.2, 5.7, 13.4),
(10, 10, 37, 101.3, 45.7, 21.1, 7.0, 3.8, 11.9),
(11, 11, 36, 104.9, 43.6, 23.1, 7.0, 4.8, 11.6),
(12, 12, 31, 104.3, 45.2, 21.8, 7.1, 5.5, 13.9),
(13, 13, 29, 101.1, 43.2, 22.2, 7.1, 4.8, 13.3),
(14, 14, 28, 102.4, 42.8, 23.8, 8.4, 5.1, 16.7),
(15, 15, 20, 105.8, 43.9, 21.4, 7.2, 4.7, 16.5),
(16, 16, 67, 115.9, 44.4, 30.4, 9.6, 6.8, 14.8),
(17, 17, 61, 105.3, 43.9, 23.8, 8.0, 5.9, 13.4),
(18, 18, 55, 115.3, 44.4, 25.2, 8.2, 4.3, 15.1),
(19, 19, 51, 108.7, 43.0, 22.5, 7.5, 4.2, 13.0),
(20, 20, 51, 100.7, 43.2, 20.1, 6.7, 5.0, 13.6),
(21, 21, 47, 106.6, 46.6, 21.0, 7.9, 5.0, 15.0),
(22, 22, 43, 100.5, 42.8, 21.3, 8.0, 4.2, 12.9),
(23, 23, 41, 107.9, 43.7, 21.1, 7.0, 5.0, 13.7),
(24, 24, 40, 111.7, 46.4, 25.3, 6.9, 3.9, 15.0),
(25, 25, 34, 104.3, 43.7, 22.8, 7.8, 5.5, 12.9),
(26, 26, 33, 97.9, 38.6, 20.8, 7.5, 3.7, 11.9),
(27, 27, 32, 102.8, 41.1, 22.5, 7.7, 4.0, 14.6),
(28, 28, 31, 105.6, 42.4, 23.7, 8.0, 4.5, 14.0),
(29, 29, 26, 104.6, 43.5, 20.9, 8.2, 3.9, 15.2),
(30, 30, 24, 107.7, 45.0, 19.6, 8.2, 4.9, 15.4);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL DEFAULT '',
  `upwd` varchar(32) NOT NULL DEFAULT '',
  `regTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `uname`, `upwd`, `regTime`, `lastTime`) VALUES
(1, 'james@qq.com', '147852369', '2017-06-05 12:32:46', '2017-06-09 20:42:57'),
(2, 'kobe@qq.com', '666666', '2017-06-05 12:32:46', '2017-06-16 20:45:05'),
(3, 'carry@qq.com', '123123', '2017-06-05 12:32:46', '0000-00-00 00:00:00'),
(4, '619953679@qq.com', 'hd619953679', '2017-08-08 21:31:01', '2017-08-08 21:31:55'),
(5, 'rank@qq.com', '123456', '2017-10-03 12:11:05', '2017-10-03 12:18:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `player_team_team_id_fk` (`team_id`);

--
-- Indexes for table `player_data`
--
ALTER TABLE `player_data`
  ADD PRIMARY KEY (`pdId`),
  ADD KEY `player-data_player_pid_fk` (`pid`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexes for table `team_data`
--
ALTER TABLE `team_data`
  ADD PRIMARY KEY (`tdId`),
  ADD KEY `team_data_team_team_id_fk` (`team_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `player`
--
ALTER TABLE `player`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- 使用表AUTO_INCREMENT `player_data`
--
ALTER TABLE `player_data`
  MODIFY `pdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;
--
-- 使用表AUTO_INCREMENT `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `team_data`
--
ALTER TABLE `team_data`
  MODIFY `tdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 限制导出的表
--

--
-- 限制表 `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_team_team_id_fk` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

--
-- 限制表 `player_data`
--
ALTER TABLE `player_data`
  ADD CONSTRAINT `player-data_player_pid_fk` FOREIGN KEY (`pid`) REFERENCES `player` (`pid`);

--
-- 限制表 `team_data`
--
ALTER TABLE `team_data`
  ADD CONSTRAINT `team_data_team_team_id_fk` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
