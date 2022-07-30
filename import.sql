# This creates the table for logging in the database of the priorities that happen, if allowed in the config.

CREATE TABLE IF NOT EXISTS `PriorityLog` (
    `ID` INT NOT NULL AUTO_INCREMENT, 
    `PlayerID` varchar(50) NULL DEFAULT NULL,
    `SteamName` varchar(50) NULL DEFAULT NULL,
    `Identifier` varchar(50) NULL DEFAULT NULL,
    `PlayerName` varchar(50) NULL DEFAULT NULL,
    `PriorityType` varchar(255) NULL DEFAULT NULL,
    PRIMARY KEY (ID)
);