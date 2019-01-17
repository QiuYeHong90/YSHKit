//
//  YSHCountryCodeTool.m
//  YSHKit_Example
//
//  Created by shuhui on 2018/12/25.
//  Copyright © 2018 793983383@qq.com. All rights reserved.
//

#import "YSHCountryCodeTool.h"

@implementation YSHCountryCodeTool
static YSHCountryCodeTool *manager = nil;
+ (instancetype)shareCountryCodeTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[YSHCountryCodeTool alloc]init];
    });
    
    return manager;
}

- (NSArray *)countryCodeArray
{
    if (!_countryCodeArray) {
        _countryCodeArray = [[self class] getCodeArray];
    }
    return _countryCodeArray;
}

-(YSHCountryCodeModel *)curretnCountryModel
{
    if (!_curretnCountryModel) {
        [[self class] getCodeArray];
    }
    
    return _curretnCountryModel;
}


+(NSArray *)getCodeArray
{
    //    国家代码 区号
    NSDictionary*rawDialCodeDict=[NSDictionary dictionaryWithObjectsAndKeys:@"93",@"AF",
                                  @"355",@"AL",@"213",@"DZ",@"1684",@"AS",@"376",@"AD",
                                  @"244",@"AO",@"1264",@"AI",@"1268",@"AG",@"54",@"AR",
                                  @"374",@"AM",@"297",@"AW",@"61",@"AU",@"43",@"AT",
                                  @"994",@"AZ",@"1242",@"BS",@"973",@"BH",@"880",@"BD",
                                  @"1246",@"BB",@"375",@"BY",@"32",@"BE",@"501",@"BZ",
                                  @"229",@"BJ",@"1441",@"BM",@"975",@"BT",@"387",@"BA",
                                  @"267",@"BW",@"55",@"BR",@"246",@"IO",@"359",@"BG",
                                  @"226",@"BF",@"257",@"BI",@"855",@"KH",@"237",@"CM",
                                  @"1",@"CA",@"238",@"CV",@"345",@"KY",@"236",@"CF",
                                  @"235",@"TD",@"56",@"CL",@"86",@"CN",@"61",@"CX",
                                  @"57",@"CO",@"269",@"KM",@"242",@"CG",@"682",@"CK",
                                  @"506",@"CR",@"385",@"HR",@"53",@"CU",@"537",@"CY",
                                  @"420",@"CZ",@"45",@"DK",@"253",@"DJ",@"1767",@"DM",
                                  @"1849",@"DO",@"593",@"EC",@"20",@"EG",@"503",@"SV",
                                  @"240",@"GQ",@"291",@"ER",@"372",@"EE",@"251",@"ET",
                                  @"298",@"FO",@"679",@"FJ",@"358",@"FI",@"33",@"FR",
                                  @"594",@"GF",@"689",@"PF",@"241",@"GA",@"220",@"GM",
                                  @"995",@"GE",@"49",@"DE",@"233",@"GH",@"350",@"GI",
                                  @"30",@"GR",@"299",@"GL",@"1473",@"GD",@"590",@"GP",
                                  @"1671",@"GU",@"502",@"GT",@"224",@"GN",@"245",@"GW",
                                  @"595",@"GY",@"509",@"HT",@"504",@"HN",@"36",@"HU",
                                  @"354",@"IS",@"91",@"IN",@"62",@"ID",@"964",@"IQ",
                                  @"353",@"IE",@"972",@"IL",@"39",@"IT",@"1876",@"JM",
                                  @"81",@"JP",@"962",@"JO",@"77",@"KZ",@"254",@"KE",
                                  @"686",@"KI",@"965",@"KW",@"996",@"KG",@"371",@"LV",
                                  @"961",@"LB",@"266",@"LS",@"231",@"LR",@"423",@"LI",
                                  @"370",@"LT",@"352",@"LU",@"261",@"MG",@"265",@"MW",
                                  @"60",@"MY",@"960",@"MV",@"223",@"ML",@"356",@"MT",
                                  @"692",@"MH",@"596",@"MQ",@"222",@"MR",@"230",@"MU",
                                  @"262",@"YT",@"52",@"MX",@"377",@"MC",@"976",@"MN",
                                  @"382",@"ME",@"1664",@"MS",@"212",@"MA",@"95",@"MM",
                                  @"264",@"NA",@"674",@"NR",@"977",@"NP",@"31",@"NL",
                                  @"599",@"AN",@"687",@"NC",@"64",@"NZ",@"505",@"NI",
                                  @"227",@"NE",@"234",@"NG",@"683",@"NU",@"672",@"NF",
                                  @"1670",@"MP",@"47",@"NO",@"968",@"OM",@"92",@"PK",
                                  @"680",@"PW",@"507",@"PA",@"675",@"PG",@"595",@"PY",
                                  @"51",@"PE",@"63",@"PH",@"48",@"PL",@"351",@"PT",
                                  @"1939",@"PR",@"974",@"QA",@"40",@"RO",@"250",@"RW",
                                  @"685",@"WS",@"378",@"SM",@"966",@"SA",@"221",@"SN",
                                  @"381",@"RS",@"248",@"SC",@"232",@"SL",@"65",@"SG",
                                  @"421",@"SK",@"386",@"SI",@"677",@"SB",@"27",@"ZA",
                                  @"500",@"GS",@"34",@"ES",@"94",@"LK",@"249",@"SD",
                                  @"597",@"SR",@"268",@"SZ",@"46",@"SE",@"41",@"CH",
                                  @"992",@"TJ",@"66",@"TH",@"228",@"TG",@"690",@"TK",
                                  @"676",@"TO",@"1868",@"TT",@"216",@"TN",@"90",@"TR",
                                  @"993",@"TM",@"1649",@"TC",@"688",@"TV",@"256",@"UG",
                                  @"380",@"UA",@"971",@"AE",@"44",@"GB",@"1",@"US",
                                  @"598",@"UY",@"998",@"UZ",@"678",@"VU",@"681",@"WF",
                                  @"967",@"YE",@"260",@"ZM",@"263",@"ZW",@"358",@"AX",
                                  @"591",@"BO",@"673",@"BN",@"61",@"CC",@"243",@"CD",
                                  @"225",@"CI",@"500",@"FK",@"44",@"GG",@"379",@"VA",
                                  @"852",@"HK",@"98",@"IR",@"44",@"IM",@"44",@"JE",
                                  @"850",@"KP",@"82",@"KR",@"856",@"LA",@"218",@"LY",
                                  @"853",@"MO",@"389",@"MK",@"691",@"FM",@"373",@"MD",
                                  @"258",@"MZ",@"970",@"PS",@"872",@"PN",@"262",@"RE",
                                  @"7",@"RU",@"590",@"BL",@"290",@"SH",@"1869",@"KN",
                                  @"1758",@"LC",@"590",@"MF",@"508",@"PM",@"1784",@"VC",
                                  @"239",@"ST",@"252",@"SO",@"47",@"SJ",@"963",@"SY",
                                  @"886",@"TW",@"255",@"TZ",@"670",@"TL",@"58",@"VE",
                                  @"84",@"VN",@"1284",@"VG",@"1340",@"VI",@"672",@"AQ",
                                  @"599",@"BQ",@"599",@"CW",@"211",@"SS",@"1721",@"SX",
                                  @"2908",@"TA",@"262",@"TF",@"383",@"XK",@"247",@"AC",
                                  @"246",@"DG",@"212",@"EH",@"3491",@"IC",@"34",@"EA",
                                  @"11",@"HM",@"1",@"UM",@"47",@"BV",@"11",@"CP",nil];
    NSMutableArray * countriesArray = [[NSMutableArray alloc] init];
    
    //    NSString * localeIdentifier = [DYInternationalManager sharedInternationalManager].currentLanguage;
    //
    //    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    NSLocale *locale = [NSLocale currentLocale];
    NSString * currentCountryCode  =  [locale objectForKey:NSLocaleCountryCode];
    
    NSArray *countryArray = [NSLocale ISOCountryCodes];
    //    当前的国家code
    
    
    
    
    
    
    for (NSString *countryCode in countryArray) {
        
        
        NSString *displayNameString = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
        
        
        YSHCountryCodeModel * model = [YSHCountryCodeModel new];
        model.code = countryCode;
        model.name = displayNameString;
        model.latin = [self latinize:displayNameString];
        model.dial_code = rawDialCodeDict[countryCode];
        
        NSLog(@"---%@--%@--%@",displayNameString,countryCode,model.latin);
        [countriesArray addObject:model];
        
        if ([model.code isEqualToString:currentCountryCode]) {
            [YSHCountryCodeTool shareCountryCodeTool].curretnCountryModel = model;
        }
        
    }
    
    
    
    return countriesArray;
}

