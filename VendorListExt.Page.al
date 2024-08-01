page 50409 LunchVendorList 
{
    Caption = 'Lunch Wendor List';
    PageType = List;
    UsageCategory = Lists;
    CardPageId = LunchVendorCard;
    SourceTable = Vendor;

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

    trigger OnOpenPage()
    begin
        Rec.SetRange(LunchVendor, true);
    end;

    // procedure SetAddFilters()
    // var
    //     myInt: Integer;
    // begin
    //     if LunchVendorNeeded then
    //         Rec.SetRange(LunchVendor, true);

    // end;

    // procedure SetLunchVendorNeeded()
    // begin
    //     LunchVendorNeeded := true;
    // end;

    // var
    //     LunchVendorNeeded: Boolean;
}