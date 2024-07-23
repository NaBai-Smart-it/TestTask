pageextension 50400 LunchVendorList extends "Vendor List"
{
    trigger OnOpenPage()
    begin
        Rec.SetRange(LunchVendor, true);
    end;
}