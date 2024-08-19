page 50403 "Lunch Menu Card"
{
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
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Menu Date"; Rec."Menu Date")
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Menu Date field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Line Type field.';
                    trigger OnValidate()
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
                    ToolTip = 'Specifies the value of the Item No. field.';

                    trigger OnValidate()
                    begin
                        FillItemRelatedFields()
                    end;
                }
                field(Description; Rec.Description)
                {
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Weight; Rec.Weight)
                {
                    Editable = IsInsertingItemLine;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Price; Rec.Price)
                {
                    Editable = IsInsertingItemLine;
                    ToolTip = 'Specifies the value of the Price field.';
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
        NoSuchItemMsg: Label 'No such Item in a datbase, pleas try again.';
    begin
        if (Rec."Item No." <> '') then 
            if LunchItem.Get(Rec."Item No.") then begin
                Rec.Description := LunchItem.Description;
                Rec.Weight := LunchItem.Weight;
                Rec.Price := LunchItem.Price;
            end else begin
                Message(NoSuchItemMsg);
                Rec."Item No." := '';
            end
    end;

}