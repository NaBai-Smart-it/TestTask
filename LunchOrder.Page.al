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
                        // Message('no of records Before population -> %1', Rec.Count());
                        PopulateTable();
                        // Message('no of records After population -> %1', Rec.Count());
                        // PopulateTempLunchMenuTable()
                    end;
                }
            }
            repeater(Control)
            {
                // ShowAsTree = true;
                // TreeInitialState = ExpandAll;
                IndentationColumn = Rec.Identation;
                IndentationControls = Description;
                field("Line No.";Rec."Line No.")
                {
                    Editable = false;
                }
                field(Description;Rec.Description)
                {
                    StyleExpr = BoldTextStyle;
                    Editable = false;
                }
                field("Item No.";Rec."Item No.")
                {
                    
                }
                field(Weight;Rec.Weight)
                {
                    Editable = false;
                }
                field(Price;Rec.Price)
                {
                    Editable = false;
                }
                field("Order Quantity";Rec."Order Quantity")
                {
                    Editable = IsEditable;
                }
                field("Order Amount";Rec."Order Amount")
                {
                    Editable = false;
                }
                field("Line Type";Rec."Line Type")
                {

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
        }
    }
    
    
    actions
    {
        area(Navigation)
        {
            
            action(ComposeMenu)
            {
                Caption = 'Compose Menu';
                Image = New;
                RunPageMode = View;
                RunObject = Page LunchMenuList;
                trigger OnAction()
                begin
                end;
            }

            // action("Self-Order")
            // {
            //     Caption = 'Self-Order';
            //     Image = NewOrder;
            //     trigger OnAction()
            //     var
            //         LunchMenuCard : Page LunchMenuCard;
            //     begin
            //         LunchMenuCard.SetSelfOrder(true);
            //         LunchMenuCard.
            //         LunchMenuCard.SetSelfOrder(false);
            //     end;
            // }
            
        }
    }

    var 
        BoldTextStyle : Text;
        IsEditable : Boolean;
        MenuDate: Date;
        VendorNo: Code[20];

    trigger OnOpenPage()
    var
        LunchOrderCodeunit : Codeunit LunchOrderMeneger;
    begin
        MenuDate := LunchOrderCodeunit.GetMaxMenuDate();
    end;

    trigger OnQueryClosePage(CloseAction: Action) : Boolean
    var
        UserResponse: Boolean;
        ConfirmationOrderText: Label 'Confirm Order?';
        LunchOrderEntery: Record LunchOrderEntry;
        iter: Integer;
    begin
        if Confirm(ConfirmationOrderText, false) then 
        begin

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

                        if not LunchOrderEntery.FindFirst() then 
                        begin

                            LunchOrderEntery.Init();
                            LunchOrderEntery.Validate("Item Description", Rec.Description);
                            LunchOrderEntery.Validate("Menu Item Entry No.", Rec."Menu Item Entry No.");
                            LunchOrderEntery.Validate("Menu Item No.", Rec."Item No.");
                            LunchOrderEntery.Validate("Order Date", Rec."Menu Date");
                            LunchOrderEntery.Validate(Price, Rec."Order Amount");
                            LunchOrderEntery.Validate(Quantity, Rec."Order Quantity");
                            LunchOrderEntery.Validate("Resourse No.", UserId());
                            LunchOrderEntery.Validate("Vendor No.", Rec."Vendor No.");
                            LunchOrderEntery.Validate(Status, LunchOrderEntery.Status::Created);
                            if(LunchOrderEntery.Insert(false)) then
                                Message('Record %1 inserted', Rec.Description)
                            else
                                Message('Record %1 was NOT inserted', Rec.Description);
                        end 
                        else
                        begin
                            
                            LunchOrderEntery."Item Description" := Rec.Description;
                            LunchOrderEntery."Menu Item Entry No." := Rec."Menu Item Entry No.";
                            LunchOrderEntery."Menu Item No." := Rec."Item No.";
                            LunchOrderEntery."Order Date" := Rec."Menu Date";
                            LunchOrderEntery.Price := Rec."Order Amount";
                            LunchOrderEntery.Quantity := Rec."Order Quantity";
                            LunchOrderEntery."Resourse No." := UserId();
                            LunchOrderEntery.Validate("Vendor No.", Rec."Vendor No.");
                            if(LunchOrderEntery.Modify(true)) then
                                Message('Record %1 Modified', Rec.Description)
                            else
                                Message('Record %1 Was NOT Modified0', Rec.Description);
                        end;
                    end;
                until Rec.Next() = 0;
        end;
    end;
    
    procedure PopulateTable()
    var
        LunchOrderCodeunit: Codeunit LunchOrderMeneger;
    begin
        Message('Proc');
        LunchOrderCodeunit.PopulateTempLunchMenuTable(VendorNo, MenuDate, Rec);
    end;
    
    trigger OnAfterGetRecord()
    var 
        LunchOrderCodeunit: Codeunit LunchOrderMeneger;
    begin
        if Rec."Line Type" = Rec."Line Type"::"Group Heading" then
            BoldTextStyle := 'Strong'
        else 
        begin
            BoldTextStyle := '';
        end;

        MenuDate := LunchOrderCodeunit.GetMaxMenuDate();
        IsEditable := Rec.Active;
    end;

// //Codeunit
//     procedure PopulateTempLunchMenuTable()
//     var
//         LunchMenuEnteries: Record LunchMenu;
//     begin
//         rec.DeleteAll(false);
//         LunchMenuEnteries.Reset();
//         LunchMenuEnteries.SetRange(LunchMenuEnteries."Menu Date", MenuDate);
//         LunchMenuEnteries.SetRange(LunchMenuEnteries."Vendor No.", VendorNo);


//         LunchMenuEnteries.FindSet();
//         repeat
//             Rec.Init();
//             Rec."Line No." := LunchMenuEnteries."Line No.";
//             Rec.Description := LunchMenuEnteries.Description;
//             Rec."Menu Date" := LunchMenuEnteries."Menu Date";
//             Rec."Vendor No." := LunchMenuEnteries."Vendor No.";
//             Rec."Line Type" := LunchMenuEnteries."Line Type";
//             Rec.Weight := LunchMenuEnteries.Weight;
//             Rec.Price := LunchMenuEnteries.Price;
//             Rec."Item No." := LunchMenuEnteries."Item No.";
//             Rec.Active := LunchMenuEnteries.Active;
//             Rec."Menu Item Entry No." := LunchMenuEnteries."Menu Item Entry No.";
//             Rec.Identation := LunchMenuEnteries.Identation;
//             Rec.Insert(false)
            
//         until LunchMenuEnteries.Next() = 0;

//         Rec.FindSet();
//         repeat
//         until Rec.Next() = 0;
//     end;

    
}