page 50411 "Lunch Vendor Card"
{
    Caption = 'Lunch Vendor Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Vendor;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Lunch Vendor" := true;
    end;
}