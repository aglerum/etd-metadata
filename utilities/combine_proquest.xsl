<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    
    <!-- Configure the transformation with dummy.xml as source and nothing selected in the output tab.
            The path of files to be combined changes with each batch.
                In Windows, use this: file:///c:/Users/
                In OSX, use this: /Users/       
                Example:
                <xsl:copy-of
                    select="document('file:///g:/CS/TechResources/Bepress-migration/Source_Data/etds/bepress_metadata/unsup-etd_metadata/bepress_UTF8/bepress_all_uft8/etd-0994.metadata.xml')"/>
        --> 

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="xml">
        <xml>       
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Anaya_fsu_0071E_13600_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Anguelov_fsu_0071E_13532_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Balwada_fsu_0071E_13549_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Barnett_fsu_0071E_13688_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Barroso_fsu_0071N_13469_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Batsomboon_fsu_0071E_13613_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Beckwith_fsu_0071N_12986_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Benjamin_fsu_0071E_13618_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Billet_fsu_0071E_13563_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Boatman_fsu_0071E_13592_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Borden_fsu_0071E_13586_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Bowden_fsu_0071N_13560_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Boykins_fsu_0071E_13570_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Brailsford_fsu_0071E_13476_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Brewer_fsu_0071N_13652_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Brown_fsu_0071E_13594_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Buddenhagen_fsu_0071E_13553_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Bundy_fsu_0071E_13588_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Cable_fsu_0071N_13663_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Carmichael_fsu_0071E_13547_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Chan_fsu_0071E_13552_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Chen_fsu_0071E_13596_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Chipperfield_fsu_0071E_13615_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Chiu_fsu_0071E_13584_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Chiurliza_fsu_0071N_13522_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Chung_fsu_0071E_13597_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Clark_fsu_0071E_13504_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Conlon_fsu_0071N_13627_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Craft_fsu_0071N_13535_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Crouse_fsu_0071N_13568_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Cruz_fsu_0071N_13650_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/CuadraCardona_fsu_0071E_13494_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Cui_fsu_0071E_13537_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Das_fsu_0071E_13587_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Dial_fsu_0071E_13505_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Dick_fsu_0071E_13561_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Dong_fsu_0071E_13219_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Dossat_fsu_0071E_13578_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Edel_fsu_0071E_13539_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Ehtemami_fsu_0071N_13634_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Fenn_fsu_0071E_13617_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Ferdowsi_fsu_0071E_13548_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Garcia_fsu_0071E_13536_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Garrison_fsu_0071N_13502_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Gordon_fsu_0071E_13511_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Gu_fsu_0071E_13579_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Guan_fsu_0071E_13425_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Haemmelmann_fsu_0071E_13562_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Hamlin_fsu_0071N_13643_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Hartman_fsu_0071N_13642_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Harvey_fsu_0071N_13629_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Hendrickse_fsu_0071N_13460_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Hofler_fsu_0071N_13582_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Holbach_fsu_0071E_13475_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Horner_fsu_0071E_13593_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Huang_fsu_0071E_13659_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Huang_fsu_0071N_13513_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Hubley_fsu_0071E_13543_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Hwang_fsu_0071E_13440_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Hyde_fsu_0071N_13640_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Imran_fsu_0071E_13492_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Jacobs_fsu_0071N_13639_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Jerry_fsu_0071E_13623_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Kelly_fsu_0071E_13412_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Khazmutdinova_fsu_0071E_13545_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Kim_fsu_0071E_13529_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/KIM_fsu_0071E_13573_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Kim_fsu_0071E_13599_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/King_fsu_0071N_13651_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Kocyigit_fsu_0071E_13569_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Kreipke_fsu_0071E_13546_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Lee_fsu_0071E_13517_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Lee_fsu_0071N_13520_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Li_fsu_0071E_13616_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Lin_fsu_0071E_13564_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Little_fsu_0071E_13500_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Liu_fsu_0071E_13528_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Luke_fsu_0071E_13559_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Lyngaas_fsu_0071N_13512_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Macchiarella_fsu_0071E_13591_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Maczko_fsu_0071E_13612_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Marchand_fsu_0071E_13523_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Margres_fsu_0071E_13496_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Martinez_fsu_0071E_13576_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Matras_fsu_0071E_13550_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Maunula_fsu_0071E_13527_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Miao_fsu_0071N_13628_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Mills_fsu_0071E_13606_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Moore_fsu_0071E_13493_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Muddu_fsu_0071N_13633_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Mukherjee_fsu_0071E_13450_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Murphy_fsu_0071E_13518_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Nakouzi_fsu_0071E_13624_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Negley_fsu_0071E_13447_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Ngauja_fsu_0071N_13472_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Oliver_fsu_0071E_13521_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Olwi_fsu_0071E_13446_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Patel_fsu_0071N_13465_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Paulino_fsu_0071E_13514_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Peirce_fsu_0071N_13580_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/RamirezBullon_fsu_0071N_13551_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Ramp_fsu_0071E_13508_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Ratcliffe_fsu_0071N_13614_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Reinhardt_fsu_0071E_10751_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Roy_fsu_0071E_13542_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/SalimBakare_fsu_0071E_13621_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Sang_fsu_0071N_13655_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Scott_fsu_0071E_13530_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Shi_fsu_0071E_13449_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Shin_fsu_0071E_13583_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Short_fsu_0071N_13457_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Silver_fsu_0071E_13567_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/SIMSAR_fsu_0071E_13558_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Singletary_fsu_0071E_13495_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Smith_fsu_0071N_13626_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Sockwell_fsu_0071N_13577_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Song_fsu_0071E_13498_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Spiegel_fsu_0071N_13499_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Summerill_fsu_0071N_13636_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Tao_fsu_0071E_13544_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Taylor_fsu_0071E_13534_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Thomas_fsu_0071E_13538_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Towne_fsu_0071E_13619_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Tran_fsu_0071E_13515_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Trusty_fsu_0071E_13516_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Tsai_fsu_0071E_13533_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Utama_fsu_0071E_13557_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Venables_fsu_0071E_13525_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Wandell_fsu_0071E_13556_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Wang_fsu_0071E_13497_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Watson_fsu_0071E_13620_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Weedo_fsu_0071N_13638_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Wei_fsu_0071E_13585_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Wells_fsu_0071N_13649_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Wilson_fsu_0071E_13444_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Xia_fsu_0071E_13509_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Xiao_fsu_0071N_13631_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Xu_fsu_0071N_13637_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Yao_fsu_0071E_13605_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Yazbec_fsu_0071N_13590_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Youngblood_fsu_0071E_13524_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Zeoli_fsu_0071E_13456_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Zhang_fsu_0071E_13604_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Zhang_fsu_0071N_13669_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Zhou_fsu_0071E_13403_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Zhou_fsu_0071N_13603_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/ETDs/ProQuest files/2016_fall/DATA/Allison_fsu_0071N_13632_DATA.xml')"/>        
        </xml>
     
    </xsl:template>   
   
</xsl:stylesheet>
