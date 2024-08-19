table 50400 "Lunch Item"
{
    Caption = 'Lunch Item';
    DataClassification = CustomerContent;
    LookupPageId = "Lunch Items";
    DrillDownPageId = "Lunch Items";

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
            TableRelation = Vendor."No." where("Lunch Vendor" = const(true));
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
            ExtendedDatatype = URL;
        }
        field(8; Picture; MediaSet)
        {
            Caption = 'Picture';
        }
        field(9; Fats; Decimal)
        {
            Caption = 'Fats (g)';
            MinValue = 0;
        }
        field(10; Carbs; Decimal)
        {
            Caption = 'Carbs (g)';
            MinValue = 0;
        }
        field(11; Protein; Decimal)
        {
            Caption = 'Protein (g)';
            MinValue = 0;
        }
        field(12; Fiber; Decimal)
        {
            Caption = 'Fiber (g)';
            MinValue = 0;
        }
        field(13; Calories; Decimal)
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
        fieldgroup(DropDown; "No.", Description, Weight, Price)
        {
        }
        fieldgroup(Brick; "No.", Description, Weight, "Vendor No.", Price, Picture)
        {
        }
    }

    trigger OnInsert()
    var
        LunchItemSetup: Record "Lunch Item Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        if ("No." = '') then begin
            LunchItemSetup.Get();
            Rec."No." := NoSeriesMgt.GetNextNo(LunchItemSetup."No. Series Code", LunchItemSetup."Usage Date");
        end;

    end;

    trigger OnDelete()
    var
        LunchMenuRecord: Record "Lunch Menu";
    begin
        LunchMenuRecord.SetRange(LunchMenuRecord."Item No.", Rec."No.");
        if not LunchMenuRecord.IsEmpty() then
            LunchMenuRecord.ModifyAll(LunchMenuRecord.Active, false);
    end;

}
