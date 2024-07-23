tableextension 50401 LunchVendor extends Vendor
{
    fields
    {
        field(50400; LunchVendor; Boolean)
        {
            Caption = 'Lunch Vendor';
        }
    }

    trigger OnAfterInsert()
    begin
        Rec.LunchVendor := true;
    end;
    
}