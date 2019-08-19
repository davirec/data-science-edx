library(tidyverse)
library(rvest)
library(httr)

#alterado 15/07/2019 

url <- paste0("https://en.wikipedia.org/w/index.php?title=",
              "Gun_violence_in_the_United_States_by_state&oldid=843135608")
h <- read_html(url)


class(h)



tab <- h %>% html_nodes("table")


tab <- tab[[3]] %>% html_table
class(tab)


tab <- tab %>% setNames(c("state", "population", "total", "murder_rate"))
head(tab)

##################################################################################################################
#fundamentos
url2 <-paste0("http://www.fundamentus.com.br/detalhes.php?papel=","WEGE3")
h2 <- read_html(url2)

# encoding = ""
#read_xml(x, encoding = "", ..., as_html = FALSE, options = "NOBLANKS")

tab2 <- h2 %>% html_nodes("table")


tab1_html <- tab2[[1]] %>% html_table
tab2_html <- tab2[[2]] %>% html_table
tab3_html <- tab2[[3]] %>% html_table
tab4_html <- tab2[[4]] %>% html_table
tab5_html <- tab2[[5]] %>% html_table

#retirar a primeira linha

tab3_html <-tab3_html %>% slice(2:n())

#or
#tab3_html <-tab3_html[-1,]


#retira os caracteres ? 

tab3_html[3]<-str_replace_all(tab3_html$X3, "\\?", "")
tab3_html[5]<-str_replace_all(tab3_html$X5, "\\?", "")


# tab3_html[3]<-str_replace_all(tab3_html$X3, "\\?", "")
# tab3_html[3]<-str_replace_all(tab3_html$X3, "\\?", "")

tab3_html

tab3_html$X1 + tab3_html$X2

f <- tab3_html$X2
######################################################################################

# url2x <-paste0("http://www.fundamentus.com.br/detalhes.php?papel=",test)



#fundamentos3
url3 <-paste0("http://www.fundamentus.com.br/","resultado.php")

#teste

 uastring <- "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
 session <- html_session(url3, user_agent(uastring))

# uastring <- "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36"
# 
# h3 <- read_html(url3, user_agent(uastring))

#fim teste



 h3 <- read_html(url3)
tab3 <- h3 %>% html_nodes("table")


tab2_html <- tab3[[1]] %>% html_table

  tab2_html6<-tab2_html[tab2_html$Liq.2meses!="0,00",]


write.csv2(tab2_html, "tab2_html.csv", row.names = FALSE)






test <- c("GBIO33", "STBP3", "TESA3", "CCPR3", "MSPA3", "KLBN3", "KLBN11", "KLBN4", "EUCA3", "BAHI3", "ITEC3", "TOYB3", "PFRM3", 
          "BTOW3", "DIRR3", "TOYB4", "ELPL3", "EUCA4", "POSI3", "BRPR3", "SUZB3", "EVEN3", "MILS3", "VVAR3", "LPSB3", "EMBR3", 
          "LOGN3", "RDNI3", "SHOW3", "SEDU3", "BTTL3", "MAPT4", "GOLL4", "RCSL4", "BIOM3", "ADHM3", "GPIV33", "FJTA3", "FJTA4", 
          "BRFS3", "AHEB3", "AHEB5", "IDVL4", "IDVL3", "BBRK3", "HBOR3", "CRDE3", "PMAM3", "PINE4", "BEEF3", "TCSA3", "BSEV3", 
          "MGEL4", "FRTA3", "TCNO3", "TCNO4", "OIBR4", "DMMO3", "OIBR3", "NUTR3", "NORD3", "HBTS5", "APER3", "GFSA3", "CTKA3", 
          "CTKA4", "TPIS3", "MNPR3", "INEP4", "INEP3", "JFEN3", "VIVR3", "IGBR3", "ETER3", "ESTR4", "HOOT4", "RNEW3", "RNEW11", 
          "RNEW4", "AZEV3", "LIQO3", "PLAS3", "LUPA3", "MWET4", "BDLL4", "GSHP3", "AZEV4", "RSID3", "FHER3", "MMXM3", "SLED3", 
          "SLED4", "SNSY5", "PDGR3", "MEND6", "MEND5", "OSXB3", "TEKA4", "BBSE3", "CNTO3", "CSAB3", "CSAB4", "HETA4", "IRBR3", 
          "RPAD3", "RPAD5", "RPAD6", "SPRI3", "SPRI5", "SPRI6", "TELB3", "TELB4", "BPHA3", "TRPN3", "JBDU4", "JBDU3", "BOBR4", 
          "CTNM4", "CTNM3", "RPMG3", "CEDO3", "CEDO4", "SGPS3", "MRFG3", "ECPR3", "TXRX4", "CTSA3", "ELET3", "RSUL4", "ELET6", 
          "TXRX3", "IDNT3", "CTSA4", "HAGA4", "MERC4", "BNBR3", "AGRO3", "ATOM3", "CEBR6", "CEBR3", "ROMI3", "BAZA3", "CRPG5", 
          "CRPG6", "ELEK4", "PATI3", "BRGE12", "CRPG3", "BRGE8", "CSNA3", "CIEL3", "GUAR3", "ELEK3", "CEBR5", "FESA4", "EALT4", 
          "SOND5", "BMEB3", "SOND6", "BRGE7", "CGAS5", "EMAE4", "BRGE3", "BGIP3", "BMEB4", "JHSF3", "CGAS3", "SMLS3", "ENEV3", 
          "PTNT4", "TRPL4", "CPLE3", "SAPR4", "VIVT3", "UNIP6", "PATI4", "CPLE6", "CAML3", "BEES3", "BEES4", "BGIP4", "UNIP3", 
          "UNIP5", "EKTR4", "GOAU4", "BRSR3", "GOAU3", "ENBR3", "HAGA3", "FESA3", "BRDT3", "BAUH4", "TRPL3", "SAPR11", "CAMB4", 
          "BRSR6", "BRSR5", "CGRA4", "WIZS3", "TAEE4", "BRAP3", "CGRA3", "GGBR3", "VIVT4", "JOPA4", "CARD3", "MTSA4", "EALT3", 
          "TAEE11", "TECN3", "DOHL4", "ABCB4", "SHUL4", "TUPY3", "BRAP4", "BRGE11", "LUXM4", "BRKM5", "BRKM3", "SLCE3", "JOPA3", 
          "TAEE3", "CEEB3", "ALUP4", "ALUP3", "ALUP11", "CRIV4", "CLSC4", "BRIV3", "CMIG4", "CEPE6", "CEEB5", "BBAS3", "EEEL3", 
          "CRIV3", "GGBR4", "CSRN6", "LEVE3", "WLMM3", "NAFG4", "ENAT3", "SBSP3", "CSRN5", "ITSA4", "ITSA3", "SAPR3", "TIMP3", 
          "CEPE5", "BRIV4", "LLIS3", "TEND3", "MYPK3", "MRVE3", "VULC3", "NEOE3", "NEOE3", "CSRN3", "VLID3", "PTBL3", "BRML3", 
          "AFLT3", "COCE3", "PSSA3", "SANB4", "PEAB4", "TRIS3", "ITUB3", "CMIG3", "EEEL4", "SANB11", "SSBR3", "ENMT3", "ENMT4", 
          "BSLI3", "BBDC3", "SANB3", "ENGI4", "MTIG4", "PEAB3", "BRGE6", "PNVL4", "CSMG3", "ESTC3", "GPCP3", "GRND3", "GEPA3", 
          "SULA3", "BBDC4", "ENGI11", "EGIE3", "ITUB4", "BSLI4", "PETR4", "WLMM4", "HYPE3", "TIET4", "GEPA4", "PTNT3", "CPFE3", 
          "COCE5", "TIET11", "SULA11", "QUAL3", "TGMA3", "PRIO3", "SEER3", "LIGT3", "KROT3", "PETR3", "UGPA3", "SULA4", "TIET3", 
          "POMO3", "SMTO3", "USIM6", "EQTL3", "USIM5", "VALE3", "HGTX3", "PCAR3", "WSON33", "JSLG3", "PCAR4", "RAPT3", "ECOR3", 
          "POMO4", "DTEX3", "MDIA3", "CELP7", "USIM3", "KEPL3", "ENGI3", "WHRL4", "CBEE3", "DTCY3", "FLRY3", "WHRL3", "PARD3", 
          "RAPT4", "FRAS3", "AMAR3", "PNVL3", "MOVI3", "CRFB3", "JPSA3", "ABEV3", "BMIN3", "CVCB3", "CSAN3", "CELP5", "BMIN4", 
          "LCAM3", "REDE3", "BMKS3", "ODPV3", "MNDL3", "BPAC11", "ARZZ3", "IGTA3", "MOAR3", "OFSA3", "LREN3", "LOGG3", "B3SA3", 
          "WEGE3", "HAPV3", "MULT3", "BPAC5", "BPAC3", "UCAS3", "AALR3", "ALSC3", "BKBR3", "BALM4", "FRIO3", "CCRO3", "ALPA3", 
          "BPAN4", "RENT3", "NATU3", "ALPA4", "LIPR3", "AZUL4", "DASA3", "EZTC3", "RADL3", "GNDI3", "CESP3", "CEGR3", "CESP5", 
          "TKNO4", "CESP6", "LAME3", "MGLU3", "CPRE3", "RLOG3", "LAME4", "RAIL3", "CCXC3", "LINX3", "OMGE3", "JBSS3", "BIDI4", 
          "RANI4", "MEAL3", "RANI3", "SQIA3", "TOTS3", "SCAR3", "CYRE3", "ANIM3")





 



s <- "?"
s <- "ele esta bem mas tambem esta triste"
stringr::str_replace_all(s, "\\?", "g")


str_replace_all(tab3_html$X5, "\\?", "")
