page 50408 ItemInfoFactBox
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = LunchItem;
    
    layout
    {
        area(content)
        {
            field("Info Link"; Rec."Info Link")
            {
                ApplicationArea = All;
                Caption = 'Info link';
            }
        }
    }
}