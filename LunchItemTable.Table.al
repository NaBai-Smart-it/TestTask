table 50400 LunchItem 
{
    Caption = 'Lunch Item';
    LookupPageId = LunchItemCard;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(2; "Vendor No."; Code[20])
        {
            Caption = 'Veendor No.';
            TableRelation = Vendor."No." where(LunchVendor = const(true));
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; Weight; Decimal)
        {
            Caption = 'Weight';
            MinValue = 0;
        }
        field(5; Price; Decimal)
        {
            Caption = 'Price';
            MinValue = 0;
        }
        field(6; "Info Link"; Text[250])
        {
            Caption = 'Info link';
        }
        field(7; "Self-Order"; Boolean)
        {
            Caption = 'Self-Order';
        }
        field(8; Picture; MediaSet)
        {
            Caption = 'Picture';
        }

    }
    
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick;"No.", Picture)
        {
        }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if ("No." = '') then
            Rec."No." := NoSeriesMgt.GetNextNo('LUNCHITEMNO', 0D);
        
    end;

    trigger OnDelete()
    var
        LunchMenuRecord: Record LunchMenu;
    begin
        LunchMenuRecord.FindSet();
        repeat
            if LunchMenuRecord."Item No." = Rec."No." then
            begin
                LunchMenuRecord.Active := false;
            end;
        until LunchMenuRecord.Next() = 0;

    end;
    
}
