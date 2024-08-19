page 50403 "Lunch Menu Card"
{
    //do i need to add usage category to card pages
    Caption = 'Lunch Menu Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Lunch Menu";

    layout
    {
        area(Content)
        {
            group("Lunch Menu")
            {
                Caption = 'Lunch Menu';
                field("Line No."; Rec."Line No.")
                {
                    ShowMandatory = true;
                }
                field("Menu Date"; Rec."Menu Date")
                {
                    ShowMandatory = true;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ShowMandatory = true;
                }
                field("Line Type"; Rec."Line Type")
                {
                    ShowMandatory = true;
                    trigger OnValidate()
                    var
                        LunchItem: Record "Lunch Item";
                    begin
                        if (Rec."Line Type" = Rec."Line Type"::"Group Heading") then begin
                            IsInsertingItemLine := false;
                            Rec."Item No." := '';
                            Rec.Weight := 0;
                            Rec.Price := 0;
                            Rec.Active := false;
                        end else begin
                            IsInsertingItemLine := true;
                            Rec.Identation := 3;
                            Rec.Active := true;
                        end
                    end;
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = IsInsertingItemLine;

                    trigger OnValidate()
                    begin
                        FillItemRelatedFields()
                    end;
                }
                field(Description; Rec.Description)
                {
                    ShowMandatory = true;
                }
                field(Weight; Rec.Weight)
                {
                    Editable = IsInsertingItemLine;
                }
                field(Price; Rec.Price)
                {
                    Editable = IsInsertingItemLine;
                }
            }
        }
    }

    var
        IsInsertingItemLine: Boolean;


    trigger OnOpenPage()
    begin
        IsInsertingItemLine := (Rec."Line Type" = Rec."Line Type"::Item);
    end;
    

    local procedure FillItemRelatedFields()
    var
        LunchItem: Record "Lunch Item";
        NoSuchItemText: Label 'No such Item in a datbase, pleas try again.';
    begin
        if (Rec."Item No." <> '') then begin
            if LunchItem.Get(Rec."Item No.") then begin
                Rec.Description := LunchItem.Description;
                Rec.Weight := LunchItem.Weight;
                Rec.Price := LunchItem.Price;
            end else begin
                Message(NoSuchItemText);
                Rec."Item No." := '';
            end;
        end
    end;

}