#!usr/bin/perl -w
#to find cis elements in the DNA sequence
print "DNA cis element Tracer, KL University";
print "\nEnter the filename of the sequence:\t";
$tatabox = "TATAAT";
$file=<STDIN>;
$/=undef;								#file input
open(IN,$file) or die ("\n Error opening file name $file\n");					#error report for non-existent file
$origseq=<IN>;								#copy file to string
chomp($origseq);								#remove new line char
$l1=length($origseq);								#determine the length of sequence
print "\nThe length of the DNA sequence is:\t $l1";
%elements=("TATTCT"=>"-10PEHVPSBD",
         	  "GCTTTTGATGACTTCAAACAC"=>"-141NTG13",
        	  "CGTGCAAGCCCAAAGGCCAATCGGCCCAGA" =>"-284MOTIFZMSBE1",
         	  "TGTAAAG"=>"-300CORE",
         	  "TGHAAARK"=>"-300ELEMENT",
         	  "RTGAGTCAT"=>"-300MOTIFZMZEIN",
         	  "ACATAAAATAAAAAAAGGCA"=>"-314MOTIFZMSBE1",
         	  "CACTAAATTGTCAC"=>"14BPATERD1",
         	  "TGAGCTAAGCACATACGTCA"=>"20NTNTNOS",
        	  "TTTATTTACCAAACGGTAACATC"=>"23BPUASNSCYCB1",
        	  "GACGTGTAAAGTAAATTTACAAC"=>"23BPZM27KDAZEIN",
           	  "TCCGCCWCTTGTATTCGTTGCGTTGMA"=>"27BPDRCONSENSUSPS25S",
         	  "CAAACAC"=>"2SSEEDPROTBANAPA"=>,
         	  "AAATAGATAAATAAAAACATT"=>"3AF1BOXPSRBCS3",
        	  "TGTGGTTATATA"=>"5256BOXLELAT5256",
                    "GAAWTTGTGA"=>"5659BOXLELAT5659",
        	  "AACAAAC"=>"AACACOREOSGLUB1",
        	  "CAACAAACTATATC"=>"AACAOSGLUB1",
                    "AAGACGTAG"=>"AAGACGTAGATACL12",
         	  "RTACGTGGCR"=>"ABADESI1",
         	  "GGACGCGTGGC"=>"ABADESI2",
         	  "ATGTACGAAGC"=>"ABAREG2",
         	  "TGTTACGTGCC"=>"ABASEED1",
         	  "GCATCTTTACTTTAGCATC"=>"ABFOS",
         	  "CCTACGTGGCGG"=>"ABRE2HVA1",
         	  "CGCACGTGTC"=>"ABRE2HVA22",
         	  "GCAACGTGTC"=>"ABRE3HVA1",
                    "GCCACGTACA"=>"ABRE3HVA22",
         	  "GTACGTGGCGC"=>"ABRE3OSRAB16",
         	  "CCTACGTGGC"=>"ABREA2HVA1",
         	  "YACGTGGC"=>"ABREATCONSENSUS",
         	  "RYACGTGGYR"=>"ABREATRD22",
         	  "GCCACGTGGG"=>"ABREAZMRAB28",
         	  "CGCCACGTGTCC"=>"ABREBNNAPA",
         	  "TCCACGTCTC"=>"ABREBZMRAB28",
         	  "TGCCACCGG"=>"ABRECE1HVA22",
         	  "ACGCGTGTCCTC"=>"ABRECE3HVA1",
         	  "ACGCGCCTCCTC"=>"ABRECE3ZMRAB28",
         	  "GCCACTTGTC"=>"ABREDISTBBNNAPA",
         	  "ACGTG"=>"ABRELATERD1",
         	  "TACGTGTC"=>"ABREMOTIFAOSOSEM",
         	  "GCCGCGTGGC"=>"ABREMOTIFIIIOSRAB16B",
         	  "AGTACGTGGC"=>"ABREMOTIFIOSRAB16B",
         	  "ACGTSSSC"=>"ABREOSRAB21",
         	  "MACGYGB"=>"ABRERATCAL" ,
         	  "GGACACGTGGC"=>"ABRETAEM",
         	  "CCACGTGG"=>"ABREZMRAB28",
         	  "GACACGTAGA"=>"ACEATCHS",
         	  "TACGTA"=>"ACGTABOX",
         	  "ACGTGKC"=>"ACGTABREMOTIFA2OSEM",
         	  "TACGTGTC"=>"ACGTABREMOTIFAOSOSEM",
         	  "ACGT"=>"ACGTATERD1",
         	  "GACGTC"=>"ACGTCBOX",
         	  "GTACGTG"=>"ACGTOSGLUB1",
         	  "GCCACGTGGC"=>"ACGTROOT1",
         	  "ACACACGTCAA"=>"ACGTSEED2",
         	  "GTACGTGGCG"=>"ACGTSEED3",
         	  "AACGTT"=>"ACGTTBOX",
         	  "GTTAGGTTC"=>"ACIIIPVPAL2",
         	  "CCACCAACCCCC"=>"ACIIPVPAL2",
         	  "CCCACCTACC"=>"ACIPVPAL2",
         	  "TTDCCWWWWWWGGHAA"=>"AGAMOUSATCONSENSUS",
          	  "TTWCCWWWWNNGGWW"=>"AGATCONSENSUS",
          	  "AGCCGCC"=>"AGCBOXNPGLB",
          	  "NTTDCCWWWWNNGGWAAN"=>"AGL1ATCONSENSUS"=>,
          	  "NNWNCCAWWWWTRGWWAN"=>"AGL2ATCONSENSUS",
          	  "TTWCYAWWWWTRGWAA"=>"AGL3ATCONSENSUS",
          	  "AGATCCAA"=>"AGMOTIFNTMYB2",
          	  "AAAAAGTAAAAAGTAAAAAAGTAAAAAG"=>"AGTACSAO",
          	  "TTACGCAAGCAATGACA"=>"ALF1NTPARC",
          	  "TGAGGAGACTTGTGAGGT"=>"ALF2NTPARB",
          	  "GGWAGGGT"=>"AMMORESIIUDCRNIA1",
          	  "CGAACTT"=>"AMMORESIVDCRNIA1",
          	  "GGCCCCGGG"=>"AMMORESVDCRNIA1",
          	  "TAACARA"=>"AMYBOX1",
          	  "TATCCAT"=>"AMYBOX2",
          	  "AAACAAA"=>"ANAERO1CONSENSUS",
          	  "AGCAGC"=>"ANAERO2CONSENSUS",
          	  "TCATCAC"=>"ANAERO3CONSENSUS",
          	  "GTTTHGCAA"=>"ANAERO4CONSENSUS",
          	  "TTCCCTGTT"=>"ANAERO5CONSENSUS",
          	  "CGAAACCAGCAACGGTCCAG"=>"ANAEROBICCISZMGAPC4",
          	  "RGTGACNNNGC"=>"ARE1",
          	  "AGCAACGGTC"=>"ARECOREZMGAPC4",
          	  "AGTTGAATGGGGGTGCA"=>"ARELIKEGHPGDFR2",
          	  "TGTCTC"=>"ARFAT",
          	  "NGATT"=>"ARR1AT",
          	  "CCACTGACGTAAGGGATGACGCACAATCC"=>"AS1CAMV",
          	  "AAATGACGAAAATGC"=>"AS1LIKECSHPRA",
          	  "TGAGCTAAGCACATACGTCAG"=>"ASF1ATNOS",
          	  "TGACG"=>"ASF1MOTIFCAMV",
          	  "TTACGCAAGCAATGACAT"=>"ASF1NTPARA",
          	  "AATATTTTTATT"=>"AT1BOX",
          	  "CAATWATTG"=>"ATHB1ATCONSENSUS",
          	  "CAATSATTG"=>"ATHB2ATCONSENSUS",
          	  "CAATNATTG"=>"ATHB5ATCORE",
          	  "CAATTATTA"=>"ATHB6COREAT",
          	  "AATATACTAGTATTATTTACTAAAAAAAATC"=>"ATRICHPSPETE",
          	  "KGTCCCAT"=>"AUXREPSIAA4",
          	  "TGACGTAA"=>"AUXRETGA1GMGH3",
          	  "TGACGTGGC"=>"AUXRETGA2GMGH3",
          	  "CTTGTCGTCA"=>"B2GMAUX28",
          	  "GCTAAACAAT"=>"BBOXSITE1STPAT",
          	  "TGTCA"=>"BIHD1OS",
          	  "ATAGAAATCAA"=>"BOX1PSGS2",
          	  "TAAAAGTTAAAAAC"=>"BOX1PVCHS15",
          	  "TCTAAGCAAAG"=>"BOX2PSGS2",
          	  "CTGTGATTAAATAT"=>"BOX2PVCHS15",
          	  "TATTGGTTACTAAA"=>"BOX3PVCHS15",
          	  "AAACGACACCGTTT"=>"BOXBPSAS1",
          	  "TCCCGGTACACACTTCTT"=>"BOXC'PSAS1",
          	  "CTCCCAC"=>"BOXCPSAS1",
          	  "GTCCMTCMAACCTAMC"=>"BOXICHS",
          	  "ATAGAA"=>"BOXIINTPATPB",
          	  "ACGTGGC"=>"BOXIIPCCHS",
          	  "AATTCCATAGAATAGATAATA"=>"BOXINTPATPB",
          	  "ACCWWCC"=>"BOXLCOREDCPAL",
          	  "CAACGTG"=>"BP5OSWX",
          	  "AGCGGG"=>"BS1EGCCR",
          	  "TGAAAACAGTGAGTTA"=>"C1GMAUX28",
          	  "TAACTSAGTTA"=>"C1MOTIFZMBZ2",
          	  "AATAATAATAATAATAAATA"=>"C2GMAUX28",
          	  "CAAT"=>"CAATBOX1",
          	  "GGCCAATCT"=>"CAATBOX2",
          	  "CACGCAAT"=>"CACGCAATGMGH3",
          	  "CACGTG"=>"CACGTGMOTIF",
          	  "YACT"=>"CACTFTPPCA1",
          	  "CNAACAC"=>"CANBNNAPA",
          	  "CAACTC"=>"CAREOSREP1",
          	  "GTTTACATAAATGGAAAA"=>"CARG1ATAP3",
          	  "CTTACCTTTCATGGATTA"=>"CARG2ATAP3",
          	  "CTTTCCATTTTTAGTAAC"=>"CARG3ATAP3",
          	  "CCWWWWWWGG"=>"CARGATCONSENSUS",
          	  "CWWWWWWWWG"=>"CARGCW8GAT",
          	  "CCWWWWWWWWGG"=>"CARGNCAT",
          	  "CATATG"=>"CATATGGMSAUR",
          	  "RYCGAC"=>"CBFHV",
          	  "AAMAATCT"=>"CCA1ATLHCB1",
          	  "CCAAT"=>"CCAATBOX1",
          	  "CCTCGTGTCTC"=>"CCTCGTGTCTCGMGH3",
          	  "CAAAACGC"=>"CDA1ATCAB2",
          	  "AACGCGTGTC"=>"CE3OSOSEM",
          	  "CACGAAAA"=>"CELLCYCLESC",
          	  "TGTTAAAGT"=>"CEREGLUBOX1PSLEGA",
          	  "TGAAAACT"=>"CEREGLUBOX2PSLEGA",
          	  "TGTAAAAGT"=>"CEREGLUBOX3PSLEGA",
          	  "CGACG"=>"CGACGOSAMY3",
          	  "VCGCGB"=>"CGCGBOXAT",
          	  "GATAAAGATTACTTCAGATATAACAAACGTTAC"=>"CGF1ATCAB2",
          	  "CGTGTCGTCCATGCAT"=>"CGTGTSPHZMC1",
          	  "CAANNNNATC"=>"CIACADIANLELHC",
          	  "TGGACGG"=>"CMSRE1IBSPOA",
          	  "ACGTATTAAAA"=>"CONSERVED11NTZMATP1",
          	  "AAKAATWYRTAWATAAAAMTTTTATWTA"=>"COREOS",
          	  "TATTAG"=>"CPBCSPOR",
          	  "CCACGTGGCC"=>"CPRFPCCHS",
          	  "GTCGAC"=>"CRTDREHVCBF2",
          	  "TCTCTCTCT"=>"CTRMCAMV35S",
          	  "GTAC"=>"CURECORECR",
          	  "AAGATTGATTGAG"=>"CYTOSITECSHPRA",
          	  "ACAGTTACTA"=>"D1GMAUX28",
          	  "ATTTATATAAAT"=>"D2GMAUX28",
          	  "TATTTGCTTAA"=>"D3GMAUX28",
          	  "TAGTGCTGT"=>"D4GMAUX28",
          	  "GGATTTTACAGT"=>"DE1PSPRA2",
          	  "AAAG"=>"DOFCOREZM",
          	  "ACACNNG"=>"DPBFCOREDCDC3",
          	  "CCTTTTGTCTC"=>"DR5GMGH3",
          	  "ACCGAGA"=>"DRE1COREZMRAB17",
          	  "ACCGAC"=>"DRE2COREZMRAB17",
          	  "RCCGAC"=>"DRECRTCOREAT",
          	  "TACCGACAT"=>"DREDR1ATRD29AB",
          	  "GCGGGAAA"=>"E2F1OSPCNA",
          	  "TTTCCCGC"=>"E2FANTRNR",
          	  "TYTCCCGCC"=>"E2FAT",
          	  "GCGGCAAA"=>"E2FBNTRNR",
          	  "WTTSSCSS"=>"E2FCONSENSUS",
          	  "CANNTG"=>"EBOXBNNAPA",
          	  "GANTTNC"=>"EECCRCAH1",
          	  "GGATTCAAGGGGCATGTATCTTGAATCC"=>"EIN3ATERF1",
          	  "GATATATTAATATTTTATTTTATA"=>"ELEMENT1GMLBC3",
          	  "CTTAAATTATTTATTT"=>"ELEMENT2GMLBC3",
          	  "CTCCAACAAACCCCTTC"=>"ELRE1PCPAL1",
          	  "ATTCTCACCTACCA"=>"ELRE2PCPAL1",
          	  "TTGACC"=>"ELRECOREPCRP1",
          	  "GGTCANNNAGTC"=>"ELRENTCHN50",
          	  "CACGTGGC"=>"EMBP1TAEM",
          	  "TGTAAAGT"=>"EMHVCHORD",
          	  "TAAGAGCCGCC"=>"EREGCC",
          	  "AWTTCAAA"=>"ERELEE4",
          	  "ACATGTCATCATGT"=>"ESPASGL01",
          	  "AAAATATCT"=>"EVENINGAT",
          	  "ACGTGTC"=>"GADOWNAT",
          	  "GAGAGAGAGAGAGAGA"=>"GAGA8HVBKN3",
          	  "GAGAGAGAGAGAGAGAGA"=>"GAGAGMGSA1",
                 	  "TAACAGA"=>"GARE1OSREP1",
          	  "RTAACARANTCYGG"=>"GARE2",
          	  "TAACGTA"=>"GARE2OSREP1",
          	  "GTAACAGAATGCTGG"=>"GARE4HVEPB1",
          	  "TAACAAR"=>"GAREAT",
          	  "GGCCGATAACAAACTCCGGCC"=>"GAREHVAMY1",
          	  "GATA"=>"GATABOX",
          	  "GCCACGTGCC"=>"GBOX10NT",
          	  "MCACGTGGC"=>"GBOXLERBCS",
          	  "ACCACGTGGC"=>"GBOXPC",
          	  "CTACGTGGCCA"=>"GBOXRELOSAMY3",
          	  "TCCACGTGGT"=>"GBOXSORBCS1",
          	  "GCAACGCAAC"=>"GCAACREPEATZMZEIN",
          	  "GTGGGCCCG"=>"GCBP2ZMGAPC4",
          	  "GCCGCC"=>"GCCCORE",
          	  "TGAGTCA"=>"GCN4OSGLUB1",
          	  "GGTCCCAT"=>"GGTCCCATGMSAUR",
          	  "RTGASTCAT"=>"GLMHVCHORD",
          	  "AACAAACTCTAT"=>"GLUTAACAOS",
          	  "ATATCATGAGTCACTTCA"=>"GLUTEBOX1OSGT2",
          	  "TATCTAGTGAGTCACTTCA"=>"GLUTEBOX1OSGT3",
          	  "TCCGTGTACCA"=>"GLUTEBOX2OSGT2",
          	  "CTTTTGTGTACCTTA"=>"GLUTEBOX2OSGT3",
          	  "AAGCAACACACAAC"=>"GLUTEBP1OS",
          	  "ATGCTCAATAGATATAAGT"=>"GLUTEBP2OS",
          	  "CTTTCGTGTAC"=>"GLUTECOREOS",
          	  "CATTAATTAG"=>"GMHDLGMVSPB",
          	  "CACTGGCCGCCC"=>"GRAZMRAB17",
          	  "CATGCCGCC"=>"GRAZMRAB28",
          	  "TGGCGGCTCTTATCTCACGTGATG"=>"GREGIONNTPRB1B",
          	  "GRWAAW"=>"GT1CONSENSUS",
          	  "GGTTAA"=>"GT1CORE",
          	  "GAAAAA"=>"GT1GMSCAM4",
          	  "KWGTGRWAAWRW"=>"GT1MOTIFPSRBCS",
          	  "GCGGTAATT"=>"GT2OSPHYA",
          	  "GTGA"=>"GTGANTG10",
          	  "CCTACCNNNNNNNCT"=>"HBOXCONSENSUSPVCHS",
          	  "CCTACCNNNNNNNCTNNNNA"=>"HBOXPVCHS15",
          	  "CTAATTGTTTA"=>"HDMOTIFPCPR2",
          	  "TAATMATTA"=>"HDZIP2ATATHB2",
          	  "GTAATSATTAC"=>"HDZIPIIIAT",
          	  "CCGTCG"=>"HEXAMERATH4",
          	  "TGACGTGG"=>"HEXAT",
          	  "ACGTCA"=>"HEXMOTIFTAH3H4",
          	  "CTNGAANNTTCNAG"=>"HSE",
          	  "CNNGAANNNTTCNNG"=>"HSELIKENTACIDICPR1",
          	  "AGGAATTCCT"=>"HSELIKENTGLN2",
          	  "CAAAATTTTGTA"=>"HSRENTHSR203J",
          	  "TGACACGTGGCA"=>"HY5AT",
          	  "GATAAG"=>"IBOX",
          	  "GATAA"=>"IBOXCORE",
             	  "GATAAGR"=>"IBOXCORENT",
          	  "AGATATGATAAAA"=>"IBOXLSCMCUCUMISIN",
          	  "ATCAAGCATGCTTCTTGC"=>"IDE1HVIDS2",
         	  "TTGAACGGCAAGTTTCACGCTGTCACT"=>"IDE2HVIDS2",
            	  "CACGAGSCCKCCAC"=>"IDRSZMFER1",
          	  "YTCANTYY"=>"INRNTPSADB",
          	  "TGCAGG"=>"INTRONLOWER",
          	  "MAGGTAAGT"=>"INTRONUPPER",
          	  "CACGTGG"=>"IRO2OS",
          	  "CGTCAATGAA"=>"JASE1ATOPR1",
          	  "CATACGTCGTCAA"=>"JASE2ATOPR1",
          	  "CTCTTAGACCGCCTTCTTTGAAAG"=>"JERECRSTR",
          	  "TAAATGYA"=>"L1BOXATPDF1",
          	  "ATTCACCTACCC"=>"L1DCPAL1",
          	  "AATCTCCAACCA"=>"L4DCPAL1",
          	  "AAATTAACCAA"=>"LBOXLERBCS",
          	  "CCAATGT"=>"LEAFYATAG",
          	  "TAAAATAT"=>"LECPLEACS2",
          	  "TCCATAGCCATGCAWRCTGMAGAATGTC"=>"LEGUMINBOXLEGA5",
          	  "TGTGTGGTTAATATG"=>"LREBOX2PSRBCS3",
          	  "ACTATTTTCACTATC"=>"LREBOX3PSRBCS3",
          	  "TCCACGTGGC"=>"LREBOXIIPCCHS1",
          	  "AACCTAACCT"=>"LREBOXIPCCHS1",
          	  "ACGTGGCA"=>"LRENPCABE",
           	  "TCTACGTCAC"=>"LS5ATPR1",
          	  "ACGTCATAGA"=>"LS7ATPR1",
          	  "CCGAAA"=>"LTRE1HVBLT49",
          	  "ACCGACA"=>"LTREATLTI78",
          	  "CCGAC"=>"LTRECOREATCOR15",
         	  "AATAAAYAAA"=>"MARABOX1",
          	  "WTTTATRTTTW"=>"MARARS",
          	  "TGTTTWTGNTTTCCGAAANNNNWWW"=>"MARCEN3",
          	  "TTWTWTTWTT"=>"MARTBOX",
          	  "GATACANNAATNTGATG"=>"MEJARELELOX",
          	  "GTGCCCTT"=>"MNF1ZMPPC1",
          	  "TCTAACCTACCA"=>"MREATCHS",
          	  "AATGGAAATG"=>"MRNA3ENDTAH3",
          	  "CUCUUTGUTTUU"=>"MRNASTA1CRPSBD",
          	  "UGAGUUG"=>"MRNASTA2CRPSBD",
          	  "AGACCGTTG"=>"MSACRCYM",
          	  "WAACCA"=>"MYB1AT",
          	  "GTTAGTT"=>"MYB1LEPR",
          	  "GTTAGGTT"=>"MYB26PS",
          	  "TAACTG"=>"MYB2AT",
          	  "YAACKG"=>"MYB2CONSENSUSAT",
          	  "CTAACCA"=>"MYBATRD22",
          	  "CNGTTR"=>"MYBCORE",
          	  "AACGG"=>"MYBCOREATCYCB1",
          	  "TAACAAA"=>"MYBGAHV",
          	  "MACCWAMC"=>"MYBPLANT",
          	  "CCWACC"=>"MYBPZM",
          	  "GGATA"=>"MYBST1",
          	  "CATGTG"=>"MYCATERD1",
          	  "CACATG"=>"MYCATRD22",
          	  "CANNTG"=>"MYCCONSENSUSAT",
          	  "TACACAT"=>"NAPINMOTIFBN",
           	  "CCATATGCCATGTCTCTCAATTGGTCCCAT"=>"NDEGMSAUR",
          	  "AAAGAT"=>"NODCON1GM",
          	  "CTCTT"=>"NODCON2GM",
          	  "AGATCGACG"=>"NONAMERATH4",
          	  "CATCCAACG"=>"NONAMERMOTIFTAH3H4",
          	  "TAGTGGAT"=>"NRRBNEXTA",
          	  "ACTTTA"=>"NTBBF1ARROLB",
          	  "TCCACGTCGA"=>"O2F1BE2S1",
          	  "GCCACCTCAT"=>"O2F2BE2S1",
          	  "TCCACGTACT"=>"O2F3BE2S1",
          	  "ATCTTATGTCATTGATGACGACCTCC"=>"OBF5ATGST6",
          	  "TACACTTTTGG"=>"OBP1ATGST6",
          	  "GATCCGCGNNNNNNNNNNNNNNACCAATCS"=>"OCETYPEIIINTHISTONE",
          	  "TCACGCGGATC"=>"OCETYPEIINTHISTONE",
          	  "CCACGTCANCGATCCGCG"=>"OCETYPEINTHISTONE",
          	  "TGACGYAAGSRMTKACGYMM"=>"OCSELEMENTAT",
          	  "ACGTAAGCGCTTACGT"=>"OCSENHANMOTIFAT",
           	  "CGGTTTACGTAATCTCTTACATCA"=>"OCSGMGH24",
          	  "TGATGTAAGAGATTACGTAA"=>"OCSGMHSP26A",
          	  "CGCGGATC"=>"OCTAMERMOTIFTAH3H4",
          	  "CGCGGCAT"=>"OCTAMOTIF2",
          	  "TCCACGTAGA"=>"OPAQUE2ZM22Z",
          	  "GATGAYRTGG"=>"OPAQUE2ZMB32",
          	  "AAAGAT"=>"OSE1ROOTNODULE",
          	  "CTCTT"=>"OSE2ROOTNODULE",
          	  "GNATATNC"=>"P1BS",
          	  "CCGTCC"=>"PALBOXAPC",
          	  "YCYYACCWACC"=>"PALBOXLPC",
          	  "YTYYMMCMAMCMMC"=>"PALBOXPPC",
          	  "TGACGTCA"=>"PALINDROMICCBOXGM",
          	  "TTACGCAAGCAATGACATCT"=>"PASNTPARA",
          	  "GAAATAGCAAATGTTAAAAATA"=>"PE1ASPHYA3",
          	  "ATTCGCGC"=>"PE2FNTRNR1A",
          	  "CAGCTCCCATGGCTCTCCCATCCGCGCCGGT"=>"PE3ASPHYA3",
          	  "GTGATCAC"=>"PIATGAPB",
          	  "TTGGTTTTGATCAAAACCAA"=>"PIIATGAPB",
          	  "AATAAA"=>"POLASIG1",
          	  "AATTAAA"=>"POLASIG2",
          	  "AATAAT"=>"POLASIG3",
          	  "AGAAA"=>"POLLEN1LELAT52",
          	  "TCCACCATA"=>"POLLEN2LELAT52",
          	  "TAARAGCCGCC"=>"PR2GCNT",
          	  "ACTCAT"=>"PREATPRODH",
          	  "SCGAYNRNNNNNNNNNNNNNNNHD"=>"PRECONSCRHSP70A",
          	  "ACCGGCCCACTT"=>"PREMOTIFNPCABE",
          	  "CACATGTGTAAAGGT"=>"PROLAMINBOX",
          	  "TGCAAAG"=>"PROLAMINBOXOSGLUB1",
          	  "CAAACACC"=>"PROXBBNNAPA",
          	  "TCGGCCACTATTTCTACGGGCAGCCAGACAAA"=>"PSREGIONZMZM13",
          	  "TTTTTTCC"=>"PYRIMIDINEBOXHVEPB1",
          	  "CCTTTT"=>"PYRIMIDINEBOXOSRAMY1A",
          	  "AACGTGT"=>"QARBNEXTA",
          	  "AGGTCA"=>"QELEMENTZMZM13",
          	  "CAACA"=>"RAV1AAT",
          	  "CACCTG"=>"RAV1BAT",
          	  "GTGTGGTTAATATG"=>"RBCSBOX2PS",
          	  "ATCATTTTCACT"=>"RBCSBOX3PS",
          	  "AATCCAA"=>"RBCSCONSENSUS",
          	  "CACATGGCACT"=>"RBCSGBOXPS",
          	  "TCCAACTTGGA"=>"RBENTGA3",
          	  "CATGGGCGCGG"=>"RE1ASPHYA3",
          	  "AACCAA"=>"REALPHALGLHCB21",
          	  "CGGATA"=>"REBETALGLHCB21",
          	  "CGGCGGCCTCGCCACG"=>"REGION1OSOSEM",
          	  "CAGAAGATA"=>"RGATAOS",
          	  "KCACGW"=>"RHERPATEXPA7",
          	  "GATCATCGATC"=>"RNFG1OS",
          	  "CCAGTGTGCCCCTGG"=>"RNFG2OS",
          	  "ATATT"=>"ROOTMOTIFTAPOX1",
          	  "CAACTTTCATAT"=>"RSEPVGRP1",
          	  "CATCCAACTTTCATATCCATGTGCTT"=>"RSEPVGRP18",
          	  "CAAACTCGTATATCCAT"=>"RSRBNEXTA",
          	  "TCCATGCATGCAC"=>"RYREPEAT4",
          	  "CATGCA"=>"RYREPEATBNNAPA",
          	  "CATGCAT"=>"RYREPEATGMGY2",
          	  "CATGCAY"=>"RYREPEATLEGUMINBOX",
          	  "CATGCATG"=>"RYREPEATVFLEB4",
          	  "ATGGTA"=>"S1FBOXSORPS1L21",
          	  "ATGGTATT"=>"S1FSORPL21",
          	  "CCATACATT"=>"S2FSORPL21",
          	  "CTGACGTAAGGGATGACGCAC"=>"SARECAMV",
          	  "CACTAACACAAAGTAA"=>"SB1NPABC1",
          	  "TTATGAACAGTAATT"=>"SB3NPABC1",
          	  "CACCTCCA"=>"SBOXATRBCS",
          	  "ATAATGGGCCACACTGTGGGGCAT"=>"SE1PVGRP18",
          	  "TTNNNGTAGCTAGTGTATTTGTAT"=>"SE2PVGRP1",
          	  "YTGTCWC"=>"SEBFCONSSTPR10A",
          	  "ATATTTAWW"=>"SEF1MOTIF",
          	  "AACCCA"=>"SEF3MOTIFGM",
          	  "RTTTTTR"=>"SEF4MOTIFGM7S",
          	  "TCCACGTGTC"=>"SGBFGMGMAUX28",
          	  "TCATGGTAACAATT"=>"SITE1SORPS1",
          	  "AGTTAGTTAAAAGA"=>"SITE3SORPS1",
          	  "TGGGCCCGT"=>"SITEIIAOSPCNA",
          	  "TGGGCY"=>"SITEIIATCYTC",
          	  "TGGTCCCAC"=>"SITEIIBOSPCNA",
          	  "CCAGGTGG"=>"SITEIOSPCNA",
          	  "GCCAC"=>"SORLIP1AT",
          	  "GGGCC"=>"SORLIP2AT",
          	  "CTCAAGTGA"=>"SORLIP3AT",
          	  "GTATGATGG"=>"SORLIP4AT",
          	  "GAGTGAG"=>"SORLIP5AT",
          	  "ATAAAACGT"=>"SORLREP2AT",
          	  "TGTATATAT"=>"SORLREP3AT",
          	  "CTCCTAATT"=>"SORLREP4AT",
          	  "TTGCATGACT"=>"SORLREP5AT",
          	  "ACTGTGTA"=>"SP8BFIBSP8AIB",
          	  "TACTATT"=>"SP8BFIBSP8BIB",
          	  "TCCATGCAT"=>"SPHCOREZMC1",
          	  "CGTCCATGCAT"=>"SPHZMC1",
          	  "TTATCC"=>"SREATMSD",
          	  "TGGTAGGTGAGAT"=>"SRENTTTO1",
          	  "AATAGAAAA"=>"SURE1STPAT21",
          	  "AATACTAAT"=>"SURE2STPAT21",
          	  "AAAACTAAGAAAGACCGATGGAAAA"=>"SUREAHVISO1",
          	  "GAGAC"=>"SURECOREATSULTR11",
          	  "GTGGWWHG"=>"SV40COREENHAN",
          	  "AACGTG"=>"T/GBOXATPIN2",
          	  "TAAAG"=>"TAAAGSTKST1",
          	  "ACTCTACAGTACTC"=>"TACBBFNTEAS4",
          	  "CTATAAATAC"=>"TATABOX1",
          	  "TATAAAT"=>"TATABOX2",
          	  "TATTAAT"=>"TATABOX3",
          	  "TATATAA"=>"TATABOX4",
          	  "TTATTT"=>"TATABOX5",
          	  "TATTTAA"=>"TATABOXOSPAL",
          	  "TTTATATA"=>"TATAPVTRNALEU",
          	  "TATCCAC"=>"TATCCACHVAL21",
          	  "TATCCA"=>"TATCCAOSAMY",
          	  "TATCCAY"=>"TATCCAYMOTIFOSRAMY3D",
          	  "ACTTTG"=>"TBOXATGAPB",
          	  "TCATCTTCTT"=>"TCA1MOTIF",
          	  "TGACTTTCTGAC"=>"TDBA12NTCHN50",
          	  "ATTCCCGC"=>"TE2F2NTPCNA",
          	  "ACAGGGGCATAATGGTAATTTAAA"=>"TEF1BOXATA1",
          	  "AGGGGCATAATGGTAA"=>"TEFBOXATEEF1AA1",
          	  "AAACCCTAA"=>"TELOBOXATEEF1AA1",
          	  "CGTCATCGAGATGACG"=>"TGA1ANTPR1A",
          	  "TGACGT"=>"TGACGTVMAMY",
          	  "TGTCACA"=>"TGTCACACMCUCUMISIN",
          	  "CTGAAGAAGAA"=>"TL1ATSAR",
          	  "GTNWAYATTNATNNG"=>"TOPOISOM",
          	  "AMNAUGGC"=>"TRANSINITDICOTS",
          	  "RMNAUGGC"=>"TRANSINITMONOCOTS",
          	  "TAAACAATGGCT"=>"TRANSTART",
          	  "GGCCCAWWW"=>"UP1ATMSD",
          	  "AAACCCTA"=>"UP2ATMSD",
          	  "ATTGGTCCACG"=>"UPRE1AT",
          	  "CCACGTCATC"=>"UPRE2AT",
          	  "CCACGTCA"=>"UPRMOTIFIAT",
          	  "CCNNNNNNNNNNNNCCACG"=>"UPRMOTIFIIAT",
          	  "GCGTNNNNNNNACGC"=>"VOZATVPP",
          	  "GCTCCGTTG"=>"VSF1PVGRP18",
          	  "GTACGTGTTATAAAACGTGT"=>"WARBNEXTA",
           	  "TTTGACY"=>"WBBOXPCWRKY1",
          	  "TTGAC"=>"WBOXATNPR1",
          	  "AGTCAAAATTGACC"=>"WBOXGACAD1A",
          	  "TGACT"=>"WBOXHVISO1",
          	  "CTGACY"=>"WBOXNTCHN48",
          	  "TGACY"=>"WBOXNTERF3",
          	  "AAGCGTAAGT"=>"WINPSTPIIIK",
          	  "AAWGTATCSA"=>"WRECSAA01",
          	  "TGAC"=>"WRKY71OS",
          	  "TTAATGG"=>"WUSATAg",
          	  "ACAAAGAA"=>"XYLAT",
          	  "TGTGACATTGAAATTCTTTGACTTTA"=>"YREGIONNTPRB1B",
          	  "ATACGTGT"=>"ZDNAFORMINGATCAB1");
