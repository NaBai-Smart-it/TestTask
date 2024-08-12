page 50400 LunchItemCard
{
    Caption = ' Lunch Item Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = LunchItem;
    
    layout
    {
        area(Content)
        {
            group(ItemDetails)
            {
                Caption = 'Item Details';

                field("Vendor No.";Rec."Vendor No.")
                {
                    ShowMandatory = true;
                    Caption = 'Vendor No.';
                }
                field(Description;Rec.Description)
                {
                    ShowMandatory = true;
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
                    trigger OnValidate()
                    var
                        Regex: Codeunit Regex;
                        ErrorMes : Label 'You must provide a proper URL link';
                    begin
                        if not Regex.IsMatch(Rec."Info Link", '^(https?:\/\/)?([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})(\/\S*)?$') then
                        begin
                            Error(ErrorMes);
                        end;
                    end;
                }
                
            }

            group(Nutritions)
            {
                Caption = 'Nutritions info (per 100g)';

                field("Fats (g)";Rec."Fats (g)")
                {
                    Caption = 'Fats (g)';
                }
                field("Carbs (g)";Rec."Carbs (g)")
                {
                    Caption = 'Carbs (g)';
                }
                field("Fiber (g)";Rec."Fiber (g)")
                {
                    Caption = 'Fiber (g)';
                }
                field("Protein (g)";Rec."Protein (g)")
                {
                    Caption = 'Protein (g)';
                }
                field(Calories;Rec.Calories)
                {
                    Caption = 'Calories';
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
        }
    }
}