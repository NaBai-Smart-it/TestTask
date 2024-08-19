enum 50401 "Lunch Order Entry Status"
{
    Extensible = true;

    value(0; "")
    {
        Caption = '', Locked = true;
    }
    value(1; Created)
    {
        Caption = 'Created';
    }
    value(2; "Sent to Vendor")
    {
        Caption = 'Sent to Vendor';
    }
    value(3; Posted)
    {
        Caption = 'Posted';
    }
}