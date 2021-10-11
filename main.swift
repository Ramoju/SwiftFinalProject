
//main class

//creating object instances of the stock holding classes

var stockHold=[StockHolding]()

// Inserting sample records into stock holding

stockHold.append(StockHolding(companyName:"RoseGold",purchaseSharePrice:2500.59,currentSharePrice:10800.47,numberOfShares:13))
stockHold.append(StockHolding(companyName:"MarieGold",purchaseSharePrice:1543.78,currentSharePrice:14536.43,numberOfShares:24))
stockHold.append(StockHolding(companyName:"Goodday",purchaseSharePrice:2340.223,currentSharePrice:17680.97,numberOfShares:22))
stockHold.append(StockHolding(companyName:"ParleG",purchaseSharePrice:1670.56,currentSharePrice:30780.56,numberOfShares:19))
stockHold.append(StockHolding(companyName:"Britania",purchaseSharePrice:2975.72,currentSharePrice:88630.66,numberOfShares:9))
stockHold.append(StockHolding(companyName:"Sunfeast",purchaseSharePrice:3785.93,currentSharePrice:64730.33,numberOfShares:5))
stockHold.append(StockHolding(companyName:"Oreo",purchaseSharePrice:2935.73,currentSharePrice:45326.76,numberOfShares:27))
stockHold.append(StockHolding(companyName:"Cadbury",purchaseSharePrice:1298.93,currentSharePrice:45365.53,numberOfShares:36))
stockHold.append(StockHolding(companyName:"BourBonn",purchaseSharePrice:3944.34,currentSharePrice:37622.47,numberOfShares:11))
stockHold.append(StockHolding(companyName:"MomsMagic",purchaseSharePrice:9837.67,currentSharePrice:96383.56,numberOfShares:21))

//inserting data into the ForeignStockHolding

stockHold.append(ForeignStockHolding(companyName:"ThreeRoses",purchaseSharePrice:2349.76,currentSharePrice:12346.87,numberOfShares:8,conversionRate:0.017))
stockHold.append(ForeignStockHolding(companyName:"Nestle",purchaseSharePrice:4523.42,currentSharePrice:34526.62,numberOfShares:21,conversionRate:0.017))

//method to show company names in alphabetical order

func sorterForCompanyName(stock:[StockHolding]){
for s in stock{
    print("Company Name:\(s.getCompanyName())\tPurchase Share Price:\(s.getPurchasePrice())\tCurrent Share Price:\(s.getCurrentPrice())\tNumber of Shares:\(s.getNoOfShares())")
}
}

let name = stockHold.sorted(by: { $0.getCompanyName() < $1.getCompanyName() })
print("COMPANY NAMES IN ALPHABETICAL ORDER:")
sorterForCompanyName(stock: name)


//method to show company names in reverse alphabetical order

let cName=stockHold.sorted(by: {$0.getCompanyName() > $1.getCompanyName() })
print("\nCOMPANY NAMES IN REVERSE ALPHABETICAL ORDER:")
sorterForCompanyName(stock:cName)

// case5: Alphabetical order after user enter

func alphabeticalOrder(){
let name = stockHold.sorted(by: { $0.getCompanyName() < $1.getCompanyName() })
print("COMPANY NAMES IN ALPHABETICAL ORDER (A-Z):")
sorterForCompanyName(stock: name)
}
//case6: lowest to highest value of all stocks (based on currentvalue)

func lowToHighValue(){
let cName=stockHold.sorted(by: {$0.getCurrentPrice() < $1.getCurrentPrice() })
print("\nLOWEST VALUE TO HIGHEST VALUE:")
sorterForCompanyName(stock:cName)
}

var printMsg:String = ""

//method or function to show stock details having highest share value

func highValShare() -> String {
    var max = stockHold[0].valueInDollars()
    for h in stockHold {
        if h.valueInDollars() > max {
            max = h.valueInDollars()
            if h is ForeignStockHolding{
                printMsg = "Company Name:\(h.getCompanyName())\tPurchase Share Price:\(h.getPurchasePrice() * (h as! ForeignStockHolding).getConversionRate())\tCurrent Share Price:\(h.getCurrentPrice() * (h as! ForeignStockHolding).getConversionRate())\tNumber of Shares:\(h.getNoOfShares())"
            }
            else {
                printMsg = "Company Name:\(h.getCompanyName())\tPurchase Share Price:\(h.getPurchasePrice())\tCurrent Share Price:\(h.getCurrentPrice())\tNumber of Shares:\(h.getNoOfShares())"
            }
        }
    }
    return printMsg
}

//method or function to show stock details having least share value

func lowValShare() -> String {
    var min = stockHold[0].valueInDollars()
    for h in stockHold {
        if h.valueInDollars() < min {
            min = h.valueInDollars()
            if h is ForeignStockHolding{
                printMsg = "Company Name:\(h.getCompanyName())\tPurchase Share Price:\(h.getPurchasePrice() * (h as! ForeignStockHolding).getConversionRate()) $\tCurrent Share Price:\(h.getCurrentPrice() * (h as! ForeignStockHolding).getConversionRate())$\tNumber of Shares:\(h.getNoOfShares())"
            }
            else {
                printMsg = "Company Name:\(h.getCompanyName())\tPurchase Share Price:\(h.getPurchasePrice())\tCurrent Share Price:\(h.getCurrentPrice())\tNumber of Shares:\(h.getNoOfShares())"
            }
        }
    }
    return printMsg
}


//method or function to show stock details having highest profit

func highProfitShare() -> String {
    var highprofit = stockHold[0].getCurrentPrice() - stockHold[0].getPurchasePrice()
    var highprofitstock:StockHolding = stockHold[0]
    for h in stockHold {
        if h.getCurrentPrice()-h.getPurchasePrice() > highprofit {
            highprofit = h.getCurrentPrice()-h.getPurchasePrice()
            highprofitstock = h
        }    
    }
    if highprofitstock is ForeignStockHolding{
                printMsg = "Company Name:\(highprofitstock.getCompanyName())\tPurchase Share Price:\(highprofitstock.getPurchasePrice() * (highprofitstock as! ForeignStockHolding).getConversionRate())\tCurrent Share Price:\(highprofitstock.getCurrentPrice() * (highprofitstock as! ForeignStockHolding).getConversionRate())\tNumber of Shares:\(highprofitstock.getNoOfShares())"
            }
            else {
                printMsg = "Company Name:\(highprofitstock.getCompanyName())\tPurchase Share Price:\(highprofitstock.getPurchasePrice())\tCurrent Share Price:\(highprofitstock.getCurrentPrice())\tNumber of Shares:\(highprofitstock.getNoOfShares())"
            }
    return printMsg
}

//method or function to show stock details having least profit

func leastProfitShare() -> String {
    var leastprofit = stockHold[0].getCurrentPrice()-stockHold[0].getPurchasePrice()
    var leastprofitstock:StockHolding = stockHold[0]
    print(leastprofit)
    for h in stockHold {
    print(leastprofit)
        if (h.getCurrentPrice()-h.getPurchasePrice()) < leastprofit {
            leastprofit = h.getCurrentPrice()-h.getPurchasePrice()
            leastprofitstock = h
            print("least profit updated")
        }
    }
        if leastprofitstock is ForeignStockHolding{
                printMsg = "Company Name:\(leastprofitstock.getCompanyName())\tPurchase Share Price:\(leastprofitstock.getPurchasePrice() * (leastprofitstock as! ForeignStockHolding).getConversionRate())\tCurrent Share Price:\(leastprofitstock.getCurrentPrice() * (leastprofitstock as! ForeignStockHolding).getConversionRate())\tNumber of Shares:\(leastprofitstock.getNoOfShares())"
            }
            else {
                printMsg = "Company Name:\(leastprofitstock.getCompanyName())\tPurchase Share Price:\(leastprofitstock.getPurchasePrice())\tCurrent Share Price:\(leastprofitstock.getCurrentPrice())\tNumber of Shares:\(leastprofitstock.getNoOfShares())"
            }
    return printMsg
}

// method or function to display the menu options and accept user input, based on the input invokes corresponding function

func displayMenu(){
print("1. Display stock information with the lowest value")
print("2. Display stock with the highest value")
print("3. Display the most profitable stock")
print("4. Display the least profitable stock")
print("5. List all stocks sorted by company names(A-Z)")
print("6. List all stocks sorted from the lowest value to the highest value")
print("7. Exit")
print("if you want to view any data for above provided menu, Enter the corresponding sequence number")

let userchoice = Int(readLine()!)!
switch userchoice{
    case 1: print("Lowest value stock is:\n \(lowValShare())")
    case 2: print("Highest value stock is:\n \(highValShare())")
    case 3: print("Most Profitable stock is:\n \(highProfitShare())")
    case 4: print("Least Profitable stock is:\n \(leastProfitShare())")
    case 5: alphabeticalOrder()
    case 6: lowToHighValue()
    case 7: break
    default: print("Invalid Menu Option, please enter from above given options")
}
}


//program to ask the user if he/she wants to enter stocks data

print("Do you want to enter stocks if yes, please enter any number else enter 0")
let innum = Int(readLine()!)!
if innum != 0 {
repeat{
    print("Enter the type of Stock you want to enter Foreign or Local")
    let type = readLine()!
    if type.lowercased() == "local" || type.lowercased() == "foreign" {
    print("Enter the Company Name")
    let company = readLine()!
    print("Enter purchase share price of the company")
    let purshrprc = Float(readLine()!)!
    print("Enter current share price of the company")
    let currshrprc = Float(readLine()!)!
    print("Enter number of shares")
    let noofshrs = Int(readLine()!)!
    if type.lowercased() == "local" {    
        stockHold.append(StockHolding(companyName:company,purchaseSharePrice:purshrprc,currentSharePrice:currshrprc,numberOfShares:noofshrs))
    }
    else if type.lowercased() == "foreign"{
        print("Enter conversion rate with respect to canadian currency")
        let convert = Float(readLine()!)!
        stockHold.append(ForeignStockHolding(companyName:company,purchaseSharePrice:purshrprc,currentSharePrice:currshrprc,numberOfShares:noofshrs,conversionRate:convert))
    }
    }
    else {
        print("Invalid stock type, please enter valid stock type")
    }
    print("Enter any number other than 0 to enter more stocks")
}while Int(readLine()!)! != 0
}
else {
    displayMenu()
}

displayMenu()