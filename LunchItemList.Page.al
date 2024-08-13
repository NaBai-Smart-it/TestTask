page 50401 LunchItemList
{
    Caption = 'Lunch Item List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = LunchItem;
    CardPageId = LunchItemCard;
    
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
            part(ItemPicture; ItemPictureFactBox)
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("No.");
            }
            part(ItemStats; NutritionsPieChart)
            {
                ApplicationArea = All;
                Caption = 'Nutritions Info';
                SubPageLink = "No." = field("No.");
            }
            part(InfoLink; ItemInfoFactBox)
            {
                Caption = 'Info link';
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    
}