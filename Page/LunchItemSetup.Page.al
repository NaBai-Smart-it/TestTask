page 50410 "Lunch Item Setup"
{
    Caption = 'Lunch Item Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Lunch Item Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No. Series Code"; Rec."No. Series Code")
                {
                    ToolTip = 'Specifies the value of the No. Series Code field.';
                }
                field("Usage Date"; Rec."Usage Date")
                {
                    ToolTip = 'Specifies the value of the Usage Date field.';
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