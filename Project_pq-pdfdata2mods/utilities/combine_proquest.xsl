<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0">
    
    <!-- Last Updated: November 13, 2021 -->
    
    <!-- Configure the transformation with empty.xml as source.
            The path of files to be combined changes with each batch.
                In Windows, use this: file:///c://Users/
                In OSX, use this: //Users/       
                Example:
                <xsl:copy-of select="document('//Users/Volumes/Groups/CS/TechResources/Bepress-migration/Source_Data/etds/bepress_metadata/unsup-etd_metadata/bepress_UTF8/bepress_all_uft8/etd-0994.metadata.xml')"/>
                
                <xsl:copy-of select="document('//Users/annie/Volumes/Groups/CS/TechResources/ETDs/ProQuest_files/2017C_fall/DATA/Acar_fsu_0071E_14749_DATA.xml')"/>
        --> 

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="xml">
        <xml>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Abdi_fsu_0071N_16739_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/AbouShaheen_fsu_0071E_16669_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Acevedo_fsu_0071N_16728_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Afzal_fsu_0071E_16691_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Agarwal_fsu_0071E_16614_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Akubo_fsu_0071E_16768_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/ALBAHLAL_fsu_0071E_16323_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Albert_fsu_0071E_16554_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/ALSHAHRANI_fsu_0071E_16650_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Anderson_fsu_0071N_16756_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Arbulu_fsu_0071E_16637_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Archer_fsu_0071N_16603_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/AsareAkuffo_fsu_0071E_16613_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Asher_fsu_0071E_16661_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Ashraf_fsu_0071N_16753_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Atabas_fsu_0071E_16648_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Bagdasarian_fsu_0071E_16611_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Barber_fsu_0071N_16744_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Bercel_fsu_0071E_16692_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Bilgin_fsu_0071E_16600_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Bishnu_fsu_0071E_16592_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Bloch_fsu_0071N_16721_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Blonde_fsu_0071E_16644_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Brandt_fsu_0071N_16626_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Brown_fsu_0071E_16711_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Brown_fsu_0071N_16572_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Bryan_fsu_0071E_16576_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Burgin_fsu_0071E_16587_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Burris_fsu_0071E_16599_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Call_fsu_0071E_16584_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Carter_fsu_0071N_16715_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Caviedes_fsu_0071N_16513_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Chahardovali_fsu_0071E_16634_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Chappell_fsu_0071E_16688_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Chauchois_fsu_0071E_16542_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Cone_fsu_0071E_16590_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Cooper_fsu_0071N_16740_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Daly_fsu_0071E_16680_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Daneshparvar_fsu_0071E_16668_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Daniels_fsu_0071E_16582_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Dias_fsu_0071E_16686_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Dill_fsu_0071E_16696_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Dirkes_fsu_0071N_16633_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Diwanji_fsu_0071E_16589_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Dong_fsu_0071E_16113_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Dotterweich_fsu_0071N_16560_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Eastman_fsu_0071E_16604_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Edwards_fsu_0071E_16351_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Ehtemami_fsu_0071E_16624_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Figueroa_fsu_0071E_16654_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Forbes_fsu_0071E_16570_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/French_fsu_0071E_16697_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Geer_fsu_0071E_16660_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Gerken_fsu_0071E_16472_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/GermanaRoquez_fsu_0071E_16670_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Gubara_fsu_0071E_16713_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Guerard_fsu_0071E_16642_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Hand_fsu_0071N_16565_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Healy_fsu_0071E_16683_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Herbst_fsu_0071N_16734_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Hernandez_fsu_0071N_16718_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Hike_fsu_0071E_16779_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Hogg_fsu_0071N_16749_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Holsinger_fsu_0071E_16657_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Holt_fsu_0071N_16541_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Huang_fsu_0071E_16455_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Hudis_fsu_0071E_16762_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Imhoff_fsu_0071E_16699_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Irvan_fsu_0071E_16693_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/ISAQZAI_fsu_0071E_16583_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Jackson_fsu_0071E_16617_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Javarone_fsu_0071E_16662_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Jiang_fsu_0071E_16606_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/JohnsonII_fsu_0071E_16671_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/JOO_fsu_0071N_16732_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Jurgens_fsu_0071E_16623_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Karabedian_fsu_0071N_16761_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Karl_fsu_0071N_16748_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Kim_fsu_0071E_16478_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Kim_fsu_0071E_16639_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Kimrey_fsu_0071E_16708_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/lashley_fsu_0071E_16651_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Lee_fsu_0071N_16746_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Li_fsu_0071E_16595_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Lloyd_fsu_0071E_16615_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Lowery_fsu_0071E_16682_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Lupo_fsu_0071E_16621_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Magee_fsu_0071E_16687_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Maldonado_fsu_0071E_16442_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Mallinas_fsu_0071E_16625_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Mann_fsu_0071E_16616_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Mathes_fsu_0071E_16571_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Matson_fsu_0071E_16573_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Maurice_fsu_0071E_16663_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/McClellan_fsu_0071E_16612_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/McNeal_fsu_0071E_16069_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/MejiaMercado_fsu_0071E_16778_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Mendez_fsu_0071E_16620_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Meuser_fsu_0071N_16574_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Miller_fsu_0071N_16742_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Mills_fsu_0071E_16424_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Mistich_fsu_0071E_16649_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/MolinaSieiro_fsu_0071E_16588_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Moon_fsu_0071E_16628_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/MOORE_fsu_0071E_16601_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Morgan_fsu_0071E_16608_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Mozo_fsu_0071N_16738_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Murphy_fsu_0071E_16579_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Nagarajan_fsu_0071N_16672_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Neu_fsu_0071E_16288_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Norflus_fsu_0071N_16655_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Odom_fsu_0071N_16593_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Olsen_fsu_0071E_16690_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Ostrander_fsu_0071N_16719_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Owens_fsu_0071E_16640_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Oxley_fsu_0071E_16569_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Oz_fsu_0071E_16714_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Pappas_fsu_0071E_16622_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Perello_fsu_0071E_16684_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Perron_fsu_0071N_16716_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Peterson_fsu_0071E_16679_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Peterson_fsu_0071E_16782_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Pippin_fsu_0071N_16735_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Qin_fsu_0071E_16676_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Ragland_fsu_0071E_16594_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Rahmani_fsu_0071E_16646_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Redden_fsu_0071N_16722_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Reid_fsu_0071E_16698_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Rezkalla_fsu_0071E_16665_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Robertson_fsu_0071E_16631_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Rodriguez_fsu_0071N_16745_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/RomeroMestas_fsu_0071E_16704_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Ross_fsu_0071E_16674_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Rossetti_fsu_0071E_16271_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Ruiz_fsu_0071N_16726_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Rutledge_fsu_0071E_16641_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Rutledge_fsu_0071E_16709_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/SachsKrook_fsu_0071N_16705_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Saltzberg_fsu_0071N_16727_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Sanchez_fsu_0071E_16449_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Sangster_fsu_0071N_16724_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Saucedo_fsu_0071E_16568_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Saunders_fsu_0071E_16350_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Scherer_fsu_0071E_16630_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Schrowang_fsu_0071E_16575_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Shie_fsu_0071E_16681_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Shisode_fsu_0071E_16636_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Sides_fsu_0071E_16664_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Simmons_fsu_0071E_16480_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Small_fsu_0071N_16514_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Smith_fsu_0071N_16530_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Spencer_fsu_0071E_16586_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Stanley_fsu_0071E_16567_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Stark_fsu_0071E_16497_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Sun_fsu_0071E_16581_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Sun_fsu_0071E_16591_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Szymanski_fsu_0071E_16694_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Tang_fsu_0071N_16773_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Telikapalli_fsu_0071E_16419_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Thomsen_fsu_0071E_16635_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Tindell_fsu_0071E_16645_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Um_fsu_0071E_16667_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/VilfortGarces_fsu_0071N_16750_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Wang_fsu_0071E_16376_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Wang_fsu_0071E_16706_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Ward_fsu_0071E_16484_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Webster_fsu_0071E_16766_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Westbrook_fsu_0071N_16733_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/WhitbyOkafor_fsu_0071E_16659_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Whitfield_fsu_0071N_16585_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Wickline_fsu_0071N_16736_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Williams_fsu_0071E_16566_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Wood_fsu_0071E_16557_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Wooten_fsu_0071E_16352_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Xu_fsu_0071E_16392_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Xu_fsu_0071E_16577_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Xu_fsu_0071E_16578_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Yarolimek_fsu_0071E_16794_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Yazawa_fsu_0071E_16656_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Yoest_fsu_0071N_16730_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Youngberg_fsu_0071E_16580_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Zhang_fsu_0071E_16652_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Zhang_fsu_0071E_16767_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Zhao_fsu_0071E_16609_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Zhao_fsu_0071N_16619_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021_B_summer/DATA/Zhong_fsu_0071E_16710_DATA.xml')"/>

        </xml>
    </xsl:template>   
   
</xsl:stylesheet>
