{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 Use gan;\
DROP TABLE IF EXISTS `gan_train`;\
/*!40101 SET @saved_cs_client     = @@character_set_client */;\
 SET character_set_client = utf8mb4 ;\
CREATE TABLE `gan_train` (\
  `channelGrouping` varchar(200) DEFAULT NULL,\
  `date` datetime DEFAULT NULL,\
  `fullVisitorId` varchar(200) DEFAULT NULL,\
  `sessionId` varchar(200) DEFAULT NULL,\
  `socialEngagementType` varchar(200) DEFAULT NULL,\
  `visitId` int(11) DEFAULT NULL,\
  `visitNumber` int(11) DEFAULT NULL,\
  `visitStartTime` int(11) DEFAULT NULL,\
  `device_browser` varchar(200) DEFAULT NULL,\
  `device_browserSize` varchar(200) DEFAULT NULL,\
  `device_browserVersion` varchar(200) DEFAULT NULL,\
  `device_deviceCategory` varchar(200) DEFAULT NULL,\
  `device_flashVersion` varchar(200) DEFAULT NULL,\
  `device_isMobile` varchar(10) DEFAULT NULL,\
  `device_language` varchar(200) DEFAULT NULL,\
  `device_mobileDeviceBranding` varchar(200) DEFAULT NULL,\
  `device_mobileDeviceInfo` varchar(200) DEFAULT NULL,\
  `device_mobileDeviceMarketingName` varchar(200) DEFAULT NULL,\
  `device_mobileDeviceModel` varchar(200) DEFAULT NULL,\
  `device_mobileInputSelector` varchar(200) DEFAULT NULL,\
  `device_operatingSystem` varchar(200) DEFAULT NULL,\
  `device_operatingSystemVersion` varchar(200) DEFAULT NULL,\
  `device_screenColors` varchar(200) DEFAULT NULL,\
  `device_screenResolution` varchar(200) DEFAULT NULL,\
  `geoNetwork_city` varchar(200) DEFAULT NULL,\
  `geoNetwork_cityId` varchar(200) DEFAULT NULL,\
  `geoNetwork_continent` varchar(200) DEFAULT NULL,\
  `geoNetwork_country` varchar(200) DEFAULT NULL,\
  `geoNetwork_latitude` varchar(200) DEFAULT NULL,\
  `geoNetwork_longitude` varchar(200) DEFAULT NULL,\
  `geoNetwork_metro` varchar(200) DEFAULT NULL,\
  `geoNetwork_networkDomain` varchar(200) DEFAULT NULL,\
  `geoNetwork_networkLocation` varchar(200) DEFAULT NULL,\
  `geoNetwork_region` varchar(200) DEFAULT NULL,\
  `geoNetwork_subContinent` varchar(200) DEFAULT NULL,\
  `totals_bounces` varchar(200) DEFAULT NULL,\
  `totals_hits` varchar(200) DEFAULT NULL,\
  `totals_newVisits` varchar(200) DEFAULT NULL,\
  `totals_pageviews` varchar(200) DEFAULT NULL,\
  `totals_transactionRevenue` varchar(200) DEFAULT NULL,\
  `totals_visits` varchar(200) DEFAULT NULL,\
  `trafficSource_adContent` varchar(200) DEFAULT NULL,\
  `trafficSource_adwordsClickInfo_adNetworkType` varchar(200) DEFAULT NULL,\
  `trafficSource_adwordsClickInfo_criteriaParameters` varchar(200) DEFAULT NULL,\
  `trafficSource_adwordsClickInfo_gclId` varchar(200) DEFAULT NULL,\
  `trafficSource_adwordsClickInfo_isVideoAd` varchar(200) DEFAULT NULL,\
  `trafficSource_adwordsClickInfo_page` varchar(200) DEFAULT NULL,\
  `trafficSource_adwordsClickInfo_slot` varchar(200) DEFAULT NULL,\
  `trafficSource_campaign` varchar(200) DEFAULT NULL,\
  `trafficSource_campaignCode` varchar(200) DEFAULT NULL,\
  `trafficSource_isTrueDirect` varchar(200) DEFAULT NULL,\
  `trafficSource_keyword` varchar(200) DEFAULT NULL,\
  `trafficSource_medium` varchar(200) DEFAULT NULL,\
  `trafficSource_referralPath` varchar(200) DEFAULT NULL,\
  `trafficSource_source` varchar(200) DEFAULT NULL\
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;\
/*!40101 SET character_set_client = @saved_cs_client */;\
}