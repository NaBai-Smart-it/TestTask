page 50406 LunchOrderEnteryPage
{
    Caption = 'Lunch Order Enteries';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = LunchOrderEntry;
    Editable = false;
    
    layout
    {
        area(Content)
        {
            repeater(Enteries)
            {
                ShowCaption = false;
                
                field("Entry No."; Rec."Entry No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Item Description"; Rec."Item Description")
                {
                }
                field("Menu Item Entry No."; Rec."Menu Item Entry No.")
                {
                }
                field("Menu Item No."; Rec."Menu Item No.")
                {
                }
                field("Order Date"; Rec."Order Date")
                {
                }
                field(Price; Rec.Price)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Resourse No."; Rec."Resourse No.")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
            }

        }
    }
    
}