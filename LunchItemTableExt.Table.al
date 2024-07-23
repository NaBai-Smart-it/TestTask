tableextension 50400 LunchItem extends Item
{
    Caption = 'Lunch Item';
    
    fields
    {
        field(50400; Weight; Decimal)
        {
            Caption = 'Weight';
            MinValue = 0;
        }
        field(50401; Price; Decimal)
        {
            Caption = 'Price';
            MinValue = 0;
        }
        field(50402; "Info Link"; Text[250])
        {
            Caption = 'Info link';
        }
        field(50403; "Self-Order"; Boolean)
        {
            Caption = 'Self-Order';
        }

    }
    
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
