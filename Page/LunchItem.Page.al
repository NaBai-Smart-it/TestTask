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

                field("Fats (g)";Rec.Fats)
                {
                }
                field("Carbs (g)";Rec.Carbs)
                {
                }
                field("Fiber (g)";Rec.Fiber)
                {
                }
                field("Protein (g)";Rec.Protein)
                {
                }
                field(Calories;Rec.Calories)
                {
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