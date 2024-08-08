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
                    LookupPageId = "Vendor List";
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
                field("Self-Order";Rec."Self-Order")
                {
                    Caption = 'Self-Order';
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
                UpdatePropagation = Both;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    
}