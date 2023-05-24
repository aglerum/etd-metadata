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
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Adhikari_fsu_0071N_17218_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Aldawsari_fsu_0071E_17049_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Aldossari_fsu_0071E_17365_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Alfonso_fsu_0071N_17440_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Anbouhi_fsu_0071E_17325_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Austin_fsu_0071E_17348_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Bak_fsu_0071E_17369_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Banini_fsu_0071E_17273_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Bannister_fsu_0071N_17434_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Bates_fsu_0071E_17231_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Bishop_fsu_0071E_17121_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Block_fsu_0071E_17303_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Boswell_fsu_0071E_17252_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Brantley_fsu_0071N_17469_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Bridges_fsu_0071N_17350_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Brunick_fsu_0071E_17425_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Cai_fsu_0071E_17279_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Carstens_fsu_0071E_17266_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Challenger_fsu_0071E_17321_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Chen_fsu_0071E_17354_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Chen_fsu_0071E_17360_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Chia_fsu_0071E_17272_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/CHOI_fsu_0071E_17385_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Choi_fsu_0071E_17395_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Chowdhury_fsu_0071E_17307_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Ciappetta_fsu_0071E_17106_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Clancy_fsu_0071E_16731_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/ClossonPitts_fsu_0071E_17265_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Cochran_fsu_0071E_17386_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/ConsoliverZack_fsu_0071E_17374_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Cooper_fsu_0071E_16938_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Devine_fsu_0071E_16712_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Dischman_fsu_0071E_17294_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Evers_fsu_0071N_17446_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Fenton_fsu_0071E_17254_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Finet_fsu_0071E_17278_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/FrancoRivera_fsu_0071E_17368_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Gallan_fsu_0071N_16954_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Gaulden_fsu_0071E_17191_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Girala_fsu_0071N_17458_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Gray_fsu_0071N_17253_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Greenwood_fsu_0071N_17335_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Ha_fsu_0071E_17377_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Habibullah_fsu_0071E_17284_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Han_fsu_0071E_17345_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Hardin_fsu_0071N_17008_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Holland_fsu_0071E_17142_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Holzheuser_fsu_0071E_17389_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Hu_fsu_0071E_17310_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Irwin_fsu_0071E_16881_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Khan_fsu_0071E_17324_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Khobragade_fsu_0071E_17418_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Klenck_fsu_0071N_17445_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Koller_fsu_0071E_17239_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Le_fsu_0071E_17420_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Lee_fsu_0071E_17250_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Liu_fsu_0071E_17326_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Liu_fsu_0071E_17435_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Mauntel_fsu_0071E_17351_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Meyer_fsu_0071N_17185_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Mortensen_fsu_0071N_17367_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Mukherjee_fsu_0071E_17146_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Pereira_fsu_0071E_17441_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Poe_fsu_0071E_17180_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Popovic_fsu_0071E_17322_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Ramey_fsu_0071E_17404_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Rashid_fsu_0071N_17267_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Ren_fsu_0071E_17285_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Ringer_fsu_0071E_17416_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Rooney_fsu_0071E_17300_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Rosano_fsu_0071E_17314_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Ryan_fsu_0071E_17353_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Santopetro_fsu_0071N_17182_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Schafer_fsu_0071E_17289_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Shapiro_fsu_0071N_17251_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Shenberger_fsu_0071E_17260_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Smith_fsu_0071E_17333_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Sokolowski_fsu_0071E_17375_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Solimine_fsu_0071E_17323_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Stalpes_fsu_0071E_17327_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Thomas_fsu_0071E_17387_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Tibedo_fsu_0071N_17291_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Vlasenko_fsu_0071E_17362_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Wang_fsu_0071E_17085_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Wang_fsu_0071E_17274_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Wang_fsu_0071E_17311_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Ward_fsu_0071E_17463_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/White_fsu_0071E_17316_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Woodruff_fsu_0071E_17257_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Wu_fsu_0071E_17344_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Xiong_fsu_0071E_17349_DATA.xml')"/>
            <xsl:copy-of select="document('file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2022/2022B_Summer/DATA/Xu_fsu_0071E_17393_DATA.xml')"/>        </xml>
    </xsl:template>

</xsl:stylesheet>
