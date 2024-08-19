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

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Weight; Rec.Weight)
                {
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
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
            part(InfoLink; "Lunch Item Info")
            {
                Caption = 'Info link';
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }


}