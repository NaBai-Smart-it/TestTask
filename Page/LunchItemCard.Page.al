page 50400 "Lunch Item Card"
{
    Caption = ' Lunch Item Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Lunch Item";

    layout
    {
        area(Content)
        {
            group(ItemDetails)
            {
                Caption = 'Item Details';

                field("Vendor No."; Rec."Vendor No.")
                {
                    ShowMandatory = true;
                    //Caption = 'Vendor Number';
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field(Description; Rec.Description)
                {
                    ShowMandatory = true;
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Weight; Rec.Weight)
                {
                    Caption = 'Weight';
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Price; Rec.Price)
                {
                    Caption = 'Price';
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(Picture; Rec.Picture)
                {
                    Caption = 'Picture';
                    ToolTip = 'Specifies the picture that has been inserted for the item.';
                }
                field("Info Link"; Rec."Info Link")
                {
                    Caption = 'Info link';
                    ToolTip = 'Specifies the value of the Info link field.';
                    trigger OnValidate()
                    var
                        Regex: Codeunit Regex;
                        UrlAdressIsBlankErr: Label 'You must provide a proper URL link';
                    begin
                        if not Regex.IsMatch(Rec."Info Link", '^(https?:\/\/)?([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})(\/\S*)?$') then
                            Error(UrlAdressIsBlankErr);

                    end;
                }

            }

            group(Nutritions)
            {
                Caption = 'Nutritions info (per 100g)';

                field("Fats (g)"; Rec.Fats)
                {
                    ToolTip = 'Specifies the value of the Fats (g) field.';
                }
                field("Carbs (g)"; Rec.Carbs)
                {
                    ToolTip = 'Specifies the value of the Carbs (g) field.';
                }
                field("Fiber (g)"; Rec.Fiber)
                {
                    ToolTip = 'Specifies the value of the Fiber (g) field.';
                }
                field("Protein (g)"; Rec.Protein)
                {
                    ToolTip = 'Specifies the value of the Protein (g) field.';
                }
                field(Calories; Rec.Calories)
                {
                    ToolTip = 'Specifies the value of the Calories field.';
                }

            }
        }
        area(factboxes)
        {
            part(ItemPicture; "Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("No.");
            }
        }
    }
}