page 50408 "Lunch Item Info"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "Lunch Item";

    layout
    {
        area(content)
        {
            field("Info Link"; Rec."Info Link")
            {
                Caption = 'Info link';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Info link field.';
            }
        }
    }
}