page 50411 LunchVendorCard
{
    Caption = 'Lunch Vendor Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Vendor;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name;Rec.Name)
                {

                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.LunchVendor := true;
    end;
}