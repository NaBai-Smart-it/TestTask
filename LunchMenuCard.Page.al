page 50403 LunchMenuCard
{
    Caption = 'Lunch Menu Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = LunchMenu;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Line No."; Rec."Line No.")
                {

                }
                field("Menu Date"; Rec."Menu Date")
                {
                    ShowMandatory = true;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ShowMandatory = true;
                    LookupPageId = "Vendor List";
                }
                field("Line Type"; Rec."Line Type")
                {
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        if Rec."Line Type" = Rec."Line Type"::Item then
                            IsInsertingItemLine := true
                        else
                            IsInsertingItemLine := false;
                    end;
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = IsInsertingItemLine;
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



    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Self-Ordered" := RecordIsSelfOrder;
    end;

    var
        RecordIsSelfOrder: Boolean;
        IsInsertingItemLine: Boolean;

    procedure SetSelfOrder(SelfOrderStatus: Boolean)
    begin
        RecordIsSelfOrder := SelfOrderStatus;
    end;
}