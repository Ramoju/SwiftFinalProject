//sub-class
class ForeignStockHolding:StockHolding{
    private var conversionRate:Float

//initialiser  
    init(companyName:String,purchaseSharePrice:Float,currentSharePrice:Float,numberOfShares:Int,conversionRate:Float){
    self.conversionRate=conversionRate
    super.init(companyName:companyName,purchaseSharePrice:purchaseSharePrice,currentSharePrice:currentSharePrice,numberOfShares:numberOfShares)
    }

//getter method
   func getConversionRate()->Float{
        return conversionRate
    }    
    
//setter method
    func setConversionRate(convers:Float){
        conversionRate=convers
    }
//overriding the parent functions
    override
    func costIntDollars()->Float{
        return conversionRate*Float(super.getNoOfShares())*super.getPurchasePrice()
    }

    override
    func valueInDollars()->Float{
        return conversionRate*Float(super.getNoOfShares())*super.getCurrentPrice()
    }
    
}