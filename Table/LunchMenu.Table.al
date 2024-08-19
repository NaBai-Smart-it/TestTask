table 50401 "Lunch Menu"
{
    Caption = 'Lunch Menu';
    DataClassification = CustomerContent;
    LookupPageId = "Lunch Menu";
    DrillDownPageId = "Lunch Menu";

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor."No." where("Lunch Vendor" = const(true));
        }
        field(2; "Menu Date"; Date)
        {
            Caption = 'Menu Date';
            NotBlank = true;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
            NotBlank = true;
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = "Lunch Item" where("Vendor No." = field("Vendor No."));

        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
            // lookup
        }
        field(6; Weight; Decimal)
        {
            Caption = 'Weight';
            MinValue = 0;
        }
        field(7; Price; Decimal)
        {
            Caption = 'Price';
            trigger OnValidate()
            begin
                Rec."Order Amount" := (Rec."Order Quantity" * Rec.Price);
            end;
        }
        field(8; Identation; Integer)
        {
            Caption = 'Identation';
        }
        field(9; "Menu Item Entry No."; Integer)
        {
            Caption = 'Menu Item Entry No.';
            AutoIncrement = true;
        }
        field(10; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(11; "Order Quantity"; Decimal)
        {
            Caption = 'Order Quantity';
            MinValue = 0;
            DecimalPlaces = 0;
            trigger OnValidate()
            begin
                Rec."Order Amount" := (Rec."Order Quantity" * Rec.Price);
            end;
        }
        field(12; "Order Amount"; Decimal)
        {
            Caption = 'Order Amount';
        }
        field(13; "Line Type"; Enum "Line Type")
        {
            Caption = 'Line Type';
            NotBlank = true;

            trigger OnValidate()
            begin
                TestField(Rec."Line Type");
            end;
        }
        field(14; "Prewies Quantity"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Lunch Order Entry".Quantity where("Menu Item Entry No." = field("Menu Item Entry No.")));
        }
    }

    keys
    {
        key(PK; "Vendor No.", "Menu Date", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        LunchOrderEntery: Record "Lunch Order Entry";
    begin
        LunchOrderEntery.SetRange(LunchOrderEntery."Menu Item Entry No.", Rec."Menu Item Entry No.");
        if not LunchOrderEntery.IsEmpty() then
            LunchOrderEntery.DeleteAll(true);
    end;
}