report 50400 MenuForToday
{
    Caption = 'Menu For Today';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = 'Menu_For_Today.docx';


    dataset
    {
        dataitem(LunchMenu; "Lunch Menu")
        {
            RequestFilterFields = "Menu Date";

            column(MenuDate_LunchMenu; "Menu Date")
            {
            }
            column(ItemNo_LunchMenu; "Item No.")
            {
            }
            column(Vendor_No_; "Vendor No.")
            {
            }
            column(Description; Description)
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
}