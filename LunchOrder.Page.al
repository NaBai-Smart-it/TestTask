page 50402 LunchOrder
{
    Caption = 'Lunch Order';
    PageType = Worksheet;
    ApplicationArea = All;
    SourceTable = LunchMenu;
    CardPageId = LunchMenuCard;
    SourceTableTemporary = true;
    AutoSplitKey = true;
    
    layout
    {
        area(Content)
        {
            group(Control1)
            {
                ShowCaption = false;
                field("Menu Date"; MenuDate)
                {

                }
                field("Vendor No."; VendorNo)
                {
                    TableRelation = Vendor."No." where(LunchVendor = const(True));
                    trigger OnValidate()
                    begin
                        PopulateTempLunchMenuTable();
                    end;
                }
            }
            repeater(Control)
            {
                IndentationColumn = Rec.Identation;
                IndentationControls = Description;
                field("Line No.";Rec."Line No.")
                {
                    Editable = IsEditable;
                
                }
                field(Description;Rec.Description)
                {
                    StyleExpr = BoldTextStyle;
                    Editable = IsEditable;
                }
                field("Item No.";Rec."Item No.")
                {
                    TableRelation = Item."No." where("Vendor No." = field("Vendor No."));
                }
                field(Weight;Rec.Weight)
                {
                    Editable = IsEditable;
                }
                field(Price;Rec.Price)
                {
                    Editable = IsEditable;
                }
                field("Order Quantity";Rec."Order Quantity")
                {

                    trigger OnValidate()
                    begin
                        If(Rec."Line Type" = Rec."Line Type"::"Group Heading") then
                            Rec."Order Quantity" := 0;
                    end;
                }
                field("Line Type";Rec."Line Type")
                {

                }
                
    
            }
        }
    }
    
    actions
    {
        area(Navigation)
        {
            action(EditRecord)
            {
                Image = Edit;

                trigger OnAction()
                begin
                    Page.RunModal(Page::LunchMenuCard);
                end;
            }
        }
    }
    var 
        BoldTextStyle : Text;
        IsEditable : Boolean;
        TempLunchMenu : Record LunchMenu temporary;
        MenuDate: Date;
        VendorNo: Code[20];

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Line Type" := Rec."Line Type"::Item;
        BoldTextStyle := '';
        Rec.Identation := 3;//Whyyy
    end;
    trigger OnAfterGetRecord()
    begin
        if Rec."Line Type" = Rec."Line Type"::"Group Heading" then
        begin
            BoldTextStyle := 'Strong';
            isEditable := false;
        end
        else 
        begin
            BoldTextStyle := '';
            Rec.Identation := 3;
        end;

        IsEditable := Rec.Active;
        
    end;

//Codeunit
    procedure PopulateTempLunchMenuTable()
    var
        LunchMenuEnteries: Record LunchMenu;
    begin
        LunchMenuEnteries.Reset();
        LunchMenuEnteries.SetRange(LunchMenuEnteries."Menu Date", MenuDate);
        LunchMenuEnteries.SetRange(LunchMenuEnteries."Vendor No.", VendorNo);

        LunchMenuEnteries.FindSet();
        repeat
            Rec.Init();
            Rec."Line No." := LunchMenuEnteries."Line No.";
            Rec.Description := LunchMenuEnteries.Description;
            Rec."Menu Date" := LunchMenuEnteries."Menu Date";
            Rec."Vendor No." := LunchMenuEnteries."Vendor No.";
            Rec."Line Type" := LunchMenuEnteries."Line Type";
            Rec.Weight := LunchMenuEnteries.Weight;
            Rec.Price := LunchMenuEnteries.Price;
            Rec."Item No." := Rec."Item No.";
            Rec.Insert(false);
            
        until LunchMenuEnteries.Next() = 0;
    end;

    
}