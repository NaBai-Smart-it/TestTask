page 50405 LunchMenuList
{
    Caption = 'Lunch Menu List';
    UsageCategory = Lists;
    PageType = List;
    ApplicationArea = All;
    SourceTable = LunchMenu;
    CardPageId = LunchMenuCard;
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
                
                field(Description;Rec.Description)
                {
                    StyleExpr = BoldTextStyle;
                }
                field("Line No.";Rec."Line No.")
                {
                    StyleExpr = BoldTextStyle;
                }
                field("Menu Date";Rec."Menu Date")
                {
                    StyleExpr = BoldTextStyle;
                }
                field("Vendor No.";Rec."Vendor No.")
                {
                    StyleExpr = BoldTextStyle;
                }
                field("Item No.";Rec."Item No.")
                {
                    StyleExpr = BoldTextStyle;
                }
                field(Weight;Rec.Weight)
                {
                    StyleExpr = BoldTextStyle;
                }
                field(Price;Rec.Price)
                {
                    StyleExpr = BoldTextStyle;
                }
                field(Active;Rec.Active)
                {
                    StyleExpr = BoldTextStyle;
                }
                field("Line Type";Rec."Line Type")
                {
                    StyleExpr = BoldTextStyle;
                }
                field("Menu Item Entry No.";Rec."Menu Item Entry No.")
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
            }
            part(InfoLink; ItemInfoFactBox)
            {
                Caption = 'Info link';
                ApplicationArea = All;
                SubPageLink = "No." = field("Item No.");
            }
        }
    }

    var 
        BoldTextStyle : Text;
        isEditable : Boolean;

    trigger OnAfterGetRecord()
    begin
        if Rec."Line Type" = Rec."Line Type"::"Group Heading" then
        begin
            BoldTextStyle := 'Strong';
            isEditable := false;
        end else 
            BoldTextStyle := '';
    end;

    trigger OnOpenPage()
    begin
        CurrPage.ItemPicture.Page.SetHideActions();
    end;


}