+ (NSString*)latinize:(NSString*)str
{
    if (str==nil) {
        return @"";
    }
    NSMutableString *source = [str mutableCopy];
    
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformToLatin, NO);
    
    //微信是这样做的
    //CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    
    CFStringTransform((__bridge CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    
    return source;
}

//接下来 我们把获取过的数据根据’A’-‘Z’进行归类
+(NSDictionary *)searchClassified:(NSArray *)dataArray
{
    NSMutableDictionary *dicSort = [@{} mutableCopy];
    for ( YSHCountryCodeModel *c in dataArray )
    {
        NSString *indexKey = @"";
        
        if ( c.latin.length > 0 )
        {
            indexKey = [[c.latin substringToIndex:1] uppercaseString];
            
            char c = [indexKey characterAtIndex:0];
            
            if ( ( c < 'A') || ( c > 'Z' ) )
            {
                continue;
            }
        }
        else
        {
            continue;
        }
        
        NSMutableArray *array = dicSort[indexKey];
        
        if ( !array )
        {
            array = [NSMutableArray array];
            
            dicSort[indexKey] = array;
        }
        
        [array addObject:c];
    }
    
    
    for (NSString *key  in dicSort.allKeys) {
        NSMutableArray * array = (NSMutableArray *)dicSort[key];
        array = [array sortedArrayUsingComparator:^NSComparisonResult(YSHCountryCodeModel * obj1, YSHCountryCodeModel * obj2) {
            return [obj1.name localizedStandardCompare:obj2.name];
        }];
        
        dicSort[key] = array;
    }
    
    
    
    return dicSort;
}


+(NSArray <YSHSearchCountryModel *>*)getTableArray:(NSArray *)dataArray
{
    NSDictionary * dict = [self searchClassified:dataArray];
    
    NSArray * tempIndexArray = dict.allKeys;
    tempIndexArray = [tempIndexArray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 localizedStandardCompare:obj2];
    }];
    
    NSMutableArray * tableArr = @[].mutableCopy;
    for (NSString * key in tempIndexArray) {
        YSHSearchCountryModel * model = [YSHSearchCountryModel new];
        model.indexStr = key;
        model.dataArray = dict[key];
        [tableArr addObject:model];
    }
    
    return tableArr;
    
}

@end
