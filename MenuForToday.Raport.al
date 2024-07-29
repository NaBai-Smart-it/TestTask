report 50400 MenuForToday
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'Menu_For_Today.docx';
    
    
    dataset
    {
        dataitem(LunchMenu; LunchMenu)
        {
            RequestFilterFields = "Menu Date";
            
            column(MenuDate_LunchMenu; "Menu Date")
            {
            }
            column(ItemNo_LunchMenu; "Item No.")
            {
            }
            column(Description;Description)
            {
            }
            column(Price_LunchMenu; Price)
            {
            }
            column(Weight_LunchMenu; Weight)
            {
            }
        }
    }
    
    requestpage
    {
        
    }
}