table 50400 LunchItem
{
    Caption = 'Lunch Item';
    DataClassification = CustomerContent;
    LookupPageId = LunchItemCard;
    DrillDownPageId = LunchItemCard;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(2; "Vendor No."; Code[20])
        {
            NotBlank = true;
            Caption = 'Veendor No.';
            TableRelation = Vendor."No." where(LunchVendor = const(true));
        }
        field(3; Description; Text[250])
        {
            NotBlank = true;
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
        field(8; Picture; MediaSet)
        {
            Caption = 'Picture';
        }
        field(9; "Fats (g)"; Decimal)
        {
            Caption = 'Fats (g)';
            MinValue = 0;
        }
        field(10; "Carbs (g)"; Decimal)
        {
            Caption = 'Carbs (g)';
            MinValue = 0;
        }
        field(11; "Protein (g)"; Decimal)
        {
            Caption = 'Protein (g)';
            MinValue = 0;
        }
        field(12; "Fiber (g)"; Decimal)
        {
            Caption = 'Fiber (g)';
            MinValue = 0;
        }
        field(13; "Calories"; Decimal)
        {
            Caption = 'Calories';
            MinValue = 0;
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
        fieldgroup(Brick; "No.", Description, Weight, "Vendor No.", Price, Picture)
        {
        }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
        LunchItemSetup: Record LunchItemSetup;
    begin
        if ("No." = '') then begin
            LunchItemSetup.Get();
            Rec."No." := NoSeriesMgt.GetNextNo(LunchItemSetup."No. Series Code", LunchItemSetup."Usage Date");
        end;
            
    end;

    trigger OnDelete()
    var
        LunchMenuRecord: Record LunchMenu;
    begin
        LunchMenuRecord.SetRange(LunchMenuRecord."Item No.", Rec."No.");
        if not LunchMenuRecord.IsEmpty() then
            LunchMenuRecord.ModifyAll(LunchMenuRecord.Active, false);
    end;

}
