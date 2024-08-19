page 50409 "Lunch Vendors"
{
    Caption = 'Lunch Vendors';
    PageType = List;
    UsageCategory = Lists;
    CardPageId = "Lunch Vendor Card";
    SourceTable = Vendor;
    SourceTableView = where("Lunch Vendor" = const(true));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(LunchVendorsInfo)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     Rec.SetRange(LunchVendor, true);
    // end;
}