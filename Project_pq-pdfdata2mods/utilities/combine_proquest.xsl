<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <!-- Last Updated: November 13, 2021 -->

    <!-- Configure the transformation with empty.xml as source.
            The path of files to be combined changes with each batch.
                In Windows, use this: file:///file:///C://Users/
                In OSX, use this: //Users/       
                Example:
                <xsl:copy-of select="document('//Users/Volumes/Groups/CS/TechResources/Bepress-migration/Source_Data/etds/bepress_metadata/unsup-etd_metadata/bepress_UTF8/bepress_all_uft8/etd-0994.metadata.xml')"/>
                
                <xsl:copy-of select="document('//Users/annie/Volumes/Groups/CS/TechResources/ETDs/ProQuest_files/2017C_fall/DATA/Acar_fsu_0071E_14749_DATA.xml')"/>
                
                <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2020/2020_BC_summer_fall/DATA/Abdullah_fsu_0071E_16363_DATA.xml')"/>
        -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="xml">
        <xml>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Aiken_fsu_0071E_17887_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/AlvaradoCampagnola_fsu_0071E_17689_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Anderson_fsu_0071E_17914_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/ArabzadehNosratabad_fsu_0071E_17837_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Archer_fsu_0071E_17813_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Arslan_fsu_0071E_17823_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/BaezaDager_fsu_0071E_17800_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Baird_fsu_0071E_17884_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Ball_fsu_0071E_17882_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Bandzuh_fsu_0071E_17690_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Banks_fsu_0071E_17897_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Barfield_fsu_0071N_17951_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Bauer_fsu_0071E_17806_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Beach_fsu_0071E_17845_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Beard_fsu_0071N_17990_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Beasley_fsu_0071N_17763_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Beauford_fsu_0071E_17933_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Beggs_fsu_0071E_17697_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Benetti_fsu_0071E_17879_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Bickett_fsu_0071E_17830_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Bobitt_fsu_0071N_17776_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Bocharski_fsu_0071N_17989_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Bookman_fsu_0071E_17661_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Bose_fsu_0071E_17783_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Brown_fsu_0071E_17907_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Cacho_fsu_0071E_17868_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Calderon_fsu_0071E_17938_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Canny_fsu_0071E_17699_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Carrier_fsu_0071E_17785_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Castro_fsu_0071E_17721_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Chandramouli_fsu_0071E_17732_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Chen_fsu_0071N_17638_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Chetri_fsu_0071E_17604_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Chiu_fsu_0071E_17916_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Choi_fsu_0071E_17924_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Chowdhury_fsu_0071E_17832_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Christman_fsu_0071E_17691_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Chulak_fsu_0071E_17807_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Chung_fsu_0071E_17858_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Clark_fsu_0071N_17953_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Clear_fsu_0071N_17838_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Clifford_fsu_0071E_17866_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Collins_fsu_0071E_17765_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Davenport_fsu_0071E_17751_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Demetropoulos_fsu_0071E_17729_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Deng_fsu_0071E_17852_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Devies_fsu_0071E_17801_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Dodge_fsu_0071E_17870_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Donahue_fsu_0071E_17707_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Donnell_fsu_0071E_17829_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Dormeus_fsu_0071E_17654_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Doshier_fsu_0071E_17798_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Driscoll_fsu_0071E_17724_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Dubbert_fsu_0071N_17964_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Dye_fsu_0071E_17849_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Edwards_fsu_0071E_17915_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Erdem_fsu_0071N_17723_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Evans_fsu_0071E_17775_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Evans_fsu_0071E_17809_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Fleming_fsu_0071E_17875_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/FradeMachado_fsu_0071E_17876_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Fried_fsu_0071N_17955_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Frye_fsu_0071E_17769_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Fundelius_fsu_0071E_17657_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Gannon_fsu_0071E_17893_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Gerardi_fsu_0071E_17803_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Gooptu_fsu_0071N_17978_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Grice_fsu_0071N_17991_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Guediri_fsu_0071N_17961_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Guo_fsu_0071E_17831_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Hadlock_fsu_0071N_17778_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Haines_fsu_0071E_17872_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Hines_fsu_0071E_17804_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Howell_fsu_0071N_17983_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Huh_fsu_0071E_17815_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Hunt_fsu_0071E_17878_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Ingram_fsu_0071N_17963_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Ivey_fsu_0071E_17826_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/JohnnyNanSman_fsu_0071N_17974_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Johnston_fsu_0071E_17818_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Joyner_fsu_0071E_17940_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Jumah_fsu_0071E_17929_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Kepple_fsu_0071E_17909_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Kerins_fsu_0071N_18002_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Kershner_fsu_0071N_17992_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Kettelkamp_fsu_0071E_17653_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/kinni_fsu_0071N_17802_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/kuba_fsu_0071E_17722_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Kyne_fsu_0071E_17759_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Labissiere_fsu_0071E_17860_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Lang_fsu_0071E_17693_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Larson_fsu_0071E_17796_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Laudato_fsu_0071E_17728_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Lesick_fsu_0071N_17912_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Li_fsu_0071E_17843_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Lin_fsu_0071N_18023_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Liu_fsu_0071E_17717_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Liu_fsu_0071E_17754_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Lu_fsu_0071E_17925_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Mahonen_fsu_0071E_17799_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Mainuddin_fsu_0071E_17881_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Marek_fsu_0071N_17981_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Marr_fsu_0071E_17684_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Mathis_fsu_0071E_17926_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/McAllisterJr_fsu_0071N_17880_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/McGuary_fsu_0071E_17894_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/McLaine_fsu_0071N_17782_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Medina_fsu_0071E_17665_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Mendoza_fsu_0071E_17814_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Mercer_fsu_0071E_17794_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Molenaar_fsu_0071N_17980_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Moore_fsu_0071N_17733_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Moreau_fsu_0071N_17746_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Morley_fsu_0071N_18003_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Mostowski_fsu_0071E_17672_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Mukri_fsu_0071E_17700_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Mullins_fsu_0071E_17716_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Naha_fsu_0071N_17615_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Nemeth_fsu_0071E_17877_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Ng_fsu_0071E_17923_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Nicolas_fsu_0071E_17676_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/NotarFrancesco_fsu_0071N_17979_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Oh_fsu_0071E_17947_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Olonade_fsu_0071E_17810_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Ortiz_fsu_0071E_17737_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/OteroVargas_fsu_0071E_17679_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Parkman_fsu_0071E_17874_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Pearson_fsu_0071E_17816_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Pepe_fsu_0071E_17847_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Phifer_fsu_0071E_17663_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Phillips_fsu_0071E_17694_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Pollack_fsu_0071E_17499_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Popp_fsu_0071E_17750_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/PorterDenecke_fsu_0071E_17895_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/ProkopSeaton_fsu_0071E_17871_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Rainwater_fsu_0071E_17747_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Raulerson_fsu_0071E_17718_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Rawlin_fsu_0071E_17730_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Rawls_fsu_0071E_17900_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/ReedBanks_fsu_0071E_17927_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Rho_fsu_0071E_17758_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Richard_fsu_0071N_17965_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Robertson_fsu_0071E_17779_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Robinson_fsu_0071E_17890_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Robison_fsu_0071N_17762_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Rose_fsu_0071N_17651_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Rouiller_fsu_0071E_17703_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Salsman_fsu_0071E_17901_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Sanford_fsu_0071N_17952_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Savage_fsu_0071N_18007_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Saxena_fsu_0071E_17662_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Sayghe_fsu_0071E_17659_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Schletz_fsu_0071N_17904_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Scott_fsu_0071N_17969_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Seagraves_fsu_0071E_17742_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Selice_fsu_0071E_17696_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Sheets_fsu_0071E_17698_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Shooshtari_fsu_0071N_17660_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Shultz_fsu_0071N_17919_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Simon_fsu_0071E_17671_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Simone_fsu_0071E_17942_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Simpson_fsu_0071N_18004_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Sisson_fsu_0071E_17677_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Slaughter_fsu_0071E_17678_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Smith_fsu_0071E_17674_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Smith_fsu_0071N_17966_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Solz_fsu_0071E_17680_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Sopp_fsu_0071E_17656_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Sorenson_fsu_0071E_17422_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Stanfill_fsu_0071E_17854_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Stecker_fsu_0071N_17789_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Stephenson_fsu_0071N_18006_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/StPierre_fsu_0071N_17771_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Sullivan_fsu_0071E_17834_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Tan_fsu_0071E_17905_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/TedjamuliaRead_fsu_0071E_17943_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Telikapalli_fsu_0071E_17824_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Testerman_fsu_0071N_17797_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Thompson_fsu_0071N_17958_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Tice_fsu_0071E_17708_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Turner_fsu_0071E_17766_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Valle_fsu_0071E_17855_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Vanbik_fsu_0071E_17735_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Wallace_fsu_0071N_17620_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Wang_fsu_0071E_17773_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Wang_fsu_0071E_17840_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Webb_fsu_0071E_17857_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/West_fsu_0071E_17891_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/White_fsu_0071E_17714_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/White_fsu_0071E_17734_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/White_fsu_0071N_17711_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Whittington_fsu_0071E_17692_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Wick_fsu_0071E_17704_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Wilder_fsu_0071N_17846_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Woessner_fsu_0071E_17839_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Wojtala_fsu_0071N_17985_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/YANG_fsu_0071N_17972_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Yap_fsu_0071N_17995_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Yu_fsu_0071N_17774_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Yun_fsu_0071E_17844_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Zampieri_fsu_0071E_17649_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Zhang_fsu_0071E_17930_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Zhang_fsu_0071N_17998_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Zolot_fsu_0071E_17850_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Zong_fsu_0071E_17792_DATA.xml')"/>
            <xsl:copy-of
                select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2023/2023A_Spring/DATA/Zylberkan_fsu_0071E_17863_DATA.xml')"/>
        
        </xml>
    </xsl:template>

</xsl:stylesheet>
