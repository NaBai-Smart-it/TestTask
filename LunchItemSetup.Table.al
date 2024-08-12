table 50405 LunchItemSetup
{
    Caption = 'Item Setup';
    DataClassification = CustomerContent;
    
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "No. Series Code"; Code[20])
        {
            Caption = 'No. Series Code';
        }
        field(3; "Usage Date"; Date)
        {
            Caption = 'Usage Date';
        }
    }
    
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}