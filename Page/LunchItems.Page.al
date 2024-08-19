page 50401 "Lunch Items"
{
    Caption = 'Lunch Items';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Lunch Item";
    CardPageId = "Lunch Item Card";
    
    layout
    {
        area(Content)
        {
            repeater(ITemDetails)
            {
                Caption = 'Items Details';

                field("No.";Rec."No.")
                {
                }
                field("Vendor No.";Rec."Vendor No.")
                {
                }
                field(Description;Rec.Description)
                {
                }
                field(Weight;Rec.Weight)
                {
                }
                field(Price;Rec.Price)
                {
                }
            }
        }
        area(factboxes)
        {
            part(ItemPicture; "Lunch Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("No.");
            }
            part(ItemStats; "Nutritions Pie Chart")
            {
                ApplicationArea = All;
                Caption = 'Nutritions Info';
                SubPageLink = "No." = field("No.");
            }
            part(InfoLink; "Item Info")
            {
                Caption = 'Info link';
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    
}