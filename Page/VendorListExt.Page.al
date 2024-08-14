page 50409 LunchVendorList 
{
    Caption = 'Lunch Vendor List';
    PageType = List;
    UsageCategory = Lists;
    CardPageId = LunchVendorCard;
    SourceTable = Vendor;
    SourceTableView = where (LunchVendor = const(true));

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