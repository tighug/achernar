CREATE DATABASE IF NOT EXISTS flow;
USE flow;

-- CreateTable
CREATE TABLE `Feeder` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `networkNum` INTEGER NOT NULL,
    `feederNum` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Node` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `feederId` INTEGER NOT NULL,
    `num` INTEGER NOT NULL,
    `posX` DECIMAL(65, 30) NOT NULL,
    `posY` DECIMAL(65, 30) NOT NULL,
    `hasLoad` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Line` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `prevNodeId` INTEGER NOT NULL,
    `nextNodeId` INTEGER NOT NULL,
    `lengthM` DECIMAL(65, 30) NOT NULL,
    `phase` INTEGER NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `rOhmPerKm` DECIMAL(65, 30) NOT NULL,
    `xOhmPerKm` DECIMAL(65, 30) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sample` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `num` INTEGER NOT NULL,
    `hour` INTEGER NOT NULL,
    `minute` INTEGER NOT NULL,
    `val` DECIMAL(65, 30) NOT NULL,
    `season` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Case` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `feederId` INTEGER NOT NULL,
    `hour` INTEGER NOT NULL,
    `minute` INTEGER NOT NULL,
    `pvCount` INTEGER NOT NULL,
    `pvScale` DECIMAL(65, 30) NOT NULL,
    `loadScale` DECIMAL(65, 30) NOT NULL,
    `baseV` DECIMAL(65, 30) NOT NULL,
    `seed` INTEGER NOT NULL,
    `status` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Flow` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `caseId` INTEGER NOT NULL,
    `lineId` INTEGER NOT NULL,
    `nextNodeP` DECIMAL(65, 30) NOT NULL,
    `nextNodeV` DECIMAL(65, 30) NOT NULL,
    `lineI` DECIMAL(65, 30) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `bidCaseId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Load` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `caseId` INTEGER NOT NULL,
    `nodeId` INTEGER NOT NULL,
    `val` DECIMAL(65, 30) NOT NULL,
    `type` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BidCase` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `caseId` INTEGER NOT NULL,
    `buyerCount` INTEGER NOT NULL,
    `sellerCount` INTEGER NOT NULL,
    `minBuyPrice` INTEGER NOT NULL,
    `maxBuyPrice` INTEGER NOT NULL,
    `minSellPrice` INTEGER NOT NULL,
    `maxSellPrice` INTEGER NOT NULL,
    `minBuyVolume` INTEGER NOT NULL,
    `maxBuyVolume` INTEGER NOT NULL,
    `minSellVolume` INTEGER NOT NULL,
    `maxSellVolume` INTEGER NOT NULL,
    `seed` INTEGER NOT NULL,
    `agreedPrice` DECIMAL(65, 30) NOT NULL,
    `status` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Bidder` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bidCaseId` INTEGER NOT NULL,
    `nodeId` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `volume` INTEGER NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `agreed` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `NodalPrice` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bidCaseId` INTEGER NOT NULL,
    `nodeId` INTEGER NOT NULL,
    `muIp` DECIMAL(65, 30) NOT NULL,
    `muIn` DECIMAL(65, 30) NOT NULL,
    `muVp` DECIMAL(65, 30) NOT NULL,
    `muVn` DECIMAL(65, 30) NOT NULL,
    `value` DECIMAL(65, 30) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Node` ADD FOREIGN KEY (`feederId`) REFERENCES `Feeder`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Line` ADD FOREIGN KEY (`prevNodeId`) REFERENCES `Node`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Line` ADD FOREIGN KEY (`nextNodeId`) REFERENCES `Node`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Case` ADD FOREIGN KEY (`feederId`) REFERENCES `Feeder`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Flow` ADD FOREIGN KEY (`caseId`) REFERENCES `Case`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Flow` ADD FOREIGN KEY (`lineId`) REFERENCES `Line`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Load` ADD FOREIGN KEY (`caseId`) REFERENCES `Case`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Load` ADD FOREIGN KEY (`nodeId`) REFERENCES `Node`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BidCase` ADD FOREIGN KEY (`caseId`) REFERENCES `Case`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Bidder` ADD FOREIGN KEY (`bidCaseId`) REFERENCES `BidCase`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Bidder` ADD FOREIGN KEY (`nodeId`) REFERENCES `Node`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NodalPrice` ADD FOREIGN KEY (`bidCaseId`) REFERENCES `BidCase`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `NodalPrice` ADD FOREIGN KEY (`nodeId`) REFERENCES `Node`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
