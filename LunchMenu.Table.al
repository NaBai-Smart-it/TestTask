table 50401 LunchMenu
{
    Caption = 'Lunch Menu';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor."No." where(LunchVendor = const(true));
        }
        field(2; "Menu Date"; Date)
        {
            Caption = 'Menu Date';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = LunchItem where("Vendor No." = field("Vendor No."));
            
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(6; Weight; Decimal)
        {
            Caption = 'Weight';
            MinValue = 0;
            trigger OnValidate()
            var
                LunchItemTable: Record LunchItem;
            begin
                if not (Rec."Item No." = '') then
                    rec.Weight := LunchItemTable.Weight;
            end;
        }
        field(7; Price; Decimal)
        {
            Caption = 'Price';
            trigger OnValidate()
            var
                LunchItemTable: Record LunchItem;
            begin
                if not (Rec."Item No." = '') then
                    rec.Price := LunchItemTable.Price;
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
        field(13; "Line Type"; Enum LineType)
        {
            Caption = 'Line Type';
        }
        field(14; "Prewies Quantity"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum(LunchOrderEntry.Quantity WHERE("Menu Item Entry No." = FIELD("Parent Menu Item Entry No.")));
        }
        field(15; "Self-Ordered"; Boolean)
        {
            Caption = 'Self-Ordered';
        }
        field(16; "Parent Menu Item Entry No."; Integer)
        {
            Caption = 'Parent Menu Item Entry No.';
        }
    }

    keys
    {
        key(PK; "Vendor No.", "Menu Date", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if (Rec."Line Type" = Rec."Line Type"::"Item") then begin
            Rec.Identation := 3;
            Rec.Active := true;
        end;
    end;

    trigger OnDelete()
    var
        LunchOrderEntery: Record LunchOrderEntry;
    begin
        LunchOrderEntery.SetRange(LunchOrderEntery."Menu Item Entry No.", Rec."Menu Item Entry No.");
        if not LunchOrderEntery.IsEmpty() then
            LunchOrderEntery.DeleteAll(true);
    end;
}