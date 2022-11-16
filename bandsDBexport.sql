

CREATE TABLE `Bands` (
    `ID` int  NOT NULL ,
    `Band_Name` char(50)  NULL ,
    `Genre` char(50)  NULL ,
    `Country` int  NOT NULL ,
    `Listeners` int  NOT NULL ,
    PRIMARY KEY (
        `Country`,`Listeners`
    )
);

CREATE TABLE `Country` (
    `Origin` int  NOT NULL ,
    `Country` char(50)  NULL ,
    `1st_Most_ListenedIn` char(50)  NULL ,
    `2nd_MostListenedIn` char(50)  NULL ,
    `3rd_MostListenedIn` char(50)  NULL ,
    `4th_MostListenedIn` char(50)  NULL ,
    `5th_MostListenedIn` char(50)  NULL ,
    PRIMARY KEY (
        `Origin`
    )
);

CREATE TABLE `Spotify` (
    `Listeners` int  NOT NULL ,
    `Spotify_Listeners` numeric(50)  NULL ,
    `1st_Most_Listeners` numeric(50)  NULL ,
    `2nd_MostListeners` numeric(50)  NULL ,
    `3rd_MostListeners` numeric(50)  NULL ,
    `4th_MostListeners` numeric(50)  NULL ,
    `5th_MostListeners` numeric(50)  NULL ,
    PRIMARY KEY (
        `Listeners`
    )
);

ALTER TABLE `Bands` ADD CONSTRAINT `fk_Bands_Country` FOREIGN KEY(`Country`)
REFERENCES `Country` (`Origin`);

ALTER TABLE `Bands` ADD CONSTRAINT `fk_Bands_Listeners` FOREIGN KEY(`Listeners`)
REFERENCES `Spotify` (`Listeners`);

ALTER TABLE `Country` ADD CONSTRAINT `fk_Country_1st_Most_ListenedIn_2nd_MostListenedIn_3rd_MostListenedIn_4th_MostListenedIn_5th_MostListenedIn` FOREIGN KEY(`1st_Most_ListenedIn`, `2nd_MostListenedIn`, `3rd_MostListenedIn`, `4th_MostListenedIn`, `5th_MostListenedIn`)
REFERENCES `Spotify` (`1st_Most_Listeners`, `2nd_MostListeners`, `3rd_MostListeners`, `4th_MostListeners`, `5th_MostListeners`);

ALTER TABLE `Spotify` ADD CONSTRAINT `fk_Spotify_Listeners` FOREIGN KEY(`Listeners`)
REFERENCES `Country` (`Origin`);

