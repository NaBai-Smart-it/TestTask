page 50401 LunchItemList
{
    Caption = 'Lunch Item Lisst';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Item;
    CardPageId = LunchItemCard;
    
    layout
    {
        area(Content)
        {
            repeater(ITemDetails)
            {
                Caption = 'Item Details';

                field("Vendor No.";Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                    LookupPageId = "Vendor List";
                }
                field(Description;Rec.Description)
                {
                    Caption = 'Description';
                }
                field(Weight;Rec.Weight)
                {
                    Caption = 'Weight';
                    MinValue = 0;
                }
                field(Price;Rec.Price)
                {
                    Caption = 'Price';
                    MinValue = 0;
                }
                field(Picture;Rec.Picture)
                {
                    Caption = 'Picture';
                }
                field("Info Link";Rec."Info Link")
                {
                    Caption = 'Info link';
                    
                }
                field("Self-Order";Rec."Self-Order")
                {
                    Caption = 'Self-Order';
                }
            }
        }

    }
    trigger OnOpenPage()
    begin
        
    end;
    
}