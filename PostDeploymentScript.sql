Drop Table if exists Slide;
Drop Table if exists Media;
Drop Table if exists MediaType;
Drop Table if exists Portfolio;

CREATE TABLE Portfolio
(
    PortfolioID NVARCHAR(3) CONSTRAINT PK_Portfolio_ID PRIMARY KEY NOT NULL,
    AifID NVARCHAR(20) NOT NULL,
    [Name] NVARCHAR(100) NOT NULL,
    [Address]  NVARCHAR(100),
    Regiment NVARCHAR(20),
    Battalion NVARCHAR(100),
    DOB Date,
    DOD Date,
	ProfilePic NVARCHAR(100), 
	RollOfHonor NVARCHAR(100), 
	Obituary NVARCHAR(100),
	Occupation NVARCHAR(100)
);

CREATE TABLE MediaType
(
    [MediaTypeID] NVARCHAR(1) CONSTRAINT PK_MediaType_ID Primary KEY,
    [Name]  NVARCHAR(100)
);

CREATE TABLE Media
(
    MediaID NVARCHAR(3) CONSTRAINT PK_Media_ID PRIMARY KEY NOT NULL,
    Source NVARCHAR(100) NOT NULL,
    MediaTypeID NVARCHAR(1) CONSTRAINT FK_MediaType_ID FOREIGN KEY REFERENCES MediaType(MediaTypeID) NOT NULL,
);

CREATE TABLE Slide 
(
    SlideID NVARCHAR(3) CONSTRAINT PK_Slide_ID PRIMARY KEY NOT NULL,
    PortfolioID NVARCHAR(3) CONSTRAINT FK_Portfolio_ID FOREIGN KEY REFERENCES Portfolio(PortfolioID) NOT NULL,
    [MediaID] NVARCHAR(3) CONSTRAINT FK_Media_ID FOREIGN KEY REFERENCES Media(MediaID),
    PageNo NVARCHAR(3) NOT NULL,
    Title NVARCHAR(100),
    [Description] NVARCHAR(100),
    [LocationName] NVARCHAR(100),
    [LocationCords] NVARCHAR(100),
    [Year] NVARCHAR(100)
);

Insert into MediaType (MediaTypeID, [Name]) Values
(1, 'Image'),
(2, 'Video'),
(3, 'Other');

Insert into Media (MediaID, Source, MediaTypeID) Values
(1, 'https://s3-ap-southeast-2.amazonaws.com/awm-media/collection/DA16445A/screen/4103062.JPG', 1),
(2, 'https://www.youtube.com/embed/u_EzdzWDJm4', 2),
(3, 'https://recordsearch.naa.gov.au/SearchNRetrieve/NAAMedia/ShowImage.aspx?B=3482927&T=P&S=1', 1),
(4, 'https://www.visitflanders.com/en/binaries/f53e18bc-d959-47dd-8586-2f8141329618_tcm13-132355.jpg', 1),/* 1, 2, 3, 4 Jack Stanley Dale example data*/
(5, 'https://s3-ap-southeast-2.amazonaws.com/awm-media/collection/RCDIG1067470/screen/5370678.JPG', 1),
(6, 'https://discoveringanzacs.naa.gov.au/media/mawson/179734.png?width=275&height=267&mode=Both', 1),/* 5, 6 Charles Edward Aylen example data*/
(7, 'https://s3-ap-southeast-2.amazonaws.com/awm-media/collection/RCDIG1036742/document/5603779.PDF', 3),
(8, 'https://s3-ap-southeast-2.amazonaws.com/awm-media/collection/DA14872/screen/4041818.JPG', 1),/* 7, 8 Robert Douglas Anderson example data */
(9, 'https://rslvwm.s3.amazonaws.com/I/images/67631/photo/profile_pic_CLOUGH__John_Spencer_5671.JPG', 1),
(10, 'https://s3-ap-southeast-2.amazonaws.com/awm-media/collection/RCDIG1067386/screen/5369238.JPG', 1),/* 9, 10 John Spencer Clough example data*/
(11, 'https://rslvwm.s3.amazonaws.com/I/images/122698/photo/profile_pic_Capture.JPG', 1)/* William Auchinachie example data*/


