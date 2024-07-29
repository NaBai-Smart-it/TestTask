pageextension 50400 LunchVendorList extends "Vendor List"
{

    trigger OnOpenPage()
    begin
        SetAddFilters();
    end;

    procedure SetAddFilters()
    var
        myInt: Integer;
    begin
        if LunchVendorNeeded then
            Rec.SetRange(LunchVendor, true);

    end;

    procedure SetLunchVendorNeeded()
    begin
        LunchVendorNeeded := true;
    end;

    var
        LunchVendorNeeded: Boolean;
}