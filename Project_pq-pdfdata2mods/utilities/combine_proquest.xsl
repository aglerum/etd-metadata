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
          
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Abbett_fsu_0071E_16843_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Agharazidermani_fsu_0071E_16859_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Akpolat_fsu_0071E_16871_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/AlAmer_fsu_0071E_16632_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/AlbertII_fsu_0071E_16834_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Allen_fsu_0071E_16826_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Allman_fsu_0071N_16910_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Arnold_fsu_0071N_16923_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Asher_fsu_0071N_16917_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Baez_fsu_0071E_16838_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Blank_fsu_0071N_16824_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Bommarito_fsu_0071E_16897_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Brooks_fsu_0071E_16864_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Buchwalter_fsu_0071E_16866_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/CALLEN_fsu_0071E_16855_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Carbonell_fsu_0071E_16596_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Cheng_fsu_0071E_16842_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Cheung_fsu_0071N_16911_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Clarke_fsu_0071E_16819_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Cole_fsu_0071E_16827_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/CondeCuruchet_fsu_0071N_16915_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Cox_fsu_0071N_16918_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Davidson_fsu_0071E_16837_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Dessureault_fsu_0071E_16120_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Doll_fsu_0071E_16884_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Donohue_fsu_0071E_16896_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Eaton_fsu_0071E_16903_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Farfan_fsu_0071E_16846_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Fontaine_fsu_0071N_16908_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Freeland_fsu_0071E_16790_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Fuste_fsu_0071E_16798_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/GermosenPolanco_fsu_0071N_16919_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Ghorbanzadeh_fsu_0071E_16822_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Goodman_fsu_0071E_16817_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Gueterman_fsu_0071N_16434_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Gurdogan_fsu_0071E_16811_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Haluska_fsu_0071E_16863_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Harmon_fsu_0071E_16784_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Hendrickse_fsu_0071E_16850_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Hertel_fsu_0071N_16830_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Holland_fsu_0071E_16804_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Hooks_fsu_0071E_16825_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Huang_fsu_0071E_16877_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Huse_fsu_0071E_16836_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Janakiraman_fsu_0071N_16916_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Jiang_fsu_0071E_16808_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Jiang_fsu_0071E_16815_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Joyner_fsu_0071E_16854_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Kanupp_fsu_0071E_16893_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Kennedy_fsu_0071E_16042_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Korzaan_fsu_0071E_16482_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Lai_fsu_0071E_16849_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/LaJoie_fsu_0071N_16909_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Lawrence_fsu_0071N_16889_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Lee_fsu_0071E_16364_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Li_fsu_0071E_16788_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Li_fsu_0071E_16820_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Liang_fsu_0071E_16814_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Lieberman_fsu_0071N_16780_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Lim_fsu_0071E_16700_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Liu_fsu_0071E_16874_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Liu_fsu_0071N_16807_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Marante_fsu_0071E_16795_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Marklin_fsu_0071E_16785_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Marzano_fsu_0071E_16828_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Mears_fsu_0071E_16840_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Mehrani_fsu_0071E_16868_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/MejiaPrado_fsu_0071E_16775_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Mendez_fsu_0071N_16912_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Meng_fsu_0071E_16869_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Moon_fsu_0071E_16926_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/MoralesRapallo_fsu_0071N_16812_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Murphy_fsu_0071N_16813_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Murray_fsu_0071E_16816_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Nelson_fsu_0071E_16675_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Nguyen_fsu_0071E_16835_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Nissenbaum_fsu_0071E_16653_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/OsegueraGamba_fsu_0071E_16904_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Osterhouse_fsu_0071N_16921_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Park_fsu_0071E_16841_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Park_fsu_0071N_16796_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Payrovnaziri_fsu_0071E_16783_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Pearson_fsu_0071E_16800_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Peng_fsu_0071E_16886_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Peters_fsu_0071N_16787_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Phillips_fsu_0071E_16806_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Pieper_fsu_0071N_16801_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Pierre_fsu_0071N_16845_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Podkorytov_fsu_0071E_16873_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Porter_fsu_0071E_16890_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Prather_fsu_0071E_16563_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Ramakrishna_fsu_0071E_16894_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/RamirezBullon_fsu_0071E_16847_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Ren_fsu_0071E_16829_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Rifqi_fsu_0071N_16832_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Rivero_fsu_0071E_16862_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Ruiz_fsu_0071N_16743_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/SampathKumar_fsu_0071E_16865_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/SanchezSolarte_fsu_0071E_16786_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Sangokunle_fsu_0071E_16809_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Sarig_fsu_0071E_16805_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Schairer_fsu_0071N_16924_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Schattinger_fsu_0071E_16856_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Schmitz_fsu_0071E_16797_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Schroder_fsu_0071E_16810_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Schulte_fsu_0071E_16870_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Silva_fsu_0071E_16831_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Simpson_fsu_0071N_16914_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Smith_fsu_0071E_16771_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Smith_fsu_0071E_16844_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Son_fsu_0071E_16803_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Soroka_fsu_0071E_16861_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Stoltzfus_fsu_0071E_16799_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Stringer_fsu_0071E_16457_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Stuart_fsu_0071N_16913_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Terres_fsu_0071E_16867_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Uehling_fsu_0071E_16852_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Velasquez_fsu_0071E_16882_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Villena_fsu_0071N_16920_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Vinquist_fsu_0071N_16789_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Wang_fsu_0071E_16839_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Wassel_fsu_0071E_16678_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Wei_fsu_0071E_16888_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/White_fsu_0071E_16818_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Yang_fsu_0071E_16792_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Yang_fsu_0071E_16878_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Yang_fsu_0071E_16891_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/Yarbrough_fsu_0071N_16925_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/York_fsu_0071E_16899_DATA.xml')"/>
            <xsl:copy-of select="document('/Users/achisum.FSU/OneDrive - Florida State University/Desktop/Project_Files/ETDs/2021/2021C_fall/DATA/YU_fsu_0071E_16905_DATA.xml')"/>

        </xml>
    </xsl:template>   
   
</xsl:stylesheet>
