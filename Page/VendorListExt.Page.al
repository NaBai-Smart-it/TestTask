page 50409 "Lunch Vendors" 
{
    Caption = 'Lunch Vendors';
    PageType = List;
    UsageCategory = Lists;
    CardPageId = "Lunch Vendor Card";
    SourceTable = Vendor;
    SourceTableView = where ("Lunch Vendor" = const(true));

    layout
    {
        area(Content)
        {
            repeater(LunchVendorsInfo)
            {
                field("No.";Rec."No.")
                {
                }
                field(Name;Rec.Name)
                {
                }
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     Rec.SetRange(LunchVendor, true);
    // end;
}