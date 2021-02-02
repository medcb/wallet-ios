import Foundation

class CoinInfoMap {

    static let data: [String: CoinInfo] = [
        "BTC":      CoinInfo(supply: 21_000_000,      startDate: "03/01/2009", website: "https://bitcoin.org/en"),
        "LTC":      CoinInfo(supply: 84_000_000,      startDate: "13/10/2011", website: "https://litecoin.com"),
        "ETH":      CoinInfo(supply: nil,             startDate: "30/07/2015", website: "https://www.ethereum.org"),
        "BCH":      CoinInfo(supply: 21_000_000,      startDate: "01/08/2017", website: "https://www.bitcoincash.org"),
        "DASH":     CoinInfo(supply: 18_900_000,      startDate: "18/01/2014", website: "https://dash.org"),
        "BNB":      CoinInfo(supply: 187_536_713,     startDate: "27/06/2017", website: "https://www.binance.com"),
        "ZRX":      CoinInfo(supply: 1_000_000_000,   startDate: "15/08/2017", website: "https://www.0xproject.com/#home"),
        "LEND":     CoinInfo(supply: 1_299_999_942,   startDate: "15/08/2017", website: "https://aave.com"),
        "AAVE":     CoinInfo(supply: 16_000_000,      startDate: "02/10/2020", website: "https://aave.com"),
        "AAVEDAI":  CoinInfo(supply: nil,             startDate: "08/01/2020", website: "https://aave.com"),
        "ELF":      CoinInfo(supply: 880_000_000,     startDate: "18/12/2017", website: "https://aelf.io"),
        "AKRO":     CoinInfo(supply: 4_000_000_000,   startDate: "06/07/2019", website: "https://akropolis.io"),
        "AMON":     CoinInfo(supply: 1_666_666_667,   startDate: "13/04/2018", website: "https://amon.tech/"),
        "AMPL":     CoinInfo(supply: 780_675_794,     startDate: "14/06/2019", website: "https://www.ampleforth.org"),
        "ANKR":     CoinInfo(supply: 10_000_000_000,  startDate: "21/02/2019", website: "https://www.ankr.com"),
        "ANT":      CoinInfo(supply: 39_609_524,      startDate: "05/05/2017", website: "https://aragon.one"),
        "ANJ":      CoinInfo(supply: 128_645_461,     startDate: "07/01/2020", website: "https://anj.aragon.org"),
        "AST":      CoinInfo(supply: 500_000_000,     startDate: "07/01/2020", website: "https://www.airswap.io"),
        "BAND":     CoinInfo(supply: 100_000_000,     startDate: "09/09/2019", website: "https://bandprotocol.com"),
        "BAL":      CoinInfo(supply: 35_725_000,      startDate: "20/06/2020", website: "https://balancer.finance"),
        "BLT":      CoinInfo(supply: 150_000_000,     startDate: "10/11/2017", website: "https://bloom.co"),
        "BNT":      CoinInfo(supply: nil,             startDate: "13/02/2017", website: "https://bancor.network"),
        "BAT":      CoinInfo(supply: 1_500_000_000,   startDate: "31/05/2017", website: "https://basicattentiontoken.org"),
        "BUSD":     CoinInfo(supply: 28_603_822,      startDate: "10/09/2019", website: "https://www.paxos.com/busd"),
        "BTCB":     CoinInfo(supply: 9_001,           startDate: "17/06/2019", website: "https://bitcoin.org/en/"),
        "BZRX":     CoinInfo(supply: 1_030_000_000,   startDate: "04/02/2019", website: "https://bzx.network"),
        "CAS":      CoinInfo(supply: 1_000_000_000,   startDate: "12/10/2017", website: "https://cashaa.com"),
        "CDAI":     CoinInfo(supply: 2_025_596_474,   startDate: "07/05/2019", website: "https://compound.finance"),
        "CEL":      CoinInfo(supply: 695_658_161,     startDate: "11/04/2018", website: "https://celsius.network"),
        "CELR":     CoinInfo(supply: 10_000_000_000,  startDate: nil,          website: "https://www.celer.network"),
        "LINK":     CoinInfo(supply: 1_000_000_000,   startDate: "19/09/2017", website: "https://link.smartcontract.com"),
        "CSAI":     CoinInfo(supply: 17_342_084,      startDate: "07/05/2019", website: "https://compound.finance/"),
        "CVC":      CoinInfo(supply: 1_000_000_000,   startDate: "21/06/2017", website: "https://www.civic.com"),
        "CRPT":     CoinInfo(supply: 99_785_291,      startDate: "28/09/2017", website: "https://crypterium.io"),
        "CUSDC":    CoinInfo(supply: 9_803_299_805,   startDate: "07/05/2019", website: "https://compound.finance"),
        "CRV":      CoinInfo(supply: 1_356_236_799,   startDate: "13/08/2020", website: "https://www.curve.fi/"),
        "DIA":      CoinInfo(supply: 200_000_000,     startDate: "27/11/2019", website: "https://diadata.org/"),
        "DOS":      CoinInfo(supply: 949_292_114,     startDate: "11/03/2019", website: "https://dos.network/"),
        "DIP":      CoinInfo(supply: 1_000_000_000,   startDate: "31/05/2018", website: "https://www.etherisc.com/"),
        "MCO":      CoinInfo(supply: 31_587_682,      startDate: "18/05/2017", website: "https://crypto.com/en/index.html"),
        "CRO":      CoinInfo(supply: 100_000_000_000, startDate: "14/11/2019", website: "https://www.crypto.com/en/chain"),
        "DAI":      CoinInfo(supply: 127_759_558,     startDate: "18/11/2019", website: "https://makerdao.com/en/"),
        "MANA":     CoinInfo(supply: 2_644_403_343,   startDate: "08/08/2017", website: "https://decentraland.org"),
        "DGD":      CoinInfo(supply: 2_000_000,       startDate: "28/04/2016", website: "https://www.dgx.io"),
        "DGX":      CoinInfo(supply: 120_600,         startDate: "29/03/2018", website: "https://digix.global/dgx#/"),
        "DNT":      CoinInfo(supply: 1_000_000_000,   startDate: "08/08/2017", website: "https://district0x.io"),
        "ENJ":      CoinInfo(supply: 1_000_000_000,   startDate: "24/07/2017", website: "https://enjincoin.io"),
        "FUN":      CoinInfo(supply: 10_999_873_621,  startDate: "23/06/2017", website: "https://www.funfair.io"),
        "FOAM":     CoinInfo(supply: 1_000_000_000,   startDate: "10/10/2017", website: "https://foam.space"),
        "GEN":      CoinInfo(supply: 60_000_000,      startDate: "01/05/2018", website: "https://daostack.io"),
        "GNO":      CoinInfo(supply: 10_000_000,      startDate: "25/04/2017", website: "https://gnosis.io/"),
        "GST2":     CoinInfo(supply: nil,             startDate: nil,          website: "https://gastoken.io"),
        "GUSD":     CoinInfo(supply: nil,             startDate: "09/09/2018", website: "https://gemini.com/dollar"),
        "GTO":      CoinInfo(supply: 1_000_000_000,   startDate: "14/12/2017", website: "https://gifto.io"),
        "GLM":      CoinInfo(supply: nil,             startDate: "17/11/2016", website: "https://golem.network"),
        "GRID":     CoinInfo(supply: 300_000_000 ,    startDate: "12/07/2017", website: "https://gridplus.io"),
        "HEDG":     CoinInfo(supply: 1_000_000_000,   startDate: "07/12/2018", website: "https://hedgetrade.com"),
        "HOT":      CoinInfo(supply: 177_619_433_541, startDate: "16/01/2018", website: "https://thehydrofoundation.com"),
        "HUSD":     CoinInfo(supply: nil,             startDate: "29/11/2018", website: "https://www.stcoins.com"),
        "HT":       CoinInfo(supply: 500_000_000,     startDate: "22/01/2018", website: "https://www.huobi.pro"),
        "IDEX":     CoinInfo(supply: 1_000_000_000,   startDate: "28/09/2017", website: "https://auroradao.com"),
        "IOTX":     CoinInfo(supply: 10_000_000_000,  startDate: "21/05/2018", website: "https://iotex.io/"),
        "KCS":      CoinInfo(supply: 176_863_551,     startDate: "15/09/2017", website: "https://www.kucoin.com/#"),
        "KEY":      CoinInfo(supply: 5_999_999_954 ,  startDate: "11/01/2018", website: "https://selfkey.org/"),
        "KNC":      CoinInfo(supply: 210_590_429,     startDate: "20/09/2017", website: "https://kyber.network"),
        "LOOM":     CoinInfo(supply: 1_000_000_000,   startDate: "03/03/2018", website: "https://loomx.io"),
        "LQD":      CoinInfo(supply: 100_000_000,     startDate: "01/11/2015", website: "https://liquidity.network"),
        "LPT":      CoinInfo(supply: 22_537_813,      startDate: "08/11/2018", website: "https://livepeer.org"),
        "LRC":      CoinInfo(supply: 1_374_513_897,   startDate: "06/08/2017", website: "https://loopring.org/#/"),
        "MET":      CoinInfo(supply: 12_488_971,      startDate: "23/05/2018", website: "https://www.metronome.io"),
        "MLN":      CoinInfo(supply: 1_524_032,       startDate: "26/01/2018", website: "https://melonprotocol.com"),
        "MATIC":    CoinInfo(supply: 10_000_000_000,  startDate: "26/03/2018", website: "https://matic.network"),
        "MKR":      CoinInfo(supply: 1_000_000,       startDate: "15/08/2015", website: nil),
        "MTA":      CoinInfo(supply: 100_000_000,     startDate: "13/07/2020", website: "https://mstable.org"),
        "MUSD":     CoinInfo(supply: 100_000_000,     startDate: "05/01/2018", website: "https://mstable.org"),
        "TKN":      CoinInfo(supply: 39_406_760,      startDate: "25/04/2017", website: "https://monolith.xyz"),
        "NEXO":     CoinInfo(supply: 1_000_000_000,   startDate: "29/04/2018", website: "https://nexo.io"),
        "NMR":      CoinInfo(supply: 11_000_000,      startDate: "21/06/2017", website: "https://erasure.world"),
        "OCEAN":    CoinInfo(supply: 613_099_141,     startDate: "23/04/2019", website: "https://oceanprotocol.com"),
        "OMG":      CoinInfo(supply:  nil,            startDate: "23/06/2017", website: "https://omg.network"),
        "ORBS":     CoinInfo(supply: 10_000_000_000,  startDate: "14/03/2018", website: "https://www.orbs.com"),
        "OXT":      CoinInfo(supply: 10_000_000_000,  startDate: "03/12/2019", website: "https://www.orchid.com"),
        "PAR":      CoinInfo(supply: 999_628_334,     startDate: nil,          website: "https://www.parachutetoken.com"),
        "PAX":      CoinInfo(supply: 249_952_065,     startDate: "10/09/2018", website: "https://www.paxos.com/pax"),
        "PNK":      CoinInfo(supply: 764_626_704,     startDate: "15/03/2018", website: "https://kleros.io"),
        "POA":      CoinInfo(supply: nil,             startDate: nil,          website: "https://poa.net"),
        "POLY":     CoinInfo(supply: 1_000_000_000,   startDate: "25/12/2017", website: "https://www.polymath.network"),
        "PPT":      CoinInfo(supply: 53_252_246,      startDate: "12/04/2017", website: "https://populous.world"),
        "NPXS":     CoinInfo(supply: 259_810_708_833, startDate: "27/09/2017", website: "https://pundix.com"),
        "QNT":      CoinInfo(supply: 14_612_493,      startDate: "25/06/2018", website: "https://www.quant.network/"),
        "QSP":      CoinInfo(supply: 976_442_388,     startDate: "17/11/2017", website: "https://quantstamp.com/"),
        "RARI":     CoinInfo(supply: 25_000_000,      startDate: "15/07/2020", website: "https://rarible.com/"),
        "RDN":      CoinInfo(supply: 100_000_000,     startDate: nil,          website: "https://raiden.network"),
        "REP":      CoinInfo(supply: nil,             startDate: "17/11/2014", website: "https://www.augur.net"),
        "REN":      CoinInfo(supply: 999_999_633,     startDate: "31/12/2017", website: "https://renproject.io"),
        "RENBTC":   CoinInfo(supply: nil,             startDate: nil,          website: "https://renproject.io"),
        "RENBCH":   CoinInfo(supply: nil,             startDate: nil,          website: "https://renproject.io"),
        "RENZEC":   CoinInfo(supply: nil,             startDate: nil,          website: "https://renproject.io"),
        "RING":     CoinInfo(supply: 1_590_567_953,   startDate: "13/09/2018", website: "https://darwinia.network"),
        "REV":      CoinInfo(supply: 1_000_000_000,   startDate: "04/08/2017", website: "https://revain.org"),
        "RLC":      CoinInfo(supply: 86_999_785,      startDate: "10/01/2017", website: "https://iex.ec/"),
        "RPL":      CoinInfo(supply: 17_922_515,      startDate: "07/09/2017", website: "https://www.rocketpool.net"),
        "REPv2":    CoinInfo(supply: nil,             startDate: nil,          website: "https://www.augur.net"),
        "XRP":      CoinInfo(supply: 99_990_932_726,  startDate: "02/02/2013", website: "https://ripple.com/xrp"),
        "SAI":      CoinInfo(supply: nil,             startDate: "18/12/2017", website: "https://makerdao.com/en"),
        "SALT":     CoinInfo(supply: 120_000_000 ,    startDate: "28/07/2017", website: "https://saltlending.com"),
        "SAN":      CoinInfo(supply: 83_337_000 ,     startDate: "09/02/2017", website: "https://santiment.net"),
        "SOCKS":    CoinInfo(supply: 326 ,            startDate: "08/05/2019", website: "https://unisocks.exchange"),
        "SPANK":    CoinInfo(supply: 1_000_000_000 ,  startDate: "31/10/2017", website: "https://spankchain.com"),
        "SNX":      CoinInfo(supply: 190_075_446,     startDate: "07/01/2018", website: "https://www.synthetix.io"),
        "SRM":      CoinInfo(supply: 161_000_001,     startDate: "31/07/2020", website: "https://projectserum.com"),
        "STAKE":    CoinInfo(supply: 8_288_374,       startDate: "31/07/2020", website: "https://xdaichain.com"),
        "Swap":     CoinInfo(supply: 100_000_000,     startDate: "09/07/2020", website: "https://trustswap.org"),
        "TRB":      CoinInfo(supply: 1_622_063,       startDate: "10/09/2019", website: "https://tellor.io"),
        "EURS":     CoinInfo(supply: nil,             startDate: "22/06/2018", website: "https://stasis.net"),
        "SNT":      CoinInfo(supply: 6_804_870_174,   startDate: "20/06/2017", website: "https://status.im"),
        "SXP":      CoinInfo(supply: 289_612_084,     startDate: "16/08/2019", website: "https://swipe.io"),
        "STORJ":    CoinInfo(supply: 424_999_998,     startDate: "19/07/2017", website: "https://storj.io"),
        "CHSB":     CoinInfo(supply: 1_000_000_000,   startDate: "08/09/2017", website: "https://swissborg.com"),
        "USDT":     CoinInfo(supply: 9_479_177_442,   startDate: "10/06/2014", website: "https://tether.to"),
        "TRST":     CoinInfo(supply: 100_000_000,     startDate: "07/12/2016", website: "https://www.wetrust.io"),
        "TCAD":     CoinInfo(supply: nil,             startDate: nil,          website: "https://www.trusttoken.com/truecad"),
        "TGBP":     CoinInfo(supply: nil,             startDate: nil,          website: "https://www.trusttoken.com/truegbp"),
        "THKD":     CoinInfo(supply: nil,             startDate: nil,          website: "https://www.trusttoken.com/truehkd"),
        "TUSD":     CoinInfo(supply: nil,             startDate: "31/03/2018", website: "https://www.trusttoken.com"),
        "TAUD":     CoinInfo(supply: nil,             startDate: nil,          website: "https://www.trusttoken.com/trueaud"),
        "UNI":      CoinInfo(supply: 1_000_000_000,   startDate: nil,          website: "https://uniswap.org"),
        "UMA":      CoinInfo(supply: 101_104_951,     startDate: "09/01/2020", website: "https://umaproject.org"),
        "USDS":     CoinInfo(supply: 90_000_486_303,  startDate: "15/08/2018", website: "https://www.stably.io"),
        "UBT":      CoinInfo(supply: 150_000_000,     startDate: "11/12/2017", website: "https://unibright.io"),
        "USDC":     CoinInfo(supply: nil,             startDate: "17/05/2018", website: "https://www.centre.io/usdc"),
        "WTC":      CoinInfo(supply: 70_000_000,      startDate: "27/08/2017", website: "https://www.waltonchain.org/en"),
        "WBTC":     CoinInfo(supply: 21_000_000,      startDate: "27/11/2018", website: "https://wbtc.network"),
        "WETH":     CoinInfo(supply: 1_153_917,       startDate: "31/12/2018", website: "https://weth.io"),
        "WFIL":     CoinInfo(supply: nil,             startDate: nil,          website: "https://www.wrapped.com"),
        "COMP":     CoinInfo(supply: 10_000_000,      startDate: "04/03/2020", website: "https://compound.finance"),
        "VERI":     CoinInfo(supply: 100_000_000,     startDate: "25/04/2017", website: "https://veritas.veritaseum.com"),
        "XCHF":     CoinInfo(supply: 100_000_000,     startDate: "01/11/2018", website: "https://swisscryptotokens.ch"),
        "XFT":      CoinInfo(supply: 10_000_000,      startDate: nil,          website: "https://offshift.io"),
        "XIO":      CoinInfo(supply: 100_000_000,     startDate: "22/10/2019", website: "https://xio.network"),
        "ZEC":      CoinInfo(supply: 21_000_000,      startDate: "28/10/2016", website: "https://z.cash"),
        "THKDB":    CoinInfo(supply: 90_000_000_000,  startDate: nil,          website: "https://trusttoken.com"),
        "TUSDB":    CoinInfo(supply: 90_000_000_000,  startDate: nil,          website: "https://trusttoken.com"),
        "TAUDB":    CoinInfo(supply: 90_000_000_000,  startDate: nil,          website: "https://trusttoken.com"),
        "RUNE":     CoinInfo(supply: 500_000_000,     startDate: nil,          website: "https://thorchain.org"),
        "MATIC-BEP2":CoinInfo(supply: 10_000_000_000,startDate: nil,          website: nil),
        "ONE":      CoinInfo(supply: 12_600_000_000,  startDate: nil,          website: "https://harmony.one"),
        "IRIS":     CoinInfo(supply: 2_000_000_000,   startDate: nil,          website: "https://www.irisnet.org"),
        "ETH-BEP2": CoinInfo(supply: 215_000,         startDate: nil,          website: nil),
        "CHZ":      CoinInfo(supply: 8_888_888_888,   startDate: nil,          website: "https://www.chiliz.com"),
        "SHR":      CoinInfo(supply: 4_396_000_000,   startDate: nil,          website: "https://sharering.network"),
        "WICC":     CoinInfo(supply: 210_000_000,     startDate: nil,          website: "https://www.waykichain.com"),
        "WRX":      CoinInfo(supply: 995_833_334,     startDate: nil,          website: "https://wazirx.com"),
        "COS":      CoinInfo(supply: 9_400_000_000,   startDate: nil,          website: "https://www.contentos.io"),
        "LTO":      CoinInfo(supply: 500_000_000,     startDate: nil,          website: "https://lto.network"),
        "MTXLT":    CoinInfo(supply: 90_000,          startDate: nil,          website: "https://tixl.me"),
        "GRT":      CoinInfo(supply: 10_000_000_000,  startDate: nil,          website: "https://thegraph.com"),
        "PAN":      CoinInfo(supply: nil,             startDate: nil,          website: "https://panvala.com"),
        "DHT":      CoinInfo(supply: 100_000_000,     startDate: nil,          website: "https://www.dhedge.org/"),
        "SUSD":     CoinInfo(supply: 22_510_653,      startDate: nil,          website: "https://www.synthetix.io"),
        "BID":      CoinInfo(supply: 4_000_000_000,   startDate: nil,          website: "https://bidaochain.com"),
        "XOR":      CoinInfo(supply: 350_000,         startDate: nil,          website: "https://sora.org"),
        "UTK":      CoinInfo(supply: 500_000_000,     startDate: nil,          website: "https://utrust.com"),
        "CHAI":     CoinInfo(supply: nil,             startDate: nil,          website: nil),
        "sETH":     CoinInfo(supply: 29_935,          startDate: nil,          website: "https://www.synthetix.io"),
        "sXAU":     CoinInfo(supply: 225.36884553,    startDate: nil,          website: "https://www.synthetix.io"),
        "USDx":     CoinInfo(supply: nil,             startDate: nil,          website: nil),
        "WZEC":     CoinInfo(supply: 9_082,           startDate: nil,          website: "https://www.wrapped.com"),
        "1INCH":    CoinInfo(supply: 1_500_000_000,   startDate: nil,          website: "https://1inch.exchange"),
        "LINA":     CoinInfo(supply: 10_000_000_199,  startDate: "16/09/2020", website: "https://linear.finance"),
        "ORN":      CoinInfo(supply: 100_000_000,     startDate: "13/07/2020", website: "https://orionprotocol.io"),
        "BASE":     CoinInfo(supply: 65_370_936,      startDate: nil,          website: "https://www.baseprotocol.org"),
        "FYZ":      CoinInfo(supply: 50_000_000,      startDate: nil,          website: "https://www.fyooz.io"),
        "RFI":      CoinInfo(supply: 10_000_000,      startDate: nil,          website: "https://reflect.finance"),
        "FLASH":    CoinInfo(supply: 900_000_000,     startDate: nil,          website: "https://flashstake.io"),
        "POLS":     CoinInfo(supply: 100_000_000,     startDate: nil,          website: "https://www.polkastarter.com"),
        "SPDR":     CoinInfo(supply: nil,             startDate: nil,          website: "https://spiderdao.io"),
        "LGCY":     CoinInfo(supply: nil,             startDate: nil,          website: "https://lgcy.network"),
        "KP3R":     CoinInfo(supply: nil,             startDate: nil,          website: "https://keep3r.network"),
        "RFuel":    CoinInfo(supply: nil,             startDate: nil,          website: "https://riodefi.com"),
        "0chain":   CoinInfo(supply: nil,             startDate: nil,          website: "https://0chain.net"),
        "HEGIC":    CoinInfo(supply: nil,             startDate: nil,          website: "https://www.hegic.co"),
        "COVER":    CoinInfo(supply: nil,             startDate: nil,          website: "https://www.coverprotocol.com"),
        "AUC":      CoinInfo(supply: nil,             startDate: nil,          website: "https://auctus.org"),
        "Nsure":    CoinInfo(supply: nil,             startDate: nil,          website: "https://nsure.network"),
        "BOND":     CoinInfo(supply: nil,             startDate: nil,          website: "https://barnbridge.com"),
        "HLAND":    CoinInfo(supply: nil,             startDate: nil,          website: "https://htw.land"),
        "SWFL":     CoinInfo(supply: nil,             startDate: nil,          website: "https://swapfol.io"),
        "WHITE":    CoinInfo(supply: nil,             startDate: nil,          website: "https://www.whiteheart.finance"),
        "DEFO":     CoinInfo(supply: nil,             startDate: nil,          website: "https://defhold.com"),
        "API3":     CoinInfo(supply: nil,             startDate: nil,          website: "https://api3.org"),
        "NEST":     CoinInfo(supply: nil,             startDate: nil,          website: "https://nestprotocol.org"),
        "ORAI":     CoinInfo(supply: 23_037_721,      startDate: nil,          website: "https://orai.io"),
        "FLUX":     CoinInfo(supply: 259_186,         startDate: nil,          website: "https://datamine.network"),
        "PLOT":     CoinInfo(supply: 200_000_000,     startDate: nil,          website: "https://plotx.io"),
        "OCTO":     CoinInfo(supply: 800_000,         startDate: nil,          website: "https://octo.fi"),
        "PICKLE":   CoinInfo(supply: 1_289_763,       startDate: nil,          website: "https://pickle.finance"),
        "YAX":      CoinInfo(supply: 305_540,         startDate: nil,          website: "https://yaxis.io"),
        "ALPHA":    CoinInfo(supply: 1_000_000,       startDate: nil,          website: "https://alphafinance.io"),
        "SWRV":     CoinInfo(supply: 33_000_000,      startDate: nil,          website: "https://swerve.fi"),
        "LON":      CoinInfo(supply:  200_000_000,    startDate: nil,          website: "https://tokenlon.im/lon"),
        "PERP":     CoinInfo(supply: 150_000_000,     startDate: nil,          website: "https://perp.fi"),
        "MCB":      CoinInfo(supply: 150_000_000,     startDate: nil,          website: "https://mcdex.io"),
        "NXM":      CoinInfo(supply: 6_696_774,       startDate: nil,          website: "https://nexusmutual.io"),
        "SWISS":    CoinInfo(supply: 10_000,          startDate: nil,          website: "https://swissfarming.finance"),
        "APY":      CoinInfo(supply: 100_000_000,     startDate: nil,          website: "https://apy.finance"),
        "FARM":     CoinInfo(supply: 471_639,         startDate: nil,          website: "https://harvest.finance"),
        "YFI":      CoinInfo(supply: 30_000,          startDate: nil,          website: "https://yearn.finance"),
        "YFII":     CoinInfo(supply: 39_375,          startDate: nil,          website: "https://dfi.money"),
        "YFIM":     CoinInfo(supply: 60_000,          startDate: nil,          website: nil),
        "FSW":      CoinInfo(supply: 100_000_000,     startDate: nil,          website: "https://falconswap.com"),
        "BONDLY":   CoinInfo(supply: 100_000_000_000, startDate: nil,          website: "https://www.bondly.finance"),
        "USDN":     CoinInfo(supply: 125_679_184,     startDate: nil,          website: "https://neutrino.at"),
        "ALBT":     CoinInfo(supply: 1_000_000_000,   startDate: nil,          website: "https://www.allianceblock.io"),
        "$BASED":   CoinInfo(supply: 100_000,         startDate: nil,          website: "https://based.money"),
        "BAC":      CoinInfo(supply: 50_001,          startDate: nil,          website: "https://basis.cash"),
        "FRAX":     CoinInfo(supply: 130_600_430,     startDate: nil,          website: "https://frax.finance"),
        "SHARE":    CoinInfo(supply: 21_000_000,      startDate: nil,          website: "https://dollarprotocol.com"),
        "BADGER":   CoinInfo(supply: 21_000_000,      startDate: nil,          website: "https://badger.finance"),
        "RSR":      CoinInfo(supply: 100_000_000_000, startDate: nil,          website: "https://reserve.org"),
        "DUSD":     CoinInfo(supply: 16_697_847,      startDate: nil,          website: "https://app.dusd.finance"),
        "KEEP":     CoinInfo(supply: 1_000_000_000,   startDate: nil,          website: "https://keep.network"),
        "CREAM":    CoinInfo(supply: 2_924_547,       startDate: nil,          website: "https://cream.finance"),
        "TRU":      CoinInfo(supply: 1_446_312_655,   startDate: nil,          website: "https://truefi.io"),
        "ESD":      CoinInfo(supply: 443_687_674,     startDate: nil,          website: "https://emptyset.finance"),
        "OGN":      CoinInfo(supply: 1_000_000_000,   startDate: nil,          website: "https://www.originprotocol.com"),
        "DSD":      CoinInfo(supply: 35_331_663,      startDate: nil,          website: "https://dsd.finance/app/#/"),
        "pBTC":     CoinInfo(supply: 21_000_000,      startDate: nil,          website: "https://ptokens.io"),
        "TBTC":     CoinInfo(supply: nil,             startDate: nil,          website: "https://tbtc.network"),
        "imBTC":    CoinInfo(supply: 21_000_000,      startDate: nil,          website: "https://tokenlon.im/imbtc#"),
        "DEUS":     CoinInfo(supply: 1_793_062,       startDate: nil,          website: "https://deus.finance/home"),
        "FOR":      CoinInfo(supply: 1_000_000_000,   startDate: nil,          website: "https://www.theforceprotocol.com"),
        "MFT":      CoinInfo(supply: 10_000_000_000,  startDate: nil,          website: "https://mainframe.com"),
        "CHAIN":    CoinInfo(supply: 500_000_000,     startDate: nil,          website: "https://chaingames.io"),
        "SAND":     CoinInfo(supply: 3_000_000_000,   startDate: nil,          website: "http://www.sandbox.game"),
        "MFT":      CoinInfo(supply: 10_000_000_000,  startDate: nil,          website: "https://mainframe.com"),
        "DDIM":     CoinInfo(supply: 1_500_000,       startDate: nil,          website: "https://duckdao.io"),
        "XRT":      CoinInfo(supply: 9_984_038,       startDate: nil,          website: "https://robonomics.network/en/"),
        "MEME":     CoinInfo(supply: 28_000,          startDate: nil,          website: "https://dontbuymeme.com"),
        "DEGO":     CoinInfo(supply: nil,             startDate: nil,          website: "https://dego.finance"),
        "FNK":      CoinInfo(supply: 100_000_000,     startDate: nil,          website: "https://fnktoken.com"),
        "HH":       CoinInfo(supply: 100_000_000,     startDate: nil,          website: "https://holyheld.com"),
        "Yf-DAI":   CoinInfo(supply: 21_000_000,      startDate: nil,          website: "https://www.yfdai.finance"),
        "ETHYS":    CoinInfo(supply: 500_000,         startDate: nil,          website: "https://ethereumstake.farm"),
        "MPH":      CoinInfo(supply: 304_412,         startDate: nil,          website: "https://88mph.app"),
        "DMG":      CoinInfo(supply: 249_654_286,     startDate: nil,          website: "https://defimoneymarket.com"),
        "SFI":      CoinInfo(supply: 83_284,          startDate: nil,          website: "http://saffron.finance"),
        "DPI":      CoinInfo(supply: nil,             startDate: nil,          website: "https://www.indexcoop.com/dpi"),
        "HEZ":      CoinInfo(supply: 100_000_000,     startDate: nil,          website: "https://hermez.io"),
        "SURF":     CoinInfo(supply: nil,             startDate: nil,          website: "https://surf.finance"),
        "ZAI":      CoinInfo(supply: nil,             startDate: nil,          website: "https://zai.finance"),
        "CORE":     CoinInfo(supply: nil,             startDate: nil,          website: "https://cvault.finance"),
        "ROOT":     CoinInfo(supply: 10_000,          startDate: nil,          website: "https://rootkit.finance"),
        "wANATHA":  CoinInfo(supply: nil,             startDate: nil,          website: "https://anatha.io"),
        "WAVES":    CoinInfo(supply: nil,             startDate: nil,          website: "https://waves.tech"),
        "eXRD":     CoinInfo(supply: 4_410_000_000,   startDate: nil,          website: "https://www.radixdlt.com"),
        "DYP":      CoinInfo(supply: nil,             startDate: nil,          website: "https://dyp.finance"),
        "MIR":      CoinInfo(supply: nil,             startDate: nil,          website: "https://eth.mirror.finance"),
        "LDO":      CoinInfo(supply: 1_000_000_000,   startDate: nil,          website: "https://stake.lido.fi/"),
]

}

struct CoinInfo {
    let supply: Decimal?
    let startDate: String?
    let website: String?
}
