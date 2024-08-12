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
                    Caption = 'Item No.';
                }
                field("Vendor No.";Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                }
                field(Description;Rec.Description)
                {
                    Caption = 'Description';
                }
                field(Weight;Rec.Weight)
                {
                    Caption = 'Weight';
                }
                field(Price;Rec.Price)
                {
                    Caption = 'Price';
                }
                field(Picture;Rec.Picture)
                {
                    Caption = 'Picture';
                }
                field("Info Link";Rec."Info Link")
                {
                    Caption = 'Info link';
                    
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