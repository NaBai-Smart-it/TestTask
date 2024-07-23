table 50403 LunchOrderEntry
{
    Caption = 'Lunch Order Entry';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Order Date"; Date)
        {
            Caption = 'Order Date';
        }
        field(3; "Resourse No."; Code[20])
        {
            Caption = 'Resourse No.';
        }
        field(4; "Menu Item Entry No."; Integer)
        {
            Caption = 'Menu Item Entry No.';
        }
        field(5; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
        }
        field(6; "Menu Item No."; Code[20])
        {
            Caption = 'Menu Item No.';
        }
        field(7; "Item Description"; Text[250])
        {
            Caption = 'Item Description';
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(9; Price; Decimal)
        {
            Caption = 'Price';
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(11; Status; Enum LunchOrderEntyStatus)
        {
            Caption = 'Lunch Order Entry Status';
        }
    }
    
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    
    
}