@element=keys(%elements);
$count=0;
$noResult=0;
$tatabox_pos=index($origseq,$tatabox,0);
if($tatabox_pos != -1)
{
    print "\nTata box is found at position:\t\t "; print $tatabox_pos+1; print "\n";
    $start=0;
    if($tatabox_pos>500) {
        $start = $tatabox_pos - 500;
    }
    else {
        $start = 0;
    }
    $seq = substr($origseq,$start,$tatabox_pos-$start);

    foreach $cis(@element)
    {   #loop to check every cis element
        #print"\nTrying for $cis element\n";
        $lastpos = 0;
        $count = 0;
        my @positions = ();
        do {
           $pos=-1;
       
           $pos = index($seq,$cis,$lastpos);
           if($pos != -1)
           {
               #We hit the cis sequence in the seq string
               $lastpos = $pos + 1;
               $count++;
               push(@positions, $pos+$start+1);
               $noResult = 1;
           }
		    } while($pos!=-1);
        if(($#positions + 1)> 0)
        {
            print"\nThe Cis unit $elements{$cis} with sequence: $cis is found $count times at position(s):@positions";
        }
    }
    if($noResult==0)									#condition to check the absence of the cis
    {
        print "\n None of the cis elements were found\n";
    }
}
else
{
print "\n Tata box is not found\n";
}
