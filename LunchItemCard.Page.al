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
                    Caption = 'Vendor No.';
                    TableRelation = Vendor."No." where(LunchVendor = const(true));
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
        }
    }

    
}