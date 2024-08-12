page 50402 LunchOrder
{
    Caption = 'Lunch Order';
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = LunchMenu;
    CardPageId = LunchMenuCard;
    SourceTableTemporary = true;
    AutoSplitKey = true;
    InsertAllowed = false;
    
    layout
    {
        area(Content)
        {
            group(Control1)
            {
                ShowCaption = false;
                field("Menu Date"; MenuDate)
                {
                    Editable = false;
                }
                field("Vendor No."; VendorNo)
                {
                    TableRelation = Vendor."No." where(LunchVendor = const(True));
                    trigger OnValidate()
                    var
                    begin
                        PopulateTable();
                    end;
                }
            }
            repeater(Control)
            {
                ShowAsTree = true;
                TreeInitialState = ExpandAll;
                IndentationColumn = Rec.Identation;
                IndentationControls = Description;
                field(Description;Rec.Description)
                {
                    StyleExpr = BoldTextStyle;
                    Editable = false;
                }
                field("Line No.";Rec."Line No.")
                {
                    StyleExpr = BoldTextStyle;
                    Editable = false;
                }
                field("Item No.";Rec."Item No.")
                {
                    StyleExpr = BoldTextStyle;
                    Editable = false;
                }
                field(Weight;Rec.Weight)
                {
                    StyleExpr = BoldTextStyle;
                    Editable = false;
                }
                field(Price;Rec.Price)
                {
                    StyleExpr = BoldTextStyle;
                    Editable = false;
                }
                field("Order Quantity";Rec."Order Quantity")
                {
                    StyleExpr = BoldTextStyle;
                    Editable = IsEditable;
                }
                field("Order Amount";Rec."Order Amount")
                {
                    StyleExpr = BoldTextStyle;
                    Editable = false;
                }
                field("Line Type";Rec."Line Type")
                {
                    StyleExpr = BoldTextStyle;
                }
                
    
            }
        }
        area(factboxes)
        {
            part(ItemPicture; ItemPictureFactBox)
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("Item No.");
            }
            part(ItemStats; NutritionsPieChart)
            {
                ApplicationArea = All;
                Caption = 'Nutritions Info';
                SubPageLink = "No." = field("Item No.");
                UpdatePropagation = Both;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    var 
        BoldTextStyle : Text;
        IsEditable : Boolean;
        MenuDate: Date;
        VendorNo: Code[20];

    trigger OnOpenPage()
    var
        LunchOrderCodeunit : Codeunit LunchOrderMenger;
    begin
        MenuDate := LunchOrderCodeunit.GetMaxMenuDate();
        CurrPage.ItemPicture.Page.SetHideActions();
    end;

    trigger OnQueryClosePage(CloseAction: Action) : Boolean
    var
        EndOfOperation: Boolean;
        ConfirmationOrderText: Label 'Confirm Order?';
        LunchOrderEntery: Record LunchOrderEntry;
        LunchOrderMeneger : Codeunit LunchOrderMenger;
    begin
        if Confirm(ConfirmationOrderText, false) then begin
            Rec.SetAutoCalcFields(Rec."Prewies Quantity");

            if Rec.FindSet() then
                repeat
                    if (Rec."Order Quantity" <> Rec."Prewies Quantity") then begin

                        LunchOrderEntery.Reset();
                        LunchOrderEntery.SetRange(LunchOrderEntery."Order Date", Rec."Menu Date");
                        LunchOrderEntery.SetRange(LunchOrderEntery."Vendor No.", Rec."Vendor No.");
                        LunchOrderEntery.SetRange(LunchOrderEntery."Menu Item No.", Rec."Item No.");
                        LunchOrderEntery.SetRange(LunchOrderEntery."Menu Item Entry No.", Rec."Menu Item Entry No.");
                        LunchOrderEntery.SetRange(LunchOrderEntery."Resourse No.", UserId());

                        if not LunchOrderEntery.FindFirst() then begin
                            LunchOrderEntery.Init();
                            LunchOrderEntery.Validate(LunchOrderEntery."Entry No.", LunchOrderMeneger.GetNextEntryNo());
                            AssignValues(LunchOrderEntery, Rec);
                            LunchOrderEntery.Validate(Status, LunchOrderEntery.Status::Created);
                            if(LunchOrderEntery.Insert(true)) then
                                Message('Record %1 inserted', Rec.Description)
                            else
                                Message('Record %1 was NOT inserted', Rec.Description);
                        end else begin

                            if Rec."Order Quantity" = 0 then begin
                                if LunchOrderEntery.Delete(true) then
                                    Message('Record %1 deleted', Rec.Description)
                                else
                                    Message('Record %1 was NOT deleted', Rec.Description)
                            end else begin
                                AssignValues(LunchOrderEntery, Rec);

                                if(LunchOrderEntery.Modify(true)) then
                                    Message('Record %1 Modified', Rec.Description)
                                else
                                    Message('Record %1 Was NOT Modified', Rec.Description)
                            end;
                        end;
                    end;
                until Rec.Next() = 0;
        end;
    end;

    local procedure AssignValues(var LunchOrderEntery: Record LunchOrderEntry; var TempLunchOrderEnteries: Record LunchMenu)
    begin
        LunchOrderEntery.Validate("Item Description", TempLunchOrderEnteries.Description);
        LunchOrderEntery.Validate("Menu Item Entry No.", TempLunchOrderEnteries."Menu Item Entry No.");
        LunchOrderEntery.Validate("Menu Item No.", TempLunchOrderEnteries."Item No.");
        LunchOrderEntery.Validate("Order Date", TempLunchOrderEnteries."Menu Date");
        LunchOrderEntery.Validate(Price, TempLunchOrderEnteries.Price);
        LunchOrderEntery.Validate(Amount, TempLunchOrderEnteries."Order Amount");
        LunchOrderEntery.Validate(Quantity, TempLunchOrderEnteries."Order Quantity");
        LunchOrderEntery.Validate("Resourse No.", UserId());
        LunchOrderEntery.Validate("Vendor No.", TempLunchOrderEnteries."Vendor No.");
    end;
    
    local procedure PopulateTable()
    var
        LunchOrderCodeunit: Codeunit LunchOrderMenger;
    begin
        LunchOrderCodeunit.PopulateTempLunchMenuTable(VendorNo, MenuDate, Rec);
        CurrPage.Update(false);
    end;
    
    trigger OnAfterGetRecord()
    var 
        LunchOrderCodeunit: Codeunit LunchOrderMenger;
    begin
        if Rec."Line Type" = Rec."Line Type"::"Group Heading" then
            BoldTextStyle := 'Strong'
        else 
            BoldTextStyle := '';

        MenuDate := LunchOrderCodeunit.GetMaxMenuDate();
        IsEditable := Rec.Active;
    end;
}