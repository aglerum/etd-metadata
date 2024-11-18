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
                
                <xsl:copy-of select="document('//Users/annie/Volumes/Groups/CS/TechResources/ETDs/ProQuest_files/2017C_fall/DATA/Acar_fsu_0071E_14749_DATA.xml")'/>
                
                <xsl:copy-of select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/ETD_MODS/2020/2020_BC_summer_fall/DATA/Abdullah_fsu_0071E_16363_DATA.xml")'/>
        -->

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="xml">
        <xml>

            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Acosta_fsu_0071E_18926_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Adams_fsu_0071E_18181_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Adams_fsu_0071E_18681_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Adams_fsu_0071E_18954_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Adeoye_fsu_0071E_18218_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Adhikary_fsu_0071E_19024_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/AkcilOkan_fsu_0071E_17761_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Akkaoui_fsu_0071E_18268_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Alam_fsu_0071N_18228_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Alfonso_fsu_0071E_17372_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Alharthi_fsu_0071E_18973_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Amarasinghe_fsu_0071E_18939_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Anderson_fsu_0071E_18810_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Artiles_fsu_0071E_18924_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Asad_fsu_0071N_18935_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Asturizaga_fsu_0071E_18219_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ataie_fsu_0071E_18156_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Atalay_fsu_0071E_17946_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Azeez_fsu_0071E_18944_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Aziz_fsu_0071E_18258_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Barnes_fsu_0071N_18227_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Barron_fsu_0071E_18845_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/BenAkacha_fsu_0071E_18370_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Berardo_fsu_0071E_18407_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bermudez_fsu_0071E_18878_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bertini_fsu_0071E_18958_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bertoldi_fsu_0071E_18166_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Best_fsu_0071E_18832_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bhattacharya_fsu_0071E_18172_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bignault_fsu_0071N_18923_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bingi_fsu_0071N_18849_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Boehme_fsu_0071E_18986_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bogart_fsu_0071E_18280_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bouaichi_fsu_0071E_18857_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Boykin_fsu_0071E_18903_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bradley_fsu_0071E_18213_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/BragaCarani_fsu_0071E_18063_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/BreaGuerrero_fsu_0071E_18985_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Brennan_fsu_0071N_18456_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Brimm_fsu_0071N_18431_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Brousse_fsu_0071N_18909_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Brown_fsu_0071E_19001_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bruce_fsu_0071E_18871_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bruefach_fsu_0071E_18055_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Bunn_fsu_0071E_18855_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Calabro_fsu_0071E_18100_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Campanile_fsu_0071E_18186_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Campbell_fsu_0071E_18126_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Carroll_fsu_0071N_18209_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Chan_fsu_0071E_17408_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Channer_fsu_0071E_18965_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Chen_fsu_0071E_18856_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Chen_fsu_0071E_18961_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/CherryRandle_fsu_0071E_18112_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Chitaman_fsu_0071E_18889_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Choi_fsu_0071E_18899_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Chong_fsu_0071E_17442_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Chouhan_fsu_0071E_18890_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Chun_fsu_0071E_18149_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Coia_fsu_0071E_18093_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Cole_fsu_0071E_18813_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Collins_fsu_0071E_18114_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Coscarella_fsu_0071E_18584_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Cote_fsu_0071E_18987_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Crawford_fsu_0071N_18898_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Crofoot_fsu_0071E_18140_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Crombet_fsu_0071E_18945_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Crouse_fsu_0071N_19023_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Daurio_fsu_0071E_17668_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Davis_fsu_0071E_18819_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Day_fsu_0071E_18206_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/DeBord_fsu_0071E_18613_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/DelgadoFernandez_fsu_0071E_18827_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Dellafiora_fsu_0071E_18793_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Dilanchian_fsu_0071E_18876_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Dilanchian_fsu_0071N_18191_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Dogra_fsu_0071E_18992_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Dong_fsu_0071E_18402_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Donmez_fsu_0071E_18967_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Donoghue_fsu_0071E_18851_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Doss_fsu_0071E_18908_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Dougherty_fsu_0071E_18929_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Duffy_fsu_0071E_17197_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Eligio_fsu_0071E_18841_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ellis_fsu_0071N_19005_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Engelbert_fsu_0071N_19013_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/English_fsu_0071N_18826_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Evans_fsu_0071E_18369_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Fisher_fsu_0071E_18493_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Fisher_fsu_0071E_18897_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Fitzgerald_fsu_0071E_18972_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Fleer_fsu_0071E_18830_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Forrer_fsu_0071E_18930_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Franque_fsu_0071E_18962_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/FryeJones_fsu_0071E_18339_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Galef_fsu_0071N_17986_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/ghaziesfahani_fsu_0071E_18999_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Gilmore_fsu_0071E_18984_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/GogginsBrown_fsu_0071E_18919_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Gogilashvili_fsu_0071E_18836_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/GoncalvesDosSantos_fsu_0071E_18963_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Grinbergs_fsu_0071E_18076_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Gross_fsu_0071N_19026_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Groves_fsu_0071E_17498_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Guerrera_fsu_0071E_18921_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Gulavani_fsu_0071E_18828_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Guven_fsu_0071E_18064_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hagarty_fsu_0071E_18012_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hamel_fsu_0071E_18214_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hammel_fsu_0071E_18960_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Han_fsu_0071E_18780_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Han_fsu_0071E_18937_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/han_fsu_0071N_19020_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hand_fsu_0071E_18091_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hanley_fsu_0071E_18036_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Harris_fsu_0071E_19030_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hendrix_fsu_0071N_18787_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/HernandezEsteban_fsu_0071E_18020_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hersh_fsu_0071E_18159_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hirsch_fsu_0071E_18947_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hochstein_fsu_0071E_18079_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Holmes_fsu_0071N_18865_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hossain_fsu_0071E_18959_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hossain_fsu_0071N_18949_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Houser_fsu_0071E_18825_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Howton_fsu_0071E_18246_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Hughes_fsu_0071N_18872_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Iturriaga_fsu_0071E_18816_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Jayaraman_fsu_0071E_18995_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Jordan_fsu_0071N_18776_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Joye_fsu_0071N_19019_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kandibedala_fsu_0071N_18239_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kaplan_fsu_0071E_18123_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kauffman_fsu_0071N_18756_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kaya_fsu_0071E_18840_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Keyes_fsu_0071E_18802_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Khodaei_fsu_0071E_18187_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kievit_fsu_0071E_18988_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kim_fsu_0071E_18049_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kim_fsu_0071E_18170_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kim_fsu_0071E_18894_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kim_fsu_0071E_18904_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kim_fsu_0071E_18966_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kontodiakos_fsu_0071E_18842_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kuhn_fsu_0071E_18077_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Kwon_fsu_0071E_18885_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/LakshmiNarasimhaPrasad_fsu_0071E_18846_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lee_fsu_0071E_18900_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Leo_fsu_0071E_18941_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Li_fsu_0071E_18877_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Li_fsu_0071E_18976_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Liang_fsu_0071E_18839_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lin_fsu_0071E_18629_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lindeback_fsu_0071N_18968_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Liu_fsu_0071E_18133_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Liu_fsu_0071E_18405_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Liu_fsu_0071E_18699_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Liu_fsu_0071E_18821_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Liu_fsu_0071E_18837_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Logue_fsu_0071E_18139_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Long_fsu_0071E_18892_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lu_fsu_0071N_18758_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lugo_fsu_0071E_18864_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lundy_fsu_0071E_18913_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lupu_fsu_0071E_18630_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lyu_fsu_0071E_18879_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Lyu_fsu_0071E_18964_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ma_fsu_0071E_18873_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Malkadi_fsu_0071E_18204_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Manske_fsu_0071N_18911_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Manzo_fsu_0071N_19007_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Marencin_fsu_0071E_18998_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Marshall_fsu_0071E_18869_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/McCann_fsu_0071E_18067_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Melendrez_fsu_0071E_18948_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Metzler_fsu_0071N_18887_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Meyer_fsu_0071E_18994_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Mills_fsu_0071E_18345_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Mirzadegan_fsu_0071E_18097_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Monk_fsu_0071E_18915_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Moon_fsu_0071E_18321_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Moore_fsu_0071N_18169_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Morris_fsu_0071E_18116_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Morris_fsu_0071E_18936_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Mueller_fsu_0071E_17487_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Myrick_fsu_0071E_18621_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Naguib_fsu_0071E_18099_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Nam_fsu_0071E_18910_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Nelms_fsu_0071E_18475_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/NewboldJr_fsu_0071E_18817_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Noblitt_fsu_0071E_18198_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Noussier_fsu_0071N_18241_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ogunkunle_fsu_0071E_18304_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Oh_fsu_0071E_18024_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Oh_fsu_0071N_19016_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Oladehin_fsu_0071E_18920_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Omni_fsu_0071E_18089_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Orchard_fsu_0071E_18951_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ortega_fsu_0071E_18210_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ortega_fsu_0071E_18970_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ortolani_fsu_0071E_18979_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Park_fsu_0071E_18854_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Payne_fsu_0071N_18326_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Peace_fsu_0071E_18874_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Peach_fsu_0071E_17936_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Peng_fsu_0071E_18409_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Peng_fsu_0071E_18537_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Perez_fsu_0071E_18883_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Perinchery_fsu_0071E_19004_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Pesce_fsu_0071E_18668_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Pitts_fsu_0071E_18983_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Pocchio_fsu_0071E_18811_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Polischuk_fsu_0071E_18342_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Pourgharibshahi_fsu_0071E_18127_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Powell_fsu_0071E_18895_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Prevratil_fsu_0071N_18853_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Provat_fsu_0071E_18974_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Quinney_fsu_0071E_18741_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Raines_fsu_0071E_18774_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Raskin_fsu_0071N_18750_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Reynolds_fsu_0071E_18150_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Rhome_fsu_0071N_18182_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Riley_fsu_0071N_18990_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ritz_fsu_0071E_18914_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/RodriguezGarcia_fsu_0071E_18303_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/RodriguezLinera_fsu_0071E_18852_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Rogowski_fsu_0071E_19000_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Samarah_fsu_0071N_18464_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Sayed_fsu_0071E_18678_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Schubert_fsu_0071N_18957_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Semrad_fsu_0071E_18868_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Sheahan_fsu_0071N_18481_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Shi_fsu_0071E_18912_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Shohan_fsu_0071E_18918_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Shore_fsu_0071E_18144_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Sigel_fsu_0071N_18282_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Silas_fsu_0071N_18862_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Sparkman_fsu_0071E_18789_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Srinivasan_fsu_0071E_18834_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/StangeBacher_fsu_0071N_18875_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Stentz_fsu_0071E_18135_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Stewart_fsu_0071E_18905_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Taheri_fsu_0071E_18870_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Tawfiq_fsu_0071E_18844_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Temanson_fsu_0071E_18300_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Tian_fsu_0071E_18946_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/TimmFulkerson_fsu_0071E_18989_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Tomlinson_fsu_0071E_18916_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/TorresChavarro_fsu_0071E_18896_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Totakura_fsu_0071N_18956_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Turner_fsu_0071E_18083_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/VanStratum_fsu_0071E_18922_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/VELEZ_fsu_0071E_18605_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ventura_fsu_0071N_19022_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Venturini_fsu_0071E_18847_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Voss_fsu_0071E_18173_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Vuogan_fsu_0071E_18907_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Walker_fsu_0071E_18891_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Walker_fsu_0071N_18950_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wang_fsu_0071E_18906_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wang_fsu_0071E_18952_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wang_fsu_0071E_18977_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Watford_fsu_0071E_18881_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wei_fsu_0071E_18809_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Welch_fsu_0071E_18329_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/West_fsu_0071E_18863_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Westphal_fsu_0071N_18848_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wheeler_fsu_0071N_18933_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Whittington_fsu_0071N_17917_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wibowo_fsu_0071E_17910_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wick_fsu_0071E_18838_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wight_fsu_0071E_18256_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wimberly_fsu_0071E_18955_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wood_fsu_0071E_18893_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Wu_fsu_0071E_18978_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Xu_fsu_0071E_18888_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Yang_fsu_0071E_18880_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ye_fsu_0071E_18216_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Yeon_fsu_0071E_18942_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Yingling_fsu_0071E_18996_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Zhang_fsu_0071E_18688_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Zhao_fsu_0071E_18886_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Zhao_fsu_0071E_18934_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Zheng_fsu_0071E_18822_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Zheng_fsu_0071E_18860_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ziegler_fsu_0071E_18991_DATA.xml")'/>
            <xsl:copy-of
                select='document("file:///C:/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/data/Ziemer_fsu_0071N_18928_DATA.xml")'/>

        </xml>
    </xsl:template>

</xsl:stylesheet>
