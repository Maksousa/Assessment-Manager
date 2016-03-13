--
-- Database: `assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `clo`
--

CREATE TABLE `clo` (
  `CLO_ID` char(5) NOT NULL,
  `Course_ID` char(8) NOT NULL,
  `Description` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clo`
--

INSERT INTO `clo` (`CLO_ID`, `Course_ID`, `Description`) VALUES
('CLO 1', 'SE211', 'Construction Design & Implementation');

-- --------------------------------------------------------

--
-- Table structure for table `clo_to_plo`
--

CREATE TABLE `clo_to_plo` (
  `PLO_ID` char(5) NOT NULL,
  `Dept_ID` char(3) NOT NULL,
  `CLO_ID` char(5) NOT NULL,
  `Course_ID` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clo_to_plo`
--

INSERT INTO `clo_to_plo` (`PLO_ID`, `Dept_ID`, `CLO_ID`, `Course_ID`) VALUES
('PLO A', 'SE', 'CLO 1', 'SE211');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` char(8) NOT NULL,
  `Dept_ID` char(3) NOT NULL,
  `Course_Name` varchar(30) DEFAULT NULL,
  `Instructor_ID` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Dept_ID`, `Course_Name`, `Instructor_ID`) VALUES
('SE211', 'SE', 'Software Engineering', 121);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dept_ID` char(3) NOT NULL,
  `Dept_Name` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dept_ID`, `Dept_Name`) VALUES
('SE', 'Software Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `Instructor_ID` int(3) NOT NULL,
  `Dept_ID` char(3) NOT NULL,
  `First_Name` varchar(15) NOT NULL,
  `Last_Name` varchar(15) NOT NULL,
  `Pass` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`Instructor_ID`, `Dept_ID`, `First_Name`, `Last_Name`, `Pass`) VALUES
(121, 'SE', 'Mamdouh', 'Alenezi', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `plo`
--

CREATE TABLE `plo` (
  `PLO_ID` char(5) NOT NULL,
  `Dept_ID` char(3) NOT NULL,
  `Description` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plo`
--

INSERT INTO `plo` (`PLO_ID`, `Dept_ID`, `Description`) VALUES
('PLO A', 'SE', ''),
('PLO B', 'SE', ''),
('PLO C', 'SE', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clo`
--
ALTER TABLE `clo`
  ADD PRIMARY KEY (`CLO_ID`,`Course_ID`),
  ADD KEY `Course_ID` (`Course_ID`);

--
-- Indexes for table `clo_to_plo`
--
ALTER TABLE `clo_to_plo`
  ADD PRIMARY KEY (`PLO_ID`,`Dept_ID`,`CLO_ID`,`Course_ID`),
  ADD KEY `CLO_ID` (`CLO_ID`,`Course_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`),
  ADD KEY `Dept_ID` (`Dept_ID`),
  ADD KEY `Instructor_ID` (`Instructor_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dept_ID`),
  ADD UNIQUE KEY `Dept_Name` (`Dept_Name`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`Instructor_ID`),
  ADD KEY `Dept_ID` (`Dept_ID`);

--
-- Indexes for table `plo`
--
ALTER TABLE `plo`
  ADD PRIMARY KEY (`PLO_ID`,`Dept_ID`),
  ADD KEY `Dept_ID` (`Dept_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clo`
--
ALTER TABLE `clo`
  ADD CONSTRAINT `clo_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Constraints for table `clo_to_plo`
--
ALTER TABLE `clo_to_plo`
  ADD CONSTRAINT `clo_to_plo_ibfk_1` FOREIGN KEY (`PLO_ID`,`Dept_ID`) REFERENCES `plo` (`PLO_ID`, `Dept_ID`),
  ADD CONSTRAINT `clo_to_plo_ibfk_2` FOREIGN KEY (`CLO_ID`,`Course_ID`) REFERENCES `clo` (`CLO_ID`, `Course_ID`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`),
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`Instructor_ID`) REFERENCES `instructor` (`Instructor_ID`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`);

--
-- Constraints for table `plo`
--
ALTER TABLE `plo`
  ADD CONSTRAINT `plo_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
