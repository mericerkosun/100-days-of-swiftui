//
//  ContentView.swift
//  iExpenseChallenge
//
//  Created by Meriç Erkoşun on 26.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expensesAh = Expenses()
//    @State private var showingAddExpense = false
    @State private var currency = Currency()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Curency Type", selection: $currency.selectedCurrency) {
                        ForEach(currency.currencyDictionary.sorted(by: <), id: \.key) { key, value in
                            Text(key)
                        }
                    }
                }
                
                ForEach(expensesAh.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()
                        
                        Group {
                            if item.amount < 10 {
                                Text(item.amount, format: .currency(code: "\(item.currencyType)"))
                                    .foregroundStyle(Color.green)
                            } else if item.amount < 100 {
                                Text(item.amount, format: .currency(code: "\(item.currencyType)"))
                                    .foregroundStyle(Color.orange)
                            } else {
                                Text(item.amount, format: .currency(code: "\(item.currencyType)"))
                                    .foregroundStyle(Color.red)
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                NavigationLink("Add") {
                    AddView(expensesOh: expensesAh, currency: currency)
                }
            }
            .navigationTitle("iExpense")
        }
        .onAppear{
            currency.selectedCurrency = UserDefaults.standard.string(forKey: "latestCurrency") ?? "ERR"
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expensesAh.items.remove(atOffsets: offsets)
    }
}

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currencyType: String
}

@Observable
class Expenses {
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
    }
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
}

@Observable
class Currency {
    var selectedCurrency = "US Dollar"
    let currencyDictionary = ["Andorran Peseta": "ADP", "United Arab Emirates Dirham": "AED", "Afghan Afghani (1927-2002)": "AFA", "Afghan Afghani": "AFN", "Albanian Lek (1946-1965)": "ALK", "Albanian Lek": "ALL", "Armenian Dram": "AMD", "Netherlands Antillean Guilder": "ANG", "Angolan Kwanza": "AOA", "Angolan Kwanza (1977-1991)": "AOK", "Angolan New Kwanza (1990-2000)": "AON", "Angolan Readjusted Kwanza (1995-1999)": "AOR", "Argentine Austral": "ARA", "Argentine Peso Ley (1970-1983)": "ARL", "Argentine Peso (1881-1970)": "ARM", "Argentine Peso (1983-1985)": "ARP", "Argentine Peso": "ARS", "Austrian Schilling": "ATS", "Australian Dollar": "AUD", "Aruban Florin": "AWG", "Azerbaijani Manat (1993-2006)": "AZM", "Azerbaijani Manat": "AZN", "Bosnia-Herzegovina Dinar (1992-1994)": "BAD", "Bosnia-Herzegovina Convertible Mark": "BAM", "Bosnia-Herzegovina New Dinar (1994-1997)": "BAN", "Barbadian Dollar": "BBD", "Bangladeshi Taka": "BDT", "Belgian Franc (convertible)": "BEC", "Belgian Franc": "BEF", "Belgian Franc (financial)": "BEL", "Bulgarian Hard Lev": "BGL", "Bulgarian Socialist Lev": "BGM", "Bulgarian Lev": "BGN", "Bulgarian Lev (1879-1952)": "BGO", "Bahraini Dinar": "BHD", "Burundian Franc": "BIF", "Bermudan Dollar": "BMD", "Brunei Dollar": "BND", "Bolivian Boliviano": "BOB", "Bolivian Boliviano (1863-1963)": "BOL", "Bolivian Peso": "BOP", "Bolivian Mvdol": "BOV", "Brazilian New Cruzeiro (1967-1986)": "BRB", "Brazilian Cruzado (1986-1989)": "BRC", "Brazilian Cruzeiro (1990-1993)": "BRE", "Brazilian Real": "BRL", "Brazilian New Cruzado (1989-1990)": "BRN", "Brazilian Cruzeiro (1993-1994)": "BRR", "Brazilian Cruzeiro (1942-1967)": "BRZ", "Bahamian Dollar": "BSD", "Bhutanese Ngultrum": "BTN", "Burmese Kyat": "BUK", "Botswanan Pula": "BWP", "Belarusian New Ruble (1994-1999)": "BYB", "Belarusian Ruble": "BYR", "Belize Dollar": "BZD", "Canadian Dollar": "CAD", "Congolese Franc": "CDF", "WIR Euro": "CHE", "Swiss Franc": "CHF", "WIR Franc": "CHW", "Chilean Escudo": "CLE", "Chilean Unit of Account (UF)": "CLF", "Chilean Peso": "CLP", "Chinese People's Bank Dollar": "CNX", "Chinese Yuan": "CNY", "Colombian Peso": "COP", "Colombian Real Value Unit": "COU", "Costa Rican Colón": "CRC", "Serbian Dinar (2002-2006)": "CSD", "Czechoslovak Hard Koruna": "CSK", "Cuban Convertible Peso": "CUC", "Cuban Peso": "CUP", "Cape Verdean Escudo": "CVE", "Cypriot Pound": "CYP", "Czech Republic Koruna": "CZK", "East German Mark": "DDM", "German Mark": "DEM", "Djiboutian Franc": "DJF", "Danish Krone": "DKK", "Dominican Peso": "DOP", "Algerian Dinar": "DZD", "Ecuadorian Sucre": "ECS", "Ecuadorian Unit of Constant Value": "ECV", "Estonian Kroon": "EEK", "Egyptian Pound": "EGP", "Eritrean Nakfa": "ERN", "Spanish Peseta (A account)": "ESA", "Spanish Peseta (convertible account)": "ESB", "Spanish Peseta": "ESP", "Ethiopian Birr": "ETB", "Euro": "EUR", "Finnish Markka": "FIM", "Fijian Dollar": "FJD", "Falkland Islands Pound": "FKP", "French Franc": "FRF", "British Pound Sterling": "GBP", "Georgian Kupon Larit": "GEK", "Georgian Lari": "GEL", "Ghanaian Cedi (1979-2007)": "GHC", "Ghanaian Cedi": "GHS", "Gibraltar Pound": "GIP", "Gambian Dalasi": "GMD", "Guinean Franc": "GNF", "Guinean Syli": "GNS", "Equatorial Guinean Ekwele": "GQE", "Greek Drachma": "GRD", "Guatemalan Quetzal": "GTQ", "Portuguese Guinea Escudo": "GWE", "Guinea-Bissau Peso": "GWP", "Guyanaese Dollar": "GYD", "Hong Kong Dollar": "HKD", "Honduran Lempira": "HNL", "Croatian Dinar": "HRD", "Croatian Kuna": "HRK", "Haitian Gourde": "HTG", "Hungarian Forint": "HUF", "Indonesian Rupiah": "IDR", "Irish Pound": "IEP", "Israeli Pound": "ILP", "Israeli Sheqel (1980-1985)": "ILR", "Israeli New Sheqel": "ILS", "Indian Rupee": "INR", "Iraqi Dinar": "IQD", "Iranian Rial": "IRR", "Icelandic Króna (1918-1981)": "ISJ", "Icelandic Króna": "ISK", "Italian Lira": "ITL", "Jamaican Dollar": "JMD", "Jordanian Dinar": "JOD", "Japanese Yen": "JPY", "Kenyan Shilling": "KES", "Kyrgystani Som": "KGS", "Cambodian Riel": "KHR", "Comorian Franc": "KMF", "North Korean Won": "KPW", "South Korean Hwan (1953-1962)": "KRH", "South Korean Won (1945-1953)": "KRO", "South Korean Won": "KRW", "Kuwaiti Dinar": "KWD", "Cayman Islands Dollar": "KYD", "Kazakhstani Tenge": "KZT", "Laotian Kip": "LAK", "Lebanese Pound": "LBP", "Sri Lankan Rupee": "LKR", "Liberian Dollar": "LRD", "Lesotho Loti": "LSL", "Lithuanian Litas": "LTL", "Lithuanian Talonas": "LTT", "Luxembourgian Convertible Franc": "LUC", "Luxembourgian Franc": "LUF", "Luxembourg Financial Franc": "LUL", "Latvian Lats": "LVL", "Latvian Ruble": "LVR", "Libyan Dinar": "LYD", "Moroccan Dirham": "MAD", "Moroccan Franc": "MAF", "Monegasque Franc": "MCF", "Moldovan Cupon": "MDC", "Moldovan Leu": "MDL", "Malagasy Ariary": "MGA", "Malagasy Franc": "MGF", "Macedonian Denar": "MKD", "Macedonian Denar (1992-1993)": "MKN", "Malian Franc": "MLF", "Myanma Kyat": "MMK", "Mongolian Tugrik": "MNT", "Macanese Pataca": "MOP", "Mauritanian Ouguiya": "MRO", "Maltese Lira": "MTL", "Maltese Pound": "MTP", "Mauritian Rupee": "MUR", "Maldivian Rupee": "MVP", "Maldivian Rufiyaa": "MVR", "Malawian Kwacha": "MWK", "Mexican Peso": "MXN", "Mexican Silver Peso (1861-1992)": "MXP", "Mexican Investment Unit": "MXV", "Malaysian Ringgit": "MYR", "Mozambican Escudo": "MZE", "Mozambican Metical (1980-2006)": "MZM", "Mozambican Metical": "MZN", "Namibian Dollar": "NAD", "Nigerian Naira": "NGN", "Nicaraguan Córdoba (1988-1991)": "NIC", "Nicaraguan Córdoba": "NIO", "Dutch Guilder": "NLG", "Norwegian Krone": "NOK", "Nepalese Rupee": "NPR", "New Zealand Dollar": "NZD", "Omani Rial": "OMR", "Panamanian Balboa": "PAB", "Peruvian Inti": "PEI", "Peruvian Nuevo Sol": "PEN", "Peruvian Sol (1863-1965)": "PES", "Papua New Guinean Kina": "PGK", "Philippine Peso": "PHP", "Pakistani Rupee": "PKR", "Polish Zloty": "PLN", "Polish Zloty (1950-1995)": "PLZ", "Portuguese Escudo": "PTE", "Paraguayan Guarani": "PYG", "Qatari Rial": "QAR", "Rhodesian Dollar": "RHD", "Romanian Leu (1952-2006)": "ROL", "Romanian Leu": "RON", "Serbian Dinar": "RSD", "Russian Ruble": "RUB", "Russian Ruble (1991-1998)": "RUR", "Rwandan Franc": "RWF", "Saudi Riyal": "SAR", "Solomon Islands Dollar": "SBD", "Seychellois Rupee": "SCR", "Sudanese Dinar (1992-2007)": "SDD", "Sudanese Pound": "SDG", "Sudanese Pound (1957-1998)": "SDP", "Swedish Krona": "SEK", "Singapore Dollar": "SGD", "Saint Helena Pound": "SHP", "Slovenian Tolar": "SIT", "Slovak Koruna": "SKK", "Sierra Leonean Leone": "SLL", "Somali Shilling": "SOS", "Surinamese Dollar": "SRD", "Surinamese Guilder": "SRG", "São Tomé and Príncipe Dobra": "STD", "Soviet Rouble": "SUR", "Salvadoran Colón": "SVC", "Syrian Pound": "SYP", "Swazi Lilangeni": "SZL", "Thai Baht": "THB", "Tajikistani Ruble": "TJR", "Tajikistani Somoni": "TJS", "Turkmenistani Manat (1993-2009)": "TMM", "Turkmenistani Manat": "TMT", "Tunisian Dinar": "TND", "Tongan Paʻanga": "TOP", "Timorese Escudo": "TPE", "Turkish Lira (1922-2005)": "TRL", "Turkish Lira": "TRY", "Trinidad and Tobago Dollar": "TTD", "New Taiwan Dollar": "TWD", "Tanzanian Shilling": "TZS", "Ukrainian Hryvnia": "UAH", "Ukrainian Karbovanets": "UAK", "Ugandan Shilling (1966-1987)": "UGS", "Ugandan Shilling": "UGX", "US Dollar": "USD", "US Dollar (Next day)": "USN", "US Dollar (Same day)": "USS", "Uruguayan Peso (Indexed Units)": "UYI", "Uruguayan Peso (1975-1993)": "UYP", "Uruguayan Peso": "UYU", "Uzbekistan Som": "UZS", "Venezuelan Bolívar (1871-2008)": "VEB", "Venezuelan Bolívar": "VEF", "Vietnamese Dong": "VND", "Vietnamese Dong (1978-1985)": "VNN", "Vanuatu Vatu": "VUV", "Samoan Tala": "WST", "CFA Franc BEAC": "XAF", "Silver": "XAG", "Gold": "XAU", "European Composite Unit": "XBA", "European Monetary Unit": "XBB", "European Unit of Account (XBC)": "XBC", "European Unit of Account (XBD)": "XBD", "East Caribbean Dollar": "XCD", "Special Drawing Rights": "XDR", "European Currency Unit": "XEU", "French Gold Franc": "XFO", "French UIC-Franc": "XFU", "CFA Franc BCEAO": "XOF", "Palladium": "XPD", "CFP Franc": "XPF", "Platinum": "XPT", "RINET Funds": "XRE", "Testing Currency Code": "XTS", "Unknown Currency": "XXX", "Yemeni Dinar": "YDD", "Yemeni Rial": "YER", "Yugoslavian Hard Dinar (1966-1990)": "YUD", "Yugoslavian New Dinar (1994-2002)": "YUM", "Yugoslavian Convertible Dinar (1990-1992)": "YUN", "Yugoslavian Reformed Dinar (1992-1993)": "YUR", "South African Rand (financial)": "ZAL", "South African Rand": "ZAR", "Zambian Kwacha": "ZMK", "Zairean New Zaire (1993-1998)": "ZRN", "Zairean Zaire (1971-1993)": "ZRZ", "Zimbabwean Dollar (2009)": "ZWL", "Zimbabwean Dollar (2008)": "ZWR", "Zimbabwean Dollar (1980-2008)": "ZWD"]
}

//struct ColoredText: View {
//    var value: Double
//    @State var currency: Currency
//    var body: some View {
//        if value <= 10 {
//            Text(value, format: .currency(code: currency.currencyDictionary[currency.selectedCurrency] ?? "ERR"))
//                .foregroundStyle(.green)
//        } else if value < 100 {
//            Text(value, format: .currency(code: currency.currencyDictionary[currency.selectedCurrency] ?? "ERR"))
//                .foregroundStyle(Color(red: 255/255, green: 130/255, blue: 0/255)
//)
//        } else {
//            Text(value, format: .currency(code: currency.currencyDictionary[currency.selectedCurrency] ?? "ERR"))
//                .foregroundStyle(Color(red: 200/255, green: 10/255, blue: 0/255))
//        }
//    }
//}

#Preview {
    ContentView()
}
