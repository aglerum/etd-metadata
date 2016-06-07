<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:mods="http://www.loc.gov/mods-v3"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <!-- Configure the transformation with dummy.xml as source and nothing selected in the output tab.
            The path of files to be combined changes with each batch.
                In Windows, use this: file:///c:/Users/
                In OSX, use this: /Users/          
        -->       
        <xsl:result-document href="combine_proquest_2014_Fa.xml">    
        <xml>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Adams_fsu_0071E_12230_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/AlAni_fsu_0071E_12255_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Albers_fsu_0071E_12278_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Alemanne_fsu_0071E_12229_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/AlvarezAlvarado_fsu_0071N_12313_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Aponte_fsu_0071N_12337_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Arakelian_fsu_0071E_12254_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Avery_fsu_0071N_12336_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Balcer_fsu_0071N_12342_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Bamford_fsu_0071E_12227_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Banks_fsu_0071E_12253_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Bassetti_fsu_0071E_12205_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Behr_fsu_0071E_12240_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Bell_fsu_0071N_12323_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Benoit_fsu_0071N_12316_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Bergstrom_fsu_0071N_12321_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Billings_fsu_0071E_12300_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Blankenship_fsu_0071E_12238_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Boche_fsu_0071E_12214_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Boehner_fsu_0071N_12267_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Bonds_fsu_0071E_12354_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Bowler_fsu_0071E_12248_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Brantley_fsu_0071E_12314_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Brinkerhoff_fsu_0071E_12181_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Britton_fsu_0071E_12216_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Brock_fsu_0071E_12215_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Cabrera_fsu_0071E_12273_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Cao_fsu_0071E_12187_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Cengelcik_fsu_0071N_12333_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Chakraborty_fsu_0071E_12294_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Chen_fsu_0071E_12188_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Chen_fsu_0071E_12276_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Cheung_fsu_0071N_12303_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Christian_fsu_0071E_12209_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Collins_fsu_0071E_12243_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Comellas_fsu_0071N_12298_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Coulter_fsu_0071N_12329_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Coveleski_fsu_0071E_12160_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Craig_fsu_0071E_12237_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Dai_fsu_0071E_12284_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Davis_fsu_0071E_12239_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Dobersek_fsu_0071E_12191_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Duncan_fsu_0071E_12211_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Edmonds_fsu_0071E_11730_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Enlow_fsu_0071E_12189_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Evans_fsu_0071N_12325_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Farmer_fsu_0071E_12250_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Fernandez_fsu_0071E_12179_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Frausto_fsu_0071E_12183_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Gepner_fsu_0071E_12252_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Glazer_fsu_0071N_12308_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Gold_fsu_0071E_12234_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Gough_fsu_0071E_12192_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Grant_fsu_0071E_12206_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Grass_fsu_0071E_11832_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Grinath_fsu_0071E_12231_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/HAN_fsu_0071E_12150_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Hariri_fsu_0071E_12264_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Henning_fsu_0071E_12164_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Hiatt_fsu_0071N_12185_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Higgs_fsu_0071N_12324_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Huard_fsu_0071E_12204_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Hurst_fsu_0071N_11586_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Hussein_fsu_0071N_12338_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Jakiel_fsu_0071N_12305_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Jaroszynski_fsu_0071E_12196_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Ji_fsu_0071N_12266_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Johnson_fsu_0071N_12339_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kachouee_fsu_0071E_12297_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kang_fsu_0071E_12174_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kent_fsu_0071E_12265_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kim_fsu_0071E_12195_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kim_fsu_0071E_12242_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kim_fsu_0071E_12247_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kiswandhi_fsu_0071E_12296_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kothur_fsu_0071N_12226_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Kwapich_fsu_0071E_12184_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/LaCosse_fsu_0071N_12327_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Lee_fsu_0071E_12299_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Leonard_fsu_0071E_12178_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Leonard_fsu_0071E_12201_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Lindahl_fsu_0071N_12315_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Loney_fsu_0071E_12218_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Longo_fsu_0071E_12292_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Lovich_fsu_0071E_12281_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Lundberg_fsu_0071N_12154_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Martin_fsu_0071E_12200_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Martinez_fsu_0071E_12295_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/McAllister_fsu_0071E_12203_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/McLeod_fsu_0071E_12219_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Meng_fsu_0071E_11990_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Mink_fsu_0071E_12217_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Moffitt_fsu_0071E_12228_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/MoonJr_fsu_0071E_11833_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Na_fsu_0071N_12319_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Nguyen_fsu_0071N_12220_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Odria_fsu_0071E_12223_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Ouma_fsu_0071E_12208_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Park_fsu_0071E_12222_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/ParuthyvalappilAlduse_fsu_0071E_12260_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Patel_fsu_0071N_11715_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Peliska_fsu_0071E_12282_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Peterson_fsu_0071E_12244_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Peterson_fsu_0071N_12148_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Petren_fsu_0071E_12175_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Phan_fsu_0071E_12269_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Prempas_fsu_0071E_12270_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Qin_fsu_0071E_12194_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Ren_fsu_0071N_12224_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Rivard_fsu_0071N_12037_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Ro_fsu_0071E_12202_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Robison_fsu_0071E_12268_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Rogers_fsu_0071N_12311_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Ruggiero_fsu_0071E_12212_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Sakharova_fsu_0071N_12357_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Salmani_fsu_0071E_12182_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Sebeny_fsu_0071N_12332_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Sejas_fsu_0071E_12277_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Sengul_fsu_0071E_12236_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Simmons_fsu_0071E_12190_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Smith_fsu_0071N_12335_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Smithyman_fsu_0071E_12291_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Snead_fsu_0071E_12104_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Speransky_fsu_0071N_12310_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Stegall_fsu_0071E_12245_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Strickland_fsu_0071N_12163_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Strickland_fsu_0071N_12330_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Sun_fsu_0071N_12235_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Szewczyk_fsu_0071E_12258_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Szymanski_fsu_0071E_12176_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Taligoski_fsu_0071N_12344_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Tani_fsu_0071E_12289_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Taylor_fsu_0071E_12138_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Terrill_fsu_0071N_12246_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Toole_fsu_0071E_12275_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Vera_fsu_0071E_12262_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Ware_fsu_0071E_12180_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Wei_fsu_0071E_12193_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Willett_fsu_0071E_12256_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Wu_fsu_0071E_12251_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Wu_fsu_0071N_12210_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Xu_fsu_0071N_12166_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Yan_fsu_0071N_12328_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Yan_fsu_0071N_12348_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Yang_fsu_0071E_12279_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Youm_fsu_0071E_12271_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Zhang_fsu_0071E_12259_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Zhang_fsu_0071E_12288_DATA.xml')"/>
            <xsl:copy-of select="document('file:///g:/CS/TechResources/Complex Cataloging/ETDs/2014_Fall/DATA/Zorn_fsu_0071E_11988_DATA.xml')"/>
            </xml>
    </xsl:template>
        </collection>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>