Insert into Portfolio (PortfolioID, AifID, [Name], [Address], Regiment, Battalion, DOB, DOD, ProfilePic, RollOfHonor, Obituary, Occupation) Values 
(1, 71200, 'Jack Stanley Dale', '29 Allen St, Auburn VIC', 2632, '58th Australian Infantry Battalion, 6th Reinforcements', '1891-04-01', '1917-09-27', 'https://s3-ap-southeast-2.amazonaws.com/awm-media/collection/DA16445A/screen/4103062.JPG', '', '', 'Baker'), /* Jack Stanley Dale example data*/
(2, 9732, 'Charles Edward Aylen', '633 Burwood Road, Auburn, Victoria', 68759, '15th General (Victorian) Reinforcements', '', '1967-09-14', 'https://discoveringanzacs.naa.gov.au/media/mawson/179734.png?width=275&height=267&mode=Both', '', '', ''), /* Charles Edward AYLEN example data age 18 at enlistment/embarked no DOB*/
(3, 5273, 'Robert Douglas Anderson', '8 Roseberry Street, Auburn, Victoria', 2452, '8th Battalion, 7th Reinforcement', '', '1916-09-05', 'https://s3-ap-southeast-2.amazonaws.com/awm-media/collection/DA14872/screen/4041818.JPG', '', '', ''), /* Robert Douglas ANDERSON example data age 19 at date of death no DOB*/
(4, 5671, 'John Spencer Clough', 'Hemming Street, Dandenong, Victoria', 5671, '6th Battalion, 18th Reinforcement', '', '', 'https://rslvwm.s3.amazonaws.com/I/images/67631/photo/profile_pic_CLOUGH__John_Spencer_5671.JPG', '', '', ''), /* John Spencer CLOUGH example data age 26 on enlistment/embarked no DOB or DOD*/
(5, 9245, 'William Auchinachie', '569 Nicholson Street, North Carlton, Victoria', 33, '7th Battalion, Headquarters', '', '1915-05-09', 'https://rslvwm.s3.amazonaws.com/I/images/122698/photo/profile_pic_Capture.JPG', '', '', ''); /* William AUCHINACHIE example data age 19 on enlistment/embarked no DOB*/


Insert into Slide (SlideID,	PortfolioID, [MediaID], PageNo, Title, [Description], [LocationName], [LocationCords], [Year]) Values
(1, 1, 3, 3, 'JSD Document', 'Stanleys enlistment form', 'Allen St', '[80, -32]', '1916'), 
(2, 1, 1, 1, 'JSD Photograph', 'A photograph taken by the Darge Photographic Company at the Broadmeadows army camp.', 'Broadmeadows', '[144.9126308, -37.6788862]', '1916'),
(3, 1, 2, 2, 'JSD Polygon Wood video', 'Story of the battle in which Jack Stanley Dale died', 'Polygon Wood', '[2.983467, 50.851183]', '1917'),
(4, 1, 4, 4, 'JSD Cemetery', 'Jack was buried here after the armistice', 'Tyne Cot Cemetery, Belgium', '[2.9980032, 50.8885544]', '1918'), /* 1, 2, 3, 4 Jack Stanley Dale example data*/
(5, 2, 5, 1, 'CEA Nominal Roll', 'Charles service details', 'Auburn', '[145.0464259, -37.8264744]', '1967'),
(6, 2, 6, 2, 'CEA Photograph', 'Private Charles Edward Aylen', 'Auburn', '[145.0464259, -37.8264744]]', '1918'),/* Charles Edward Aylen example data*/
(7, 3, 7, 1, 'PDF Link/Collection', 'Collection of files relating to inquiry into missing status', 'Auburn', '[145.0464259, -37.8264744]', '1915'),
(8, 3, 8, 2, 'RDA Fancy Photograph', 'A photograph taken by the Darge Photographic Company', 'Auburn', '[145.0464259, -37.8264744]', '1915'),/* Robert Douglas Anderson example data*/
(9, 4, 9, 1, 'JSC Photograph', 'John Spencer Clough', 'Dandenong, Hemming St', '[145.2033025, -37.9831447]', '1915'),
(10, 4, 10, 2,'JSC Nominal Roll', 'Johns service details', 'Dandenong, Hemming St', '[145.2033025, -37.9831447]', '1915'),/* John Spencer Clough example data*/
(11, 5, 11, 1, 'William A. Photograph', 'William A. Photograph', 'Carlton, Nicholson Street', '[144.9746426, -37.7868261]', '1915');/* William Auchinachie example data*/


