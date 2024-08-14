enum 50401 LunchOrderEntyStatus
{
    Extensible = true;
    
    value(0; Blank)
    {
        Caption = '';
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