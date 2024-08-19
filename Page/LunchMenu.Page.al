page 50405 "Lunch Menu"
{
    Caption = 'Lunch Menu';
    UsageCategory = Lists;
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Lunch Menu";
    CardPageId = "Lunch Menu Card";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater("Lunch Menu")
            {
                Caption = 'Lunch Menu';

                IndentationColumn = Rec.Identation;
                IndentationControls = Description;

                field(Description; Rec.Description)
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Menu Date"; Rec."Menu Date")
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Menu Date field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(Weight; Rec.Weight)
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Price; Rec.Price)
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Price field.';
                }
                field(Active; Rec.Active)
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field("Menu Item Entry No."; Rec."Menu Item Entry No.")
                {
                    StyleExpr = BoldTextStyle;
                    ToolTip = 'Specifies the value of the Menu Item Entry No. field.';
                }
            }
        }
        area(factboxes)
        {
            part(ItemPicture; "Lunch Item Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = field("Item No.");
            }
            part(ItemStats; "Nutritions Pie Chart")
            {
                ApplicationArea = All;
                Caption = 'Nutritions Info';
                SubPageLink = "No." = field("Item No.");
            }
            part(InfoLink; "Lunch Item Info")
            {
                Caption = 'Info link';
                ApplicationArea = All;
                SubPageLink = "No." = field("Item No.");
            }
        }
    }

    var
        BoldTextStyle: Text;

    trigger OnAfterGetRecord()
    begin
        if Rec."Line Type" = Rec."Line Type"::"Group Heading" then
            BoldTextStyle := 'Strong'
            else
            BoldTextStyle := '';
    end;

    trigger OnOpenPage()
    begin
        CurrPage.ItemPicture.Page.SetHideActions();
    end;


}