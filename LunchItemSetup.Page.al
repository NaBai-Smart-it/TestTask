page 50410 LunchItemSetup
{
    Caption = 'Lunch Item Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = LunchItemSetup;
    InsertAllowed = false;
    DeleteAllowed = false;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No. Series Code";Rec."No. Series Code")
                {

                }
                field("Usage Date";Rec."Usage Date")
                {

                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
    
    
}