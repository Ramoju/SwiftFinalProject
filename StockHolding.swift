
//parent class which has a stock that you purchased
class StockHolding{
   private var purchaseSharePrice:Float
   private var currentSharePrice:Float
   private var numberOfShares:Int
   private var companyName:String
    
//initializer    
    init(companyName:String,purchaseSharePrice:Float,currentSharePrice:Float,numberOfShares:Int){
    self.companyName=companyName
    self.purchaseSharePrice=purchaseSharePrice
    self.currentSharePrice=currentSharePrice
    self.numberOfShares=numberOfShares
    }

//getter methods
   func getCompanyName()->String{
       return companyName
   }
   func getPurchasePrice()->Float{
       return purchaseSharePrice
   }
   func getCurrentPrice()->Float{
       return currentSharePrice
   }
   func getNoOfShares()->Int{
       return numberOfShares
   }

//setters
    func setCompanyName(company:String){
        companyName=company
    }
    func setPurchasePrice(purc:Float){
        purchaseSharePrice=purc
    }
    func setCurrentPrice(curr:Float){
        currentSharePrice=curr
    }
    func setNoOfShares(sha:Int){
        numberOfShares=sha
    }

// a method or function to calculate cost 
    func costIntDollars()->Float{
        let cost=purchaseSharePrice * Float(numberOfShares)
        return cost
    }

// a method or function to calculate current value 
    func valueInDollars()->Float{
        let value=currentSharePrice * Float(numberOfShares)
        return value
    }